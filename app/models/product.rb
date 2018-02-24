require 'csv'

class Product < ApplicationRecord

 has_many :line_items
 has_many :orders, through: :line_items
 before_destroy :ensure_not_referenced_by_any_line_item

  mount_uploader :image, ImageUploader

 validates_presence_of :name, :price
 validates_numericality_of :price




 private

 def ensure_not_referenced_by_any_line_item
 	unless line_items.empty?
 		errors.add(:base, 'Line Items present')
 		throw :abort
 	end
 end

end
