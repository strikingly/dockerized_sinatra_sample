module DockerizedSinatraSample

  class Application < Sinatra::Base

    get "/" do
      "Welcome to Sinatra!"
    end

    get "/greet" do
      "Hello world!"
    end

    namespace "/greet" do
      get "/:name" do
        "Hello #{params[:name]}!"
      end
    end

  end
  
end