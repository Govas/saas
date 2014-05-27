class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings=Movie.uniq.pluck(:rating)#['G','PG','PG-13','R']
    if @rate==nil
      if session[:rating]==nil
      @rate=@all_ratings 
      else
      @rate=session[:rating]  
      end
    end
       sortie=params[:sort]||session[:sort]
       if sortie==nil
         @movies = Movie.all
       else
         @movies = Movie.find_all_by_rating(@rate,:order => sortie)
       end  
       rf=params[:commit]
       @rate=params[:ratings].keys unless params[:ratings]==nil #['G','PG']
       if rf=="Refresh"
         @movies = Movie.find(:all,:conditions => ["rating IN (?)",@rate])  
       end
       session[:sort]=sortie
       session[:rating]=@rate
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
