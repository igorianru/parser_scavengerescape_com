import _ from 'lodash';
import phantom from 'phantom';
import {JSDOM} from 'jsdom';
import {decodeHtmlspecialChars} from 'generic/helpers';
import {env as envJSDOM} from 'jsdom/lib/old-api';
import jquery from 'jquery';
import moment from 'moment';
import models from 'generic/models';
import 'babel-polyfill';

const

	/*eslint-disable sort-vars  */
	/**
	 * Function Update or Insert rows.
	 *
	 * @param data Object
	 */
	updateOrInsert = data => {
		var
			rooms = data.rooms;

		for(var i0 = 0; rooms.length > i0; i0++) {
			let
				room = rooms[i0];

			for(var i = 0; ((room || {}).hour || {}).length > i; i++) {
				let
					rate = 'booked';

				for(let ii = 0; ((room.rate || {})[i] || {}).length > ii; ii++) {
					if(room.rate[i][ii].price == room.team_size[i])
						rate = room.rate[i][ii];
				}

				const
					getEvent = object => models.execute(`
						SELECT "scavengerescape".* FROM "scavengerescape" 
						 WHERE "date" = '${object.date}'
						  AND "hour" = '${object.hour}:00'
						  AND "room" = '${object.room}';
				`)
						.then(objData => {
							// create or update table row
							if(_.get(objData, 'rows.0.id'))
								models.scavengerescapeModel.update(
									_.merge(object, {updated_at: Date.now()}),
									{where: {id: _.get(objData, 'rows.0.id')}},
								).then(() => {});
							else
								models.scavengerescapeModel.create(	_.merge(object, {created_at: Date.now()})).then(() => {});
						});

				getEvent({
					date     : data.date,
					hour     : room.hour[i],
					name     : room.name,
					rate     : rate,
					room     : i0 + 1,
					team_size: room.team_size[i],
				});
			}
		}
	},

	/**
	 * Function Parser.
	 *
	 * @param req
	 * @param res
	 */
	index = (req, res) => {
		let
			url = 'https://scavengerescape.com/booking/vienna/en/openings/';

		const
			getPage = async function(date) {
				const instance = await phantom.create();
				const page = await instance.createPage();

				await page.on('onResourceRequested', requestData => {
					console.info('Requesting', requestData.url);
				});

				await page.on('onUrlChanged', targetUrl => {
					console.log('New URL: ' + targetUrl);
				});

				await page.open(`${url}${date}`);
				const content = await page.property('content');
				await parse(content, instance, date);
				await instance.exit();
			};

		const
			parse = (html, ins, date) => {
				const
					dom = new JSDOM(html, {includeNodeLocations: true});

				global.HTMLElement = dom.window.HTMLElement;
				var pageDay = jquery(dom.window)('pre').html();

				try {
					pageDay = JSON.parse(decodeHtmlspecialChars(pageDay));
				} catch(e) {
					pageDay = {};
				}

				let
					resultObj = {rooms: []};

				envJSDOM(pageDay.content.toString(), [
					'http://code.jquery.com/jquery-1.5.min.js',
				],

				(errors, window) => {
					const
						$ = window.$;

					$.each($('.room-name'), (K, V) => {
						// parse name Room
						resultObj.rooms.push({hour: [], name: $(V).text().trim(), rate: [], team_size: []});

						// parse Time
						$.each($(V).parent().find('table .opening-time-wrap > .opening-time'), (KK, VV) => {
							resultObj.rooms[K].hour.push($(VV).text().trim())
						});

						// parse Price
						$.each($(V).parent().find('table .current-price > .price'), (KK, VV) => {
							resultObj.rooms[K].team_size.push($(VV).text().trim().split(' ')[0]);

							// parse rate
							$.each($($(V).parent().find('table .prices .dropdown-menu')[KK]).find('li'), (KK2, VV2) => {
								if(!resultObj.rooms[K].rate[KK])
									resultObj.rooms[K].rate[KK] = [];

								resultObj.rooms[K].rate[KK].push({
									player_number: $(VV2).find('.player_number').text(),
									price        : $(VV2).find('.price').text().trim().split(' ')[0],
								});
							});
						});
					});

					resultObj.date = date;
					updateOrInsert(resultObj);

					// output `/date/room/time`
					if(req.params.time && req.params.id) {
						var room = resultObj.rooms[req.params.id];

						for(var i = 0; ((room || {}).hour || {}).length > i; i++)
							if(room.hour[i] == req.params.time) {
								var rate = 'booked';

								for(var ii = 0; ((room.rate || {})[i] || {}).length > ii; ii++) {
									if(room.rate[i][ii].price == room.team_size[i])
										rate = room.rate[i][ii];
								}

								return res.json({
									hour     : room.hour[i],
									name     : room.name,
									rate     : rate,
									team_size: room.team_size[i],
								});
							}
					}

					// output `/date/room` else `output /date/`
					if(req.params.id)
						return res.json(resultObj.rooms[req.params.id]);
					else
						return res.json(resultObj);
				});
			};

		if(req.params.date)
			return getPage(req.params.date);
		else
			return getPage(moment().format('YYYY-MM-DD'));
	};
/*eslint-enable sort-vars  */

export default {index}
