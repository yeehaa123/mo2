class ArticlesController < ApplicationController
	before_filter :signed_in_user, only: [:new, :edit, :create, :update, :destroy]
	load_and_authorize_resource find_by: :slug

	def index
		@articles = @articles.page(params[:page])
	end

	def show
	end

	def new
	end

	def edit
	end

	def create
		@article = current_user.articles.build(params[:article])
		if @article.save
			redirect_to @article, notice: "Article created"
		else
			render 'new'
		end
	end
	
	def update
	end

	def destroy
	end

end