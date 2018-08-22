use Rack::Logger

module Cni
  module NewsSearch
    module Helpers

      def logger
        if defined? request
          request.logger
        else
          nil
        end
      end

      def get_webapp(opts)
        opts[:dev_mode] = (ENV['RACK_ENV'] == 'development') || (cookies[:dev_mode] == 'true')
        erb :index, locals: opts
      end

    end
  end
end