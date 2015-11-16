class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy


   # now we need a smart add_product() method in our cart . One  checks whether our list
   # of items already include the product we are adding ; if it does , it bumps the quantity 
   #  , and if it doesn not , it builds the a new lineitem.
  def check_if_product_exist_increament_or_add_new_line_item(product_id)
       current_item = line_items.find_by(product_id: product_id)
    if current_item
      #Remember, this isn't Java. nil is an object of class NilClass.
      #nil does have methods you can call on it, but > 
      #isn't one of them. That's why you get NoMethodError

     
      #current_item.quantity = current_item.quantity + 1
       current_item.quantity += 1
   else
      current_item = line_items.build(product_id: product_id)
     #current_item.price = current_item.product.price
   end
    current_item
   end

  def total_price
    line_items.to_a.sum { |item| item.total_price }
  end
end
