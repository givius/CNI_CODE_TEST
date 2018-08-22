module Cni
  module SinatraApps
    class NewsSearch < Sinatra::Base

      helpers Cni::NewsSearch::Helpers

      set :newsapi_url, 'https://newsapi.org/v2'
      set :newsapi_key, 'f6f6c7627bbe45c3be01bff7de2b2de7'
      set :search_country, 'gb'

      get '/latest_news/?' do
        content_type :json
        begin
          news = JSON.parse(
              RestClient.get "#{settings.newsapi_url}/top-headlines?country=#{settings.search_country}&apiKey=#{settings.newsapi_key}"
          )
          throw :halt, [404, news['message']] if news['status'] != 'ok'

          news['articles'].to_json
        rescue => e
          logger.error e.message
          logger.debug e.backtrace[0..9]
          [500, e.message]
        end
      end

      post '/search/?' do
        content_type :json
        begin
          # validate parameters
          return '[]' if params[:keyword].nil?

          # sanitize the posted keyword
          keyword = params[:keyword].gsub(/[^0-9A-Za-z.\-]/, '').strip
          return '[]' if keyword == ''

          # get the news using the keyword
          news = JSON.parse(
              RestClient.get "#{settings.newsapi_url}/everything?q=#{keyword}&apiKey=#{settings.newsapi_key}"
          )
          throw :halt, [404, news['message']] if news['status'] != 'ok'

          news['articles'].to_json
        rescue => e
          logger.error e.message
          logger.debug e.backtrace[0..9]
          [500, e.message]
        end
      end

    end
  end
end
