APP_ROOT = File.expand_path(File.dirname(__FILE__))
VERSION = '1.0.0'

##################################################################
#  Load my Sinatra app and routes
##################################################################
$:.unshift File.join(APP_ROOT, 'app')
require 'news_test'

puts "Cni::SinatraApps::NewsSearch.app_path == #{Cni::SinatraApps::Admin.app_path}"

map Cni::SinatraApps::Admin.app_path do
  use Cni::SinatraApps::NewsSearch
  run Cni::SinatraApps::Admin
end

##################################################################
#  Map the public Folder
##################################################################
map_dir = File.join(APP_ROOT, 'public')
puts "'/' Map to Dir #{map_dir}"

map '/' do
  run Rack::File.new( map_dir )
end


##################################################################
#  Initialize DB or any other tool
##################################################################
