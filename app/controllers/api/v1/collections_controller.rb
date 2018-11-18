class Api::V1::CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]

  # GET /collections
  def index
    @collections = Collection.all
    json_response(@collections, :ok)
  end

  # POST /collections
  def create
    @collection = Collection.create!(collection_params)
    json_response(@collection, :created)
  end

  # GET /collections/:url
  def show
    json_response(@collection, :ok)
  end

  # PUT /collections/:url
  def update
    @collection.update(collection_params)
    head :no_content
  end

  # DELETE /collections/:url
  def destroy
    @collection.destroy
    head :no_content
  end

  private

  def collection_params
    params.permit(:name, :url, :comment, :user_id)
  end

  def set_collection
    @collection = Collection.find(params[:url])
  end
end
