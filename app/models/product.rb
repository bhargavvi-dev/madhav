class Product < ActiveRecord::Base
	enum product_type: ['PEANUTS', 'DAL']

	has_many :prodct_purchses, inverse_of: :product
	has_many :customer_bill_products, inverse_of: :product
	
	has_many :stocks, inverse_of: :product

    belongs_to :creator, class_name: "User", foreign_key: "creator_id"
    belongs_to :updater, class_name: "User", foreign_key: "updater_id"		

	validates :name, :presence => true	
end
