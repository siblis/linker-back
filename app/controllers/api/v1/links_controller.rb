class Api::V1::LinksController < ApplicationController
  before_action :set_collection
  before_action :set_collection_link, only: [:show, :update, :destroy]

  # GET /collections/:collection_url/links
  def index
    json_response(@collection.links, :ok)
  end

  # GET /collections/:collection_url/links/:id
  def show
    json_response(@link, :ok)
  end

  # POST /collections/:collection_url/links
  def create
    @new_link = @collection.links.create!(link_params)
    json_response(@new_link, :created)
  end

  # PUT /collections/:collection_url/links/:id
  def update
    @link.update(link_params)
    head :no_content
  end

  # DELETE /collections/:collection_url/links/:id
  def destroy
    @link.destroy
    head :no_content
  end

  private

  def link_params
    params.permit(:name, :url, :comment, :collection_id)
  end

  def set_collection
    @collection = Collection.find(params[:collection_url])
  end

  def set_collection_link
    @link = @collection.links.find!(params[:id]) if @collection
  end
end
