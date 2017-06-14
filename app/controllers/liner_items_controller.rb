class LinerItemsController < ApplicationController
  skip_before_action :authorize, only: :create
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_liner_item, only: [:show, :edit, :update, :destroy]

  # GET /liner_items
  # GET /liner_items.json
  def index
    @liner_items = LinerItem.all
  end

  # GET /liner_items/1
  # GET /liner_items/1.json
  def show
  end

  # GET /liner_items/new
  def new
    @liner_item = LinerItem.new
  end

  # GET /liner_items/1/edit
  def edit
  end

  # POST /liner_items
  # POST /liner_items.json
  def create
    product = Product.find(params[:product_id])
    @liner_item = @cart.add_product(product)

    respond_to do |format|
      if @liner_item.save
        format.html { redirect_to store_index_url }
        format.js { @current_item = @liner_item }
        format.json { render :show, status: :created, location: @liner_item }
      else
        format.html { render :new }
        format.json { render json: @liner_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /liner_items/1
  # PATCH/PUT /liner_items/1.json
  def update
    respond_to do |format|
      if @liner_item.update(liner_item_params)
        format.html { redirect_to @liner_item, notice: 'Liner item was successfully updated.' }
        format.json { render :show, status: :ok, location: @liner_item }
      else
        format.html { render :edit }
        format.json { render json: @liner_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /liner_items/1
  # DELETE /liner_items/1.json
  def destroy
    @liner_item.destroy
    respond_to do |format|
      format.html { redirect_to liner_items_url, notice: 'Liner item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_liner_item
      @liner_item = LinerItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def liner_item_params
      params.require(:liner_item).permit(:product_id)
    end
end
