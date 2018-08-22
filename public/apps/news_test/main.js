// RequireJS configurations
require.config({
  paths: {
    // app resources
    models: '/src/models',
    collections: '/src/collections',

    // JS libs
    underscore: '/src/libs/underscore-min',
    backbone: '/src/libs/backbone-min',
    jquery: '/src/libs/jquery-1.9.1.min',
    moment: 'src/libs/moment.min',

    // local libs and tools
  },
  shim: {
    // JS libs
    underscore: {
      exports: '_'
    },
    backbone: {
      exports: 'Backbone',
      deps: ['underscore', 'jquery']
    },
    jquery: {
      exports: '$'
    },
    moment: {
      exports: 'moment'
    }
  }
});

// Start the app
require([
  'router'
], function(Router){
  new Router();
});