class SupportRequestsController < ApplicationController
  before_action :find_request, except: [:new, :create, :index] 
  
  def index
    if params[:search] 
      @requests = SupportRequest.order("action ASC").search(params[:search]).paginate(:page => params[:page], :per_page => 5)
      flash.now[:notice] = "Entering search mode, click All Requests to go back!"
    else
      @requests = SupportRequest.order("action ASC").paginate(:page => params[:page], :per_page => 5)
    end  
  end

  def new
    @request = SupportRequest.new 
  end

  def create
    @request = SupportRequest.new(r_params)
    if @request.save
      redirect_to support_requests_path, alert: "Your request was created successfully"
    else
      flash.now[:alert] = "Please correct your request"
      render :new
    end
  end
  
  def show

  end

  def edit

  end
  
  def update
    if @request.update(r_params) 
      redirect_to support_requests_path, alert: "Updated successfully"
    else
      flash.now[:alert] = "Update failed"
      render :edit
    end
  end
  
  def destroy
    if @request.destroy 
      redirect_to support_requests_path, alert: "Request deleted"
    else
      flash.now[:alert] = "Cant delete this request"
      render @request 
    end
  end
  
  
  private 
    
    def find_request
      @request = SupportRequest.find(params[:id])
    end

    def r_params
      params.require(:support_request).permit(
        [:name, :email, :department, :message, :action])
    end

end
