class StoresController < ApplicationController
  before_action :set_store, only: %i[ show update destroy ]
  before_action :check_ownership ,only: [:show, :destroy,:update]
  before_action :authenticate_user,only: [:create ,:destroy,:update]
  # before_action :check_admin ,only: [:index]

  # GET /stores
  def index
    @stores = Store.all
    render json: @stores
  end

  # GET /stores/1
  def show
    render json: @store
  end

  # POST /stores
  def create
    @store = Store.new(store_params)

    if @store.save
      render json: @store, status: :created, location: @store
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stores/1
  def update
    if @store.update(store_params)
      render json: @store
    else
      render json: @store.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stores/1
  def destroy
    @store.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end
    def check_ownership
      if current_user.id !=@store.user_id
          render json:{error:"no permission"},status:401
      end 
  end
  def check_admin
    if !current_user.admin?
        render json:{error:"no permission"},status:401
     end
end

    # Only allow a list of trusted parameters through.
    def store_params
      params.require(:store).permit(:name, :location, :user_id,:domain)
    end
end
