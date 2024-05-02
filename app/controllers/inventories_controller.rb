class InventoriesController < ApplicationController
    def index
        @inventories = Inventory.all
        render json: @inventories
    end

    def update
        @inventory = Inventory.find(params[:id])
        if @inventory.update(inventory_params)
            render json: @inventory
        else
            render json: @inventory.errors, status: :unprocessable_entity
        end
    end

    private

    def inventory_params
        params.require(:inventory).permit(:quantity, :location)
    end
end
