#!/usr/bin/env ruby

require "sinatra"
set :bind, '0.0.0.0'
set :public_folder, 'public'

def read_file(name)
  if File.file?(name)
    File.read(name)
  else
    "Nothing"
  end
end


def file_exist?(name)
  File.file?("dir/#{name}.txt")
end

def write_file(name,content)
  File.open("dir/#{name}.txt","w") do |file|
    file.print(content)
  end
end

def delete_file(name)
  if File.file?("dir/#{name}.txt")
    File.delete("dir/#{name}.txt")
  end
end

get '/' do
  @file=Dir.entries("dir")
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
  @file.delete_at(@file.index("."))
  @file.delete_at(@file.index(".."))
  erb :home
end

get '/create' do
  @val=0
  erb :create
end

#get '/dir/' do
# "<h1>Hello</h1>"
#end

get '/:name' do
  @varArg=params[:name]
  @filename="dir/"+params[:name]+".txt"
  @valueDes=read_file(@filename)
  erb :parameter
end

post '/create' do
  @valueName=params["name"]
  @descValue=params["desc"]
  if !@valueName.empty? && !@descValue.empty?
    write_file(@valueName,@descValue)
    @val=1
  end
  erb :create
end

delete '/:name' do
  delete_file(params[:name])
  redirect to('/')
end

get '/:name/edit' do
  @nameWorkshop=params[:name]
  if file_exist?(@nameWorkshop)
    @data=read_file("dir/#{@nameWorkshop}.txt")
    erb :edition
  else
    redirect to('/')
  end
end

put '/:name' do
  @nameWorkshop=params[:name]
  @descWorkshop=params["desc"]
  if !@descWorkshop.empty?
    if file_exist?(@nameWorkshop)
      write_file(@nameWorkshop,@descWorkshop)
    end
  end
  redirect to('/'+@nameWorkshop)
end
