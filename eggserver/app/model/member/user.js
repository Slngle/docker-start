'use strict';

module.exports = app => {
  const { DATE, STRING, UUID, BIGINT } = app.Sequelize;
  return app.memberModel.define('user', {
    /**
     * @desc userId
     */
    id: {
      type: UUID,
      primaryKey: true,
      allowNull: false,
    },
    /**
     * @desc 用户名
     */
    user_name: STRING(64),
    /**
     * @desc 手机号
     */
    mobile: STRING(11),
    /**
     * @desc 密码
     */
    password: STRING(255),
    /**
     * @desc 开放平台唯一ID
     */
    union_id: STRING(64),
    /**
     * @desc 微信唯一ID
     */
    open_id: STRING(64),
    /**
     * @desc 头像
     */
    head_portrait: STRING(255),
    /**
     * @desc 生日
     */
    birthday: DATE,
    /**
     * @desc 详细地址
     */
    address: STRING(64),
    /**
     * @desc 省
     */
    province: STRING(32),
    /**
     * @desc 市
     */
    city: STRING(32),
    /**
     * @desc 区
     */
    area: STRING(32),
    /**
     * @desc 性别
     */
    gender: BIGINT(8),
    /**
     * @desc 身份类别(1.买家，2.卖家)
     */
    user_type: BIGINT(8),
    /**
     * @desc 身份状态(1.正常，0注销)
     */
    is_deleted: BIGINT(8),
    created_at: DATE,
    updated_at: DATE,
  }, {
    freezeTableName: true,
    tableName: 'user',
    underscored: true,
  });
};
