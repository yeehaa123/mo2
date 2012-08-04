class StaticPagesController < ApplicationController
  def home
  	respond_to do |format|
      format.html
      format.pdf do
        render 	:pdf => "home",
                :handlers => [:md, :haml],
        				:template => "static_pages/home",
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
