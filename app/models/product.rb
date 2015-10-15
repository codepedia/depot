class Product < ActiveRecord::Base
	validates :title , :description , :image_url , presence: true
	validates :price , numericality: { greater_than_or_equal: 0.01}
	validates :title , uniqueness: true 
	validates :image_url , allow_blank: true , format: {
         with: %r{\.(git|jpg|png)\Z}i,
      message: 'must be a URL for GIF, jpg or PNG image.'
	}
end
