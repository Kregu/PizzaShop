require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
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
  @orders_input = params[:orders]
  @orders = parse_orders_input @orders_input
  @o = {}
  erb :cart
end

post '/order' do
  erb 'Hello from order!'
end

def parse_orders_input orders_input
  s = orders_input.gsub(/product_|=|,/, ' ')
  return Hash[*s.split(' ')] 
end


post '/place_order' do
  @o = Order.new params[:order]
  if @o.save
    erb "<h3>Thank you! We received your order.</h3>"
  else
    @error = @o.errors.full_messages.first
    erb :cart
  end

end





