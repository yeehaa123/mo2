class ArticlesController < ApplicationController
	load_and_authorize_resource find_by: :slug

	def new
	end

	def create
		if @article.save
			redirect_to @article, notice: "Article created"
		else
			render 'new'
		end
	end

	def show
	end

	def index
	end
end