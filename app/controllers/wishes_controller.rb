class WishesController < ApplicationController
	before_action :set_wish, only: [:show, :edit, :update, :destroy]
	before_filter :authenticate_user!, except: [:index, :show, :reserve]

 # GET /wishs/new
 def new
 	@wish = Wish.new
 end

 def show
 end

 def create
 	@wish = Wish.new(wish_params)
 	respond_to do |format|
 		if @wish.save
 			format.html { redirect_to @wish.wishlist, notice: 'wish was successfully created.' }
 			format.json { render action: 'show', status: :created, location: @wish }
 		else
            format.html { redirect_to @wish.wishlist, alert: @wish.errors.full_messages.join(',</br>').html_safe}
 			format.json { render json: @wish.errors, status: :unprocessable_entity }
 		end
 	end
 end

def edit
    #wish = Wish.find(params[:id])
   # redirect_to wish.wishlist   
end

 def update
    respond_to do |format|
        if @wish.update(wish_params)
            format.html { redirect_to @wish.wishlist, notice: 'wish was successfully updated.' }
            format.json { head :no_content }
        else
           format.html { render action: 'edit' }
            format.json { render json: @wish.errors, status: :unprocessable_entity }
        end
    end
 end

def destroy
    @wish.destroy
    respond_to do |format|
      format.html { redirect_to @wish.wishlist }
      format.json { head :no_content }
    end
end

def reserve
    #Wish.find(params[:id]).occupied_flag = true
    wish = Wish.find(params[:id])
    wish.occupied_flag = true
    wish.save
    redirect_to wish.wishlist
end

 private
    # Use callbacks to share common setup or constraints between actions.
    def set_wish
    	@wish = Wish.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wish_params
    	params.require(:wish).permit(:name, :price, :link, :wishlist_id)
    end

end
