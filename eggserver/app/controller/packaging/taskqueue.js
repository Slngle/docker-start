'use strict';

const Controller = require('egg').Controller;

class TaskqueueController extends Controller {
  async getTaskqueue() {
    const { ctx, service } = this;
    const params = ctx.query;
    const taskList = await service.packaging.taskqueue.getTaskqueue();
    ctx.body = {
      success: true,
      data: taskList,
    };
  }
}

module.exports = TaskqueueController;
