class ItemsController < ApplicationController
    
    def new
     @item = Item.new
    end

    def create
      @item = Item.new(item_params)
      if @item.save
        flash[:notice] = 'Item created successfully.'
        redirect_to root_path
      else
        render :new
      end
    end

    def index
        @items = Item.where(hide: false)
    end

    def show
      @item = Item.where(id: params[:id]).includes(:comments).take
      
    end
    
    def deleted
      @items = Item.where(hide: true)
    end

    def edit
        @item = Item.find(params[:id])
    end

    def update
        @item = Item.find(params[:id])
        if @item.update(update_params)
            flash[:success] = 'Item updated successfully.'
            redirect_to root_path
        else
          flash[:error] = 'Something went wrong'
          render :edit
        end
    end
    
    def test
      @item = Item.find(params[:id])
      if @item.hide==false
        @item.update(hide: true)
        redirect_to root_path
      else
        @item.update(hide: false)
        redirect_to deleted_path
      end
    end

    def destroy
      @item = Item.find(params[:id])
      @item.destroy
      
      redirect_to deleted_path
    end

    private

    def item_params
      params.require(:item).permit(:name, :price, :quantity)
    end

    def update_params
        params.require(:item).permit(:name, :price, :quantity)
    end
    
end
