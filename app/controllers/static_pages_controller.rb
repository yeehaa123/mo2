class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def article
  	respond_to do |format|
      format.html
      format.pdf do
        render 	:pdf => "article",
                :handlers => [:md, :haml],
        				:template => "static_pages/article",
								:layout => 'layouts/application'
      end
    end
  end
end
