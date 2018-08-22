module Cni
  module SinatraApps
    class Admin < Sinatra::Base

      helpers Cni::NewsSearch::Helpers
      helpers Sinatra::Cookies
      set :sessions => true

      set :app_path, '/cniAdmin'

      before do
        # TODO add logic to manage sessions
      end

      get '/' do
        content_type :html
        begin
          get_webapp({
              app_name: 'news_test',
              title: 'CNI - NEWS TEST by: Charles Ovando'
          })
        rescue => e
          logger.error e.message
          logger.debug e.backtrace[0..9]
          [500, e.message]
        end
      end
    end
  end
end