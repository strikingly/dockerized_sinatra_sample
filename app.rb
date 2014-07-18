require "sinatra"
require "sinatra/base"
require "sinatra/namespace"

module DockerizedSinatraSample
  class Application < Sinatra::Base
    register Sinatra::Namespace
  end
end

Dir.glob(File.expand_path("../app/routes/*.rb", __FILE__)).each do |route|
  require route
end