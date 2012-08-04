class StaticPagesController < ApplicationController
  def home
  	response.headers['Cache-Control'] = 'no-cache'
  	respond_to do |format|
      format.html
      format.pdf do
        render 	:pdf => "home",
								:template => 'static_pages/home'
      end
    end
  end

  def home2
  	response.headers['Cache-Control'] = 'no-cache'
  	respond_to do |format|
      format.html
      format.pdf do
        render 	:pdf => "test",
								:template => 'static_pages/home'
      end
    end
  end
end
