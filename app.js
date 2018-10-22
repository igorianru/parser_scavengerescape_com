import bodyParser from 'body-parser';
import cookieParser from 'cookie-parser';
import path from 'path';
import express from 'express';
import indexApp from 'app/index';
import dotenv from 'dotenv';
import cookieSession from 'cookie-session';
import flash from 'connect-flash';

const
	app = express(),
	env = dotenv.config(),
	routers = express.Router();

// replace empty stack on to all routes
routers.stack = indexApp.routes.stack;

app.use(cookieSession(
	{
		cookie           : {maxAge: 60000},
		resave           : false,
		saveUninitialized: false,
		secret           : 'woot',
	},
));

// подключение livereload
if(app.get('env') === 'development') app.use(require('connect-livereload')());

app.use(flash());
app.use(express.static('app/assets/public')); // static files
app.use(bodyParser.json()); // for parsing application/json
app.use(bodyParser.urlencoded({extended: true})); // for parsing application/x-www-form-urlencoded
app.use(cookieParser());

// configure views path
app.set('views', path.join(__dirname,'/app/assets/views'));

// app init
app.use(indexApp.index);
app.use(routers);

app.listen(8030);
export default app;
