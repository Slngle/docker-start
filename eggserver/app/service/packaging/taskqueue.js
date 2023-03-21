'use strict';

const Service = require('egg').Service;

class TaskqueueService extends Service {
  async getTaskqueue() {
    const { ctx } = this;
    try {
      const entry = await ctx.packagingModel.Taskqueue.findAll();
      return {
        success: true,
        user: entry,
      };
    } catch (e) {
      throw new Error(e);
    }
  }
}

module.exports = TaskqueueService;
