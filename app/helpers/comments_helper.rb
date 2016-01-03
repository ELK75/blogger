module CommentsHelper

	def comment_params
		params.require(:comment).permit(:author_name, :bodyo)
	end

end
