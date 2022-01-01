class SitesController < ApplicationController
  before_action :set_site, only: %i[ show ]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /sites
  def index
    @sites = current_user.sites.uniq
    render json: @sites
  end

  # GET /sites/1
  def show
    render json: @site
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def site_params
      params.fetch(:site, {})
    end
end
