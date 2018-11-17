require "sinatra"
require "sinatra/reloader" if development?
require_relative "database"

get "/" do
  @database = DB
  erb :home
end

get "/posts/1" do
  @post = DB[0]
  @comments = COMMENTS[0]
  erb :first_post
end

get "/posts/2" do
  @post = DB[1]
  @comments = COMMENTS[1]
  erb :second_post
end

get "/posts/3" do
  @post = DB[2]
  @comments = COMMENTS[2]
  erb :third_post
end

get "/posts/4" do
  @post = DB[3]
  @comments = COMMENTS[3]
  erb :fourth_post
end

get "/posts/5" do
  @post = DB[4]
  @comments = COMMENTS[4]
  erb :fifth_post
end
