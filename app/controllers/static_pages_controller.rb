class StaticPagesController < ApplicationController
  def home
    @users = User.all
  end

  def about
  end

  def article
  	respond_to do |format|
      format.html
      format.pdf do
        render 	:pdf => "article",
                :handlers => [:md, :haml],
								:layout => 'layouts/application'
      end
    end
  end
end