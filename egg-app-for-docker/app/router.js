/**
 * @param {Egg.Application} app - egg application
 */
module.exports = (app) => {
  const {router, controller} = app;
  router.get('/boom', controller.home.boom);
  router.get('/health', controller.home.health);
};
