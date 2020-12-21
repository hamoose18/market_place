class HomeController < ApplicationController

    def index
        @items = Item.where.not(user_id: current_user.id)
        bought_items = Transaction.all.map {|trans| trans.item}
        @items -= bought_items
    end


    def search

        @item = Item.where("title LIKE ?", "%" + params[:q] + "%")

        
    end
end
