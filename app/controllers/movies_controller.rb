class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /movies
  # GET /movies.json
  def index
    @ms = Movie.approved.ransack(search_params)
    @movies = @ms.result(distinct: true).page(params[:page]).per(5)

    respond_to do |format|
      format.html
      format.js
    end
  end

  # redraw center block without whole screen refresh
  def list
    index
    render :partial =>  'list'
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    session[:return_to] = request.referer
    @movie = Movie.find(params[:id])
    if @movie.nil?
      redirect_to action: :index
    end
  end

  def search
    index
    render :index
  end

  # update search/filter terms in session
  # TODO move update_search to it's own model/controller ??
  def update_search
    respond_to do |format|
      #byebug
      if params[:q] == nil
        unless search_params.nil?
          #search_params.each do |key, param|
          #  search_params[key] = nil
          #end
          search_params[params[:update_filter]] = nil
          session[:search_key][params[:update_filter]] = nil
        end
        #session.delete('search_key')
      else
        if session[:search_key].nil?
          session[:search_key] = {}
        end
        session[:search_key][params[:update_filter]] = params[:q][params[:update_filter]]
      end
      format.html { head :no_content }
      format.json { head :no_content }
    end
  end

  def left_column
    render partial: 'movies/left_column'
  end

  def clear_search
    clear_search_params
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
    session[:return_to] = request.referer
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        params[:covers]['path'].each do |cover|
          @movie.covers.create!(:path => cover, :movie_id => @movie.id)
        end
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        if params[:covers].present?
          params[:covers]['path'].each do |cover|
            @movie.covers.create!(:path => cover, :movie_id => @movie.id)
          end
        end
        format.html { redirect_back_or_default root_url, notice: 'Movie was successfully updated.'  }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:q, :title, :title_original, :description, :prod_date, :dvd_date,
                                    :post_date, :page, :mpaa_id, :approved, :update_filter,
                                    :genre_ids => [], :country_ids => [])
    end
end
