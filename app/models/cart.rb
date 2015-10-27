class Cart < ActiveRecord::Base

   has_many :line_items , dependent: :destroy


   # now we need a smart add_product() method in our cart . One  checks whether our list
   # of items already include the product we are adding ; if it does , it bumps the quantity 
   #  , and if it doesn not , it builds the a new lineitem. 
    def check_if_product_exist_increament_or_add_new_line_item(product_id)
       
       #Find the current item , increament by 1 . If needed.
       current_item = line_items.find_by(product_id: product_id)

       if current_item 

       	  current_item.quantity 

       else 

       	current_item = line_items.build(product_id: product_id)
       end 
        current_item
    end

end


