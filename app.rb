require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end


configure do
  enable :sessions
end

before do
  @products = Product.all
end


get '/' do
  erb :index
end

get '/about' do
  erb :about
end

post '/cart' do
  orders_input = params[:orders]
  @orders = parse_orders_input orders_input

  erb :cart
end

post '/order' do
  erb 'Hello from order!'
end

def parse_orders_input orders_input
  s = orders_input.gsub(/product_|=|,/, ' ')
  return Hash[*s.split(' ')] 
end