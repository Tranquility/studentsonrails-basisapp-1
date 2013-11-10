class WishlistSharing < ActionMailer::Base
 
  def send_to_friend (id, email)
	@wishlist_id = id
	@wishlist = Wishlist.find(@wishlist_id)
  	mail(to: email, subject: 'This is my wishlist!')
  	#@url = url_for(host:"localhost:3000", controller:'wishlists', action:"show", id:id)
  end
end