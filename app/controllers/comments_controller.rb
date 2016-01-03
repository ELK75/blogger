class CommentsController < ApplicationController
	include CommentsHelper
	
	def index
		@comments = Comment.all
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.new(comment_params)
		@comment.article_id = params[:article_id]

		@comment.save

		redirect_to article_path(@comment.article)
	end


	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		flash.notice = "Comment '#{@comment.title}' Deleted"

		redirect_to comments_path
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		@comment.update(comment_params)

		flash.notice = "Comment '#{@comment.title}' Upddated!"

		redirect_to comment_path(@comment)
	end

end
