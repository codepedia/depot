class LineItemsController < ApplicationController
  include CurrentCart
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json

  # Calling the method we just created : check_if_product_exist_increament_or_add_new_line_item
  # The method does this : Check if the product_id already exist and if "yes" , it increament the 
  # -count . Else , it creat a new product => current_item = line_items.build(product_id: product_id)
  #  all in th model.
  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.check_if_product_exist_increament_or_add_new_line_item(product.id)

    respond_to do |format|
      if @line_item.save
        # had an issue , the redirect_to @store ... causing the add cart button to stay at the 
        # same page "store page" ... So, that is how rails link redirct and e.g: line_items_path(product_id)
        format.html { redirect_to @line_item.cart, notice: 'Line item was successfully created.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
       params.require(:line_item).permit(:product_id, :cart_id)
    end
end
