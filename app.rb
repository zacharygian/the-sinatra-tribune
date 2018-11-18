require "sinatra"
require 'open-uri'
require 'json'
require 'rest-client'
require "sinatra/reloader" if development?
require_relative "database"

# Methods
def nice_date(date)
  date.strftime("%b %d, %Y")
end

def fetch(url)
  response = RestClient.get(url)
  content = JSON.parse(response)
end

# Routes
get "/" do
  @database = DB
  @date = nice_date(Date.today)
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

get "/more_news" do
  erb :more_news
end

get "/more_news/tech" do
  @date = nice_date(Date.today)
  url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=2215fe3fb94c4d98b698bfbc8fccbfde"
  @tech = fetch(url)
  erb :tech
end

get "/more_news/sports" do
  @date = nice_date(Date.today)
  url = "https://newsapi.org/v2/top-headlines?sources=espn&apiKey=2215fe3fb94c4d98b698bfbc8fccbfde"
  @sports = fetch(url)
  erb :sports
end

get "/more_news/crypto" do
  @date = nice_date(Date.today)
  url = "https://newsapi.org/v2/top-headlines?sources=crypto-coins-news&apiKey=2215fe3fb94c4d98b698bfbc8fccbfde"
  @crypto = fetch(url)
  erb :crypto
end

get "/more_news/general" do
  @date = nice_date(Date.today)
  url = "https://newsapi.org/v2/top-headlines?sources=associated-press&apiKey=2215fe3fb94c4d98b698bfbc8fccbfde"
  @general = fetch(url)
  erb :general
end
