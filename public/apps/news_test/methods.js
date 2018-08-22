define([
  'jquery'
], function($){
  return {
    ajaxCall: function(url, collection, $spinner, method = 'GET', data = null ) {
      // validate params
      if (!url || !collection)
        return;

      // show spinner if one is sent
      if ($spinner)
        $spinner.show();

      // get the news
      collection.reset([]);
      $.ajax({
        url: '/cniAdmin/'+ url,
        type: method,
        data: data,
        dataType: 'json',
        error: function (e) {
          alert('there was an error fetching the news\n'+ e.responseText)
        },
        success: function (data) {
          collection.reset(data)
        },
        complete: function () {
          if ($spinner)
            $spinner.hide();
        }
      })
    },

    fetchLatestNews: function(collection, $spinner) {
      this.ajaxCall('latest_news', collection, $spinner)
    },

    doSearch: function (keyword, collection, $spinner) {
      let self = this;
      if (this.search_timeout) {
        clearTimeout(this.search_timeout);
        this.search_timeout = null;
      }
      this.search_timeout = setTimeout(function(){
        keyword = $.trim(keyword);
        if (keyword) {
          self.ajaxCall('search', collection, $spinner, 'POST', {keyword: keyword});
        } else {
          self.fetchLatestNews(collection, $spinner);
        }
      }, 500);
    }
  }
});