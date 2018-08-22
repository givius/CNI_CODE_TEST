define([
  'backbone',
  'methods'
], function(Backbone, Methods){
  return Backbone.View.extend({
    events: {
      'click button': 'latestNews',
      'keyup input': 'doSearch'
    },

    initialize: function() {
      this.$spinner = this.$('#cni-spinner');
      this.$search = this.$('input');
      this.latestNews();
    },

    latestNews: function () {
      Methods.fetchLatestNews(this.collection, this.$spinner);
    },

    doSearch: function () {
      Methods.doSearch(this.$search.val(), this.collection, this.$spinner);
    }
  });
});