require 'csv'

class Product < ApplicationRecord

 has_many :line_items
 has_many :orders, through: :line_items
 before_destroy :ensure_not_referenced_by_any_line_item

  mount_uploader :image, ImageUploader

 validates_presence_of :name, :price
 validates_numericality_of :price


def self.to_csv(options = {})
    desired_columns = ["id", "name", "price"]
    CSV.generate(options) do |csv|
      csv << desired_columns
      all.each do |product|
        csv << product.attributes.values_at(*desired_columns)
      end
    end
  end
  
  def self.import(file)
    spreadsheet = Roo::Spreadsheet.open(file.path)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      product = find_by(id: row["id"]) || new
      product.attributes = row.to_hash
      product.save!
    end
  end  

 private

 def ensure_not_referenced_by_any_line_item
 	unless line_items.empty?
 		errors.add(:base, 'Line Items present')
 		throw :abort
 	end
 end

end
