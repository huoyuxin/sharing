const {Controller} = require('egg');

class HomeController extends Controller {
  async boom() {
    const {ctx} = this;
    ctx.body = 'hi, egg\n';
    setTimeout(() => process.exit(-1), 1000);
  }
  async health() {
    const {ctx} = this;
    ctx.body = 'hi, health\n';
  }
}

module.exports = HomeController;
