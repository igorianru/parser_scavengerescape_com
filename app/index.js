import Client from './Client/index';
import {combineRoute} from 'generic/helpers';
import toRender from 'generic/toRender';
import express from 'express'

const
	app = express(),
	error404 = (req, res) => res.render('site/error/404', {message: 'Error 404', title: 'Error 404'}),

	error500 = (err, req, res, next) => {
		/* istanbul ignore next */
		if(app.get('env') === 'development')
			res.status(500).render(err);
		else {
			console.error(err);
			res.status(500).render('site/error/500');
		}

		next();
	},

	index = toRender,
	routes = combineRoute([Client.routes]);

export default {error404, error500, index, routes}
