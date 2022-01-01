class BokmarksController < ApplicationController
  before_action :set_bokmark, only: %i[ show update destroy ]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /bokmarks
  def index
    # @bokmarks = current_user.bokmarks.find_by(ancestry:nil).subtree
    @bokmarks = current_user.bokmarks
    render json: @bokmarks
  end

  # GET /bokmarks/1
  def show
    render json: @bokmark
  end

  # POST /bokmarks
  '''
    create bokmark with user_id && and use url_text to link/create site object 
  '''
  def create
    ActiveRecord::Base.transaction do  
      begin
        @bokmark = BokmarkService.new(bokmark_params,  params[:parent_id] , @current_user).get_bokmark_obj( )
        if @bokmark.save
          render json: @bokmark, status: :created, location: @bokmark
        else
          render json: @bokmark.errors, status: :unprocessable_entity
        end
    rescue Exception => error
      render json: {"error": error }, status: :unprocessable_entity
    end
  end
end

  # PATCH/PUT /bokmarks/1
  def update
    if @bokmark.update(bokmark_params)
      render json: @bokmark
    else
      render json: @bokmark.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bokmarks/1
  def destroy
    @bokmark.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bokmark
      @bokmark = Bokmark.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bokmark_params
      params.require(:bokmark).permit(:title, :user_id, :url_text, :bookmark_type, :parent_id, :ancestry, :site_id)
    end
end
