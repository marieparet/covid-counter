require_relative 'covid_counter'
require 'sinatra'

get '/' do
  erb :index
end

get '/recovered' do
  erb :recovered
end
