require 'rubygems'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, adapter: 'sqlite3', database: 'pizzashop.db'

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

post '/cart' do

  @orders_input = params[:orders]
  @orders = parse_orders_input @orders_input

  return erb :cart_is_empty if @orders.length.zero?

  erb :cart
end

post '/order' do
  erb 'Hello from order!'
end

get '/admin' do
  protected!

  @orders = Order.order 'created_at DESC'
  erb :admin
end

def parse_orders_input orders_input
  s = orders_input.gsub(/product_|=|,/, ' ')
  Hash[*s.split(' ')]
end


post '/place_order' do

  @o = Order.new params[:order]
  return erb :order_placed if @o.save

  @error = @o.errors.full_messages.first
  erb :index

end

helpers do
  def protected!
    return if authorized?
    headers['WWW-Authenticate'] = 'Basic realm="Restricted Area"'
    halt 401, "Not authorized\n"
  end

  def authorized?
    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? and @auth.basic? and @auth.credentials and @auth.credentials == %w[admin admin]
  end
end






