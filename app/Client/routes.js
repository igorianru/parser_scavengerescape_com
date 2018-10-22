import {combineRoute} from 'generic/helpers';
import routesParser from './Parser';

export default combineRoute(
	[
		routesParser.routes,
	]);
