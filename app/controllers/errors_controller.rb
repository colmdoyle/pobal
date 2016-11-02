class ErrorsController < ApplicationController
  def not_found
    respond_to do |format|
      format.html { render :status => 404, :formats => [:html] }
      format.all { redirect_to "/404" }
    end
  end

  def unacceptable
    respond_to do |format|
      format.html { render :status => 422 }
      format.all { render nothing: true, status: 422 }
    end
  end

  def internal_server_error
    respond_to do |format|
      format.html { render :layout => false, :status => 500 }
      format.all { render nothing: true, status: 500 }
    end
  end
end
