class PagesController < ApplicationController
    def index
      #@movies = Movie.all
      session[:return_to_page] = params[:page]
      @movies = Movie.approved.page(params[:page]).per(2)
    end
end

