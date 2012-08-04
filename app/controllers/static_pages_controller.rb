class StaticPagesController < ApplicationController
  def home
  	respond_to do |format|
      format.html
      format.pdf do
        render 	:pdf => "home",
								:layout => 'layouts/application'
      end
    end
  end

  def home2
  	respond_to do |format|
      format.html
      format.pdf do
        render 	:pdf => "home2",
								:layout => 'layouts/application'
      end
    end
  end
end
