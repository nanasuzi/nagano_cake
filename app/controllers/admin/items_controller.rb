class Admin::ItemsController < AdminsController

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      @genres = Genre.all
      render:new
    end
  end

  def index
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @genres = Genre.all
    @item = Item.find(params[:id])
  end

  def update
    @genres = Genre.all
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admin_item_path(@item)
  end

  private
    def item_params
      params.require(:item).permit(:name, :image, :introduction, :price, :is_active, :genre_id )
    end
end
