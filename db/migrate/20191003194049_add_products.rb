class AddProducts < ActiveRecord::Migration[6.0]
  def change
  	Product.create :title => "4-season", :description => "Pizza 4-season", :price => 400, :size => 32, :is_spicy => false, :is_veg => false, :is_best_offer => true, :path_to_image => "/images/4-season.jpg"
  	Product.create :title => "Beacon", :description => "Pizza with Beacon", :price => 400, :size => 32, :is_spicy => true, :is_veg => false, :is_best_offer => false, :path_to_image => "/images/beacon.jpg"
  	Product.create :title => "Beshamel", :description => "Pizza with Beshamel souse", :price => 400, :size => 32, :is_spicy => false, :is_veg => false, :is_best_offer => true, :path_to_image => "/images/beshamel.jpg"
  	Product.create :title => "Dishes", :description => "Pizza Dishes", :price => 400, :size => 32, :is_spicy => false, :is_veg => false, :is_best_offer => false, :path_to_image => "/images/dishes.jpg"
  	Product.create :title => "Milan", :description => "Pizza Milan", :price => 400, :size => 32, :is_spicy => false, :is_veg => false, :is_best_offer => false, :path_to_image => "/images/milan.jpg"
  	Product.create :title => "Pepperoni", :description => "Pizza Pepperoni", :price => 400, :size => 32, :is_spicy => true, :is_veg => false, :is_best_offer => false, :path_to_image => "/images/pepperoni.jpg"
  	Product.create :title => "Picca", :description => "Pizza Picca", :price => 400, :size => 32, :is_spicy => false, :is_veg => false, :is_best_offer => true, :path_to_image => "/images/picca.jpg"
  	Product.create :title => "Vegetable", :description => "Pizza Vegetable", :price => 400, :size => 32, :is_spicy => false, :is_veg => true, :is_best_offer => true, :path_to_image => "/images/vegetable.jpg"
  end
end
