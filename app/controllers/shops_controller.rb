class ShopsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
        if params[:search] != nil && params[:search] != ''
        search = params[:search]
        @shops = Shop.where("place LIKE ? OR shop_name LIKE ? OR adress LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%").page(params[:page]).per(6)
      else
        @shops = Shop.all.page(params[:page]).per(6)
      end
      @tag = Tag.select("name", "id")
      tag_search = params[:tag_search]
      if tag_search != nil
          @shops = Tag.find_by(id: tag_search).shops
      else
          @shops = Shop.all
      end
      @shops = Kaminari.paginate_array(@shops).page(params[:page]).per(6)
    end

    def new
        @shop = Shop.new
    end

    def create
        shop = Shop.new(shop_params)
        shop.user_id = current_user.id  
        if shop.save!
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def show
        @shop = Shop.find(params[:id])
        @comments = @shop.comments
        @comment = Comment.new
    end
    
    def edit
        @shop = Shop.find(params[:id])
    end

    def update
        shop = Shop.find(params[:id])
        if shop.update(shop_params)
          redirect_to :action => "show", :id => shop.id
        else
          redirect_to :action => "new"
        end
      end

    def destroy
        shop = Shop.find(params[:id])
        shop.destroy
        redirect_to action: :index
    end

    private
    def shop_params
        params.require(:shop).permit(:place, :shop_name, :adress, :image, :rating, tag_ids: [])
    end

end
