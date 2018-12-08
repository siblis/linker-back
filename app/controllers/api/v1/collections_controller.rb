class Api::V1::CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]
  acts_as_token_authentication_handler_for User, fallback_to_devise: false
  # before_action :authenticate_user!

  # GET /collections
  def index
    if current_user
      @collections = current_user.collections
      render json: @collections, status: 200
    else
      render status: 404
    end
  end

  # POST /collections
  def create
    @collection = Collection.create(collection_params)
    @collection.user_id = current_user.id
    @collection.url = SecureRandom.urlsafe_base64
    @collection.save
    render json: @collection.as_json(except: [:id]), status: 200
  end

  # GET /collections/:id
  def show
    if @collection.user_id == current_user.id
      render json: @collection.as_json(except: [:id]), status: 200
    else
      render status: 404
    end
  end

  # PUT /collections/:id
  def update
    if @collection.user_id == current_user.id
      @collection.links.destroy_all
      @collection.update(collection_params)
      render json: @collection.as_json(except: [:id]), status: 200
    else
      render status: 404
    end
  end

  # DELETE /collections/:id
  def destroy
    if @collection.user_id == current_user.id
      @collection.destroy
      render status: 200
    else
      render status: 404
    end
  end

  private

  def collection_params
    params[:links_attributes] = params.delete(:links)
    params.permit(:name, :comment, links_attributes: [:name, :url, :comment])
  end

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def current_user
    User.find_by(authentication_token: params[:user_token])
  end
end
