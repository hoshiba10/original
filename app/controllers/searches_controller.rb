class SearchesController < ApplicationController
    

    
    def search
        #@q = Item.search(params[:q])
        if request.get?
            p "GET!"
        else
            p "POST!"
            @searches = Item.search(:title_cont => params[:keyword]).result
            p @searches
        end
    end
    
end
