class StaticPagesController < ApplicationController
  def home
  	respond_to do |format|
      format.html
      format.pdf do
        render 	:pdf => "home",
								:template => 'static_pages/home'
      end
    end
  end

  def home2
  end
end
