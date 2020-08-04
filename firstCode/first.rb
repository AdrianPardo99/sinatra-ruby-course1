#!/usr/bin/env ruby

require "sinatra"
set :bind, '0.0.0.0'

get '/' do
  "<h1>Hello World from Sinatra app<h1>"
end
