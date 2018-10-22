import Sequelize from 'sequelize';

export default (sequelize, Datatypes) => {
	return sequelize.define(
		'scavengerescape',

		{
			created_at: {
				field: 'created_at',
				type : Sequelize.DATE,
			},

			date: {
				field: 'date',
				type : Sequelize.DATE,
			},

			deleted_at: {
				field: 'deleted_at',
				type : Sequelize.DATE,
			},

			hour: {
				field: 'hour',
				type : Sequelize.TIME,
			},

			id: {
				autoIncrement: true,
				primaryKey   : true,
				type         : Datatypes.INTEGER,
			},

			name     : Datatypes.STRING(512),
			rate     : Datatypes.JSON,
			room     : Datatypes.INTEGER,
			team_size: Datatypes.STRING(64),

			updated_at: {
				field: 'updated_at',
				type : Sequelize.DATE,
			},
		},

		{
			freezeTableName: true,
			paranoid       : true,
			tableName      : 'scavengerescape',
			timestamps     : false,
			underscored    : true,
		});
};

// CREATE TABLE scavengerescape (
//  id serial PRIMARY KEY,
//  date date NULL DEFAULT NULL,
//  hour time NULL DEFAULT NULL,
// 	name varchar(512) NOT NULL,
// 	rate json,
// 	room integer,
// 	team_size varchar(64),
// 	created_at timestamp NULL DEFAULT NULL,
// 	deleted_at timestamp NULL DEFAULT NULL,
// 	updated_at timestamp NULL DEFAULT NULL
// );



