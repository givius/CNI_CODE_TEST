define([
  'backbone',
  'models/article'
], function(Backbone, Article){
  return Backbone.Collection.extend({
    url: '/cniAdmin/article',
    model: Article
  });
});