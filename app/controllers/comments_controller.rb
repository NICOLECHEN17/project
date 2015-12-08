class CommentsController < ApplicationController

	before_action :comment_author?,only: :destroy

  def index
		@micropost = Micropost.find_by_id(params[:micropost_id])
		@user = @micropost.user
		@comments = @micropost.comments
		@comment = Comment.new
  end


  def create
		comment = current_user.comments.build(content: params[:comment][:content])
		micropost = Micropost.find_by_id(params[:micropost_id])

		if micropost
			micropost.comments << comment
			redirect_to micropost_comments_path(micropost)

		else
			redirect_to root_path, notice[:error]="making comment failed"

		end		

  end


  def destroy
		micropost = Micropost.find_by_id(params[:micropost_id])
		comment = Comment.find_by_id(params[:id])
		micropost.comments.delete(comment) if micropost && comment
		redirect_to micropost_comments_path(micropost)

  end

  def update

  end

	private
		def comment_author?
			@micropost = Micropost.find_by_id(params[:micropost_id])
			@comment = Comment.find_by_id(params[:id])
			redirect_to root_path unless @comment.user == current_user

		end

end