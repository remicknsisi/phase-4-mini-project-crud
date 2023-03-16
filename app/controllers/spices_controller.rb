class SpicesController < ApplicationController
    wrap_parameters format: []

    def index
        spices = Spice.all
        render json: spices, except: [:created_at, :updated_at]
    end

    # def show
    #     spice = Spice.find_by(id: params[:id])
    #     render json: spice
    # end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: 201
    end

    def update
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.update(spice_params)
            render json: spice
        else 
            render json: {error: "spice not found"}, status: 404
        end
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        spice.destroy
        head :no_content
    end

    private
        def spice_params 
            params.permit(:title, :image, :description, :notes, :rating)
        end

        # def find_spice
        #     spice = Spice.find_by(id: params[:id])
        # end
end