class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings=Movie.uniq.pluck(:rating)#['G','PG','PG-13','R']
    @rate=@all_ratings if @rate==nil
       sortie=params[:sort]
       if sortie==nil
         @movies = Movie.all
       else
         @movies = Movie.find(:all,:order => sortie)
       end  
       rf=params[:commit]
       @rate=params[:ratings].keys unless params[:ratings]==nil #['G','PG']
       if rf=="Refresh"
         @movies = Movie.find(:all,:conditions => ["rating IN (?)",@rate])
       end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(params[:movie])
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
