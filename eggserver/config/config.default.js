/* eslint valid-jsdoc: "off" */

'use strict';

const configDataBase = require('./mysql/config.js');

/**
 * @param {Egg.EggAppInfo} appInfo app info
 */
module.exports = appInfo => {
    /**
     * built-in config
     * @type {Egg.EggAppConfig}
     **/
    const config = exports = {};

    if (process.env.EGG_ENV === 'prod') {
        config.cluster = {
            listen: {
                path: '',
                port: 7002
            }
        }
    } else {
        config.cluster = {
            listen: {
                path: '',
                port: 7001
            }
        }
    }

    // use for cookie sign key, should change to your own and keep security
    config.keys = appInfo.name + '_1575280478097_500';

    // add your middleware config here
    config.middleware = [];

    // add your user config here
    const userConfig = {
        // myAppName: 'egg',
    };
    config.sequelize = {
        datasources: [{
            delegate: 'memberModel',
            baseDir: 'model/member',
            dialect: 'mysql',
            host: process.env.EGG_ENV === 'prod' ? 'mysqlserver-prod' : 'mysqlserver-dev',
            port: process.env.EGG_ENV === 'prod' ? configDataBase.EGG_MYSQL_PORT_PROD : configDataBase.EGG_MYSQL_PORT_DEV,
            database: 'member',
            username: configDataBase.EGG_MYSQL_USERNAME,
            password: configDataBase.EGG_MYSQL_PASSWORD,
        }, {
            delegate: 'packagingModel',
            baseDir: 'model/packaging',
            dialect: 'mysql',
            host: process.env.EGG_ENV === 'prod' ? 'mysqlserver-prod' : 'mysqlserver-dev',
            port: process.env.EGG_ENV === 'prod' ? configDataBase.EGG_MYSQL_PORT_PROD : configDataBase.EGG_MYSQL_PORT_DEV,
            database: 'packaging',
            username: configDataBase.EGG_MYSQL_USERNAME,
            password: configDataBase.EGG_MYSQL_PASSWORD,
        }],
    };


    return {
        ...config,
        ...userConfig,
    };
};
