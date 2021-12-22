class SpicesController < ApplicationController

    def index
        spices = Spice.all
        render json: spices, status: :ok
    end
            def show
                spice = Spice.find_by(id: params[:id])
                render json: spice , status: :found
            end
 
    def create
        new_spice = Spice.create(params.permit(:title,:image,:description,:notes,:rating))
        render json: new_spice,status: :created
    end
            def update
               update_spice = Spice.find_by(id: params[:id])
               update_spice.update(params.permit(:rating))
               render json: update_spice, staus: :accepted
            end
 
    def destroy
        destroy_spice = Spice.find_by(id: params[:id])
        destroy_spice.delete
        render json: destroy_spice, status: :no_content
    end

end
