class CommentsController < ApplicationController
	before_action :set_comment, only: [:show, :edit, :update, :destroy]
	before_filter :authenticate_user!, except: [:index, :show]

 # GET /comments/new
 def new
 	@comment = Comment.new
 end

 def show
 end

 def create

 	@comment = Comment.new(comment_params)
 	@comment.user = current_user

 	respond_to do |format|
 		if @comment.save
 			format.html { redirect_to @comment.post, notice: 'Comment was successfully created.' }
 			format.json { render action: 'show', status: :created, location: @comment }
 		else
 			format.html { render action: 'new' }
 			format.json { render json: @comment.errors, status: :unprocessable_entity }
 		end
 	end
 end

 private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
    	@comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
    	params.require(:comment).permit(:content, :post_id)
    end

end
