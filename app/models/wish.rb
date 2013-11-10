class Wish < ActiveRecord::Base
  belongs_to :wishlist

  validates :name, :presence => true
  validates :price, :numericality =>true
  validates :link, format: { multiline: true, with:/^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$/ix , message:'not valid link' }



end
