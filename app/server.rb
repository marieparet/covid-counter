require 'sinatra'
require_relative 'covid_counter'

get '/' do
  "<center><h1>#{CovidCounter.total_deaths}</h1></center>"
end

