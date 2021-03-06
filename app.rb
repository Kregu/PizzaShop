require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
      validates :name, presence: true, length: { minimum: 2 }
      validates :phone, presence: true, length: { minimum: 7 }
      validates :address, presence: true, length: { minimum: 7 }
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

get '/show_orders' do
  @orders_all = Order.order 'created_at DESC'
  erb :show_orders
end

post '/cart' do
  
  @orders_input = params[:orders]
  @orders = parse_orders_input @orders_input

  return erb :cart_is_empty if @orders.length == 0

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
    return erb :order_placed
  else
    @error = @o.errors.full_messages.first

  return erb :index
  end

end





