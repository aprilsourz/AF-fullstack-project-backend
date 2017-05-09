class ItemsController < ProtectedController
  before_action :set_item, only: [:update, :destroy]

  # GET /items
  def index
    @items = current_user.items.all

    render json: @items
  end

  # POST /items
  def create
    @item = current_user.items.build(item_params)

    if @item.save
      render json: @item
    else
      render json: @item, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    @current_edit = current_user.items.find(@item.id)
    if @current_edit.update(item_params)
      render json: @current_edit
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
     current_user.items.find(@item).destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def item_params
      params.require(:item).permit(:content)
    end
end
