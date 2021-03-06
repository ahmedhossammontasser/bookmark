'''
 User can only index/show/create
 User can not update/delete 
'''
class TagsController < ApplicationController
  before_action :set_tag, only: %i[ show update destroy ]
  before_action :authenticate_user!

  # GET /tags
  '''
    return list of all tags
  '''
  def index
    @tags = Tag.all
    render json: @tags
  end

  # GET /tags/1
  def show
    render json: @tag
  end

  # POST /tags
  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      render json: @tag, status: :created, location: @tag
    else
      render json: @tag.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tag_params
      params.require(:tag).permit(:title)
    end
end
