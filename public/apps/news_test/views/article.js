define([
  'underscore',
  'backbone'
], function(_, Backbone){
  return Backbone.View.extend({
    className: 'cni-article',
    initialize: function(opts = {}) {
      this.render(opts)
    },

    render: function(opts = {}) {
      this.$el
        .appendTo(opts.$container)
        .html( opts.template( this.model.toJSON() ));
    }
  });
});