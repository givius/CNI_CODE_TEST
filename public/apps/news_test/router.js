define([
  'backbone',
  'views/index'
], function(Backbone, IndexView){
  return Backbone.Router.extend({
    routes: {
      '*splat': 'index',
    },

    initialize: function() {
      Backbone.history.start();
    },

    index: function(){
      if (this.index_view) {
        this.index_view.show();
      } else {
        this.index_view = new IndexView({el: '#cni-main'})
      }
    }
  });
});