class ItemsController < ApplicationController
#before_action :set_item, only: [:index, :show, :new, :create, :edit, :update, :destroy]
 before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = current_user.items.build #Item.new
  end

  def create
    @item = current_user.items.build(items_params)

    if @item.save
      redirect_to item_path(@item), notice: "Item was successfully added!"
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(items_params)
      redirect_to item_path(@item), notice: "Item was successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_url, notice: "Item was successfully deleted!"
  end

  private

  def items_params
    params.require(:item).permit(:title, :date, :description, :picture, :location)
  end

end
