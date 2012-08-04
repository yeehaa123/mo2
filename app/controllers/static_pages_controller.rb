class StaticPagesController < ApplicationController
  def home2
  	respond_to do |format|
      format.html
      format.pdf do
        render 	:pdf => "home2",
								:template => 'static_pages/home'
      end
    end
  end

  def home
  end
end
