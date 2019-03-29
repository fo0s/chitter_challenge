require 'sinatra'

class ChitterController < Sinatra::Base

  get '/' do
    erb :'./main/index'
  end

  run! if app_file == $PROGRAM_NAME
end
