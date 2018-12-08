class Api::V1::PublicCollectionsController < ApplicationController
  before_action :set_collection

  # GET collection/:url
  def show
    if @collection && @collection.links != []
      render json: @collection.as_json(:include => { :links => { :only => [:name, :comment, :url] } }, only: [:name, :comment, :links]), status: 200
    else
      render status: 404
    end
  end

  private

  def collection_params
    params.permit(:url)
  end

  def set_collection
    @collection = Collection.find_by(url: params[:url])
  end
end
