class SearchesController < ApplicationController
    def new
        @search = Search.new
    end



    # def search 
    #     @search = Search.new
    # end

    def create
        @search = Search.create(minimum_price: params[:minimum_price], maximum_price: params[:maximum_price])
        redirect_to search_path(@search)
    end

    def show
        @search = Search.find(params[:id])
        @results = @search.search_heroes
    end

    private

    # def search_params
    #    params.require(:search).permit! 
    # end
end
