class Product < ApplicationRecord
	has_many :liner_items
	before_destroy :ensure_not_referenced_by_any_liner_item

	validates :title, :description, :image_url, presence: true
	validates :title, uniqueness: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :image_url, allow_blank: true, format: {
	  with:    %r{\.(gif|jpg|png)\Z}i,
	  message: 'must be a URL for GIF, JPG or PNG image.'
	}
	def num_of_cart
		liner_items.to_a.sum { |item| item.quantity }
	end
	private
	def ensure_not_referenced_by_any_liner_item
		unless liner_items.empty?
			error.add(:base, 'Liner Items Present')
			throw :abort
		end
	end
end
