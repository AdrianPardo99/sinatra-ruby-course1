#!/usr/bin/env ruby

require "sinatra"
set :bind, '0.0.0.0'

get '/' do
  #@file=Dir.entries("dir")
  #var="<br>"
  #@file.each {
    #|i|
    #if i=="." || i==".."
      #var=var
    #else
      #var="#{var}<a href=\"dir/#{i}\">#{i}</a><br>"
    #end
  #}
  @value=0
  erb :home
end

#get '/dir/' do
# "<h1>Hello</h1>"
#end
