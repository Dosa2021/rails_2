class SearchesController < ApplicationController
    def search
        @content = params[:content]
        @users = User.search_for(@content)
    end
end
