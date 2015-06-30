module.exports = function(config) {
  config.set({
    browsers: ['Firefox'],
    files: [
      '../app/assets/javascripts/vendor/jquery.js',
      '../app/assets/javascripts/*.js',
      'javascripts/helpers/*.js',
      'javascripts/**/*.js'
    ],
    frameworks: ['jasmine'],
    singleRun: true
  });
};
