define([
  'underscore',
  'backbone',
  'views/top_bar',
  'views/article',
  'collections/articles',
], function(_, Backbone, TopBarView, ArticleView, Articles){
  return Backbone.View.extend({
    initialize: function() {
      let self = this;
      // create the main articles collection
      this.collection = new Articles();
      this.listenTo(this.collection, 'reset', this.renderArticles)
      // get the articles template before render the UI
      $.get('/apps/news_test/templates/article.html', function (data) {
        self.template = _.template(data);
        self.render();
      });
    },

    render: function () {
      this.$body = this.$('#cni-body');
      new TopBarView({
        el: '#cni-top-bar',
        collection: this.collection
      })
    },

    renderArticles: function () {
      let self = this;
      this.$body.empty();
      this.collection.each(function (article) {
        new ArticleView({
          model: article,
          $container: self.$body,
          template: self.template
        })
      })
    }
  });
});