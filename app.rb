require 'bcrypt'
require 'sinatra'
require './lib/chitter.rb'
require './lib/chitter_users.rb'

class ChitterController < Sinatra::Base
  enable :sessions

  get '/' do
    redirect '/register'
  end

  get '/register' do
    erb :'/register/register'
  end

  post '/register/signup' do
    erb :'/register/signup'
  end

  post '/register/signin' do
    erb :'/register/signin'
  end

  get '/register/securitycheck' do
    password1 = BCrypt::Password.create(params[:password1])
    password2 = BCrypt::Password.create(params[:password2]) if params[:password2]
    if params[:username]
      redirect '/register' if password1 != password2

      chitter_users = ChitterUsers.new(params[:username], password1, params[:fullname], params[:email])
      chitter_users.add
      # session[:chitter_id] = chitter_users.id

    else
      Chitter.check(params[:username], password)
    end

    redirect '/main'
  end

  get '/main' do
    erb :'/main/index'
  end

  run! if app_file == $PROGRAM_NAME
end
