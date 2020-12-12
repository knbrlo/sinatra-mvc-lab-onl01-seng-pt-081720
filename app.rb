require_relative 'config/environment'
require_relative 'models/piglatinizer.rb'

class App < Sinatra::Base

    get '/' do
        erb :user_input
    end

    post '/piglatinize' do
        new_object = PigLatinizer.new()
        @final_converted = new_object.piglatinize(params[:user_phrase])
        erb :piglatinize
    end

end