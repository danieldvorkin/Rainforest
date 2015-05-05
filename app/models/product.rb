class Product < ActiveRecord::Base
	# PAPERCLIP ASSOCIATIONS
	has_attached_file :avatar, :styles => { 
		:medium => "300x300>", 
		:thumb => "100x100>" 
	}, 
	:default_url => "http://static.guim.co.uk/sys-images/Guardian/Pix/pictures/2014/4/11/1397210130748/Spring-Lamb.-Image-shot-2-011.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  ############################################################################
	has_many :reviews, :dependent => :destroy
	belongs_to :users

	validates :description, :name, presence: true
	validates :price_in_cents, numericality: {only_integer: true}

	def formatted_price
		price_in_dollars = price_in_cents.to_f / 100
		sprintf("%.2f", price_in_dollars)
	end
end



