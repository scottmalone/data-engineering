class UploadsController < ApplicationController

  before_filter :authenticate_user!
 # load_and_authorize_resource

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(params[:upload])
    if @upload.save
      redirect_to @upload 
    else
      render :new 
    end
  end

  def show
    @upload = Upload.find(params[:id])
    respond_to do |format|
      format.html
      #format.json { render json: @upload } 
      format.json {
        if @upload.complete
          render json: {:total => InvoiceItem.total}
        else
          render json: {}
        end
      }
    end
  end
end
