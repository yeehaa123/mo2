class StaticPagesController < ApplicationController
  def home
  	respond_to do |format|
      format.html
      format.pdf do
        render :pdf => "test.pdf"
      end
    end
  end

  def home2
  end
end
