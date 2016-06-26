class MoviesController < ApplicationController
	
	def index

		if params[:find] && params[:find].length > 0
		 	by_title = Movie.find(:all, :conditions => ['title LIKE ?', "%#{params[:find]}%"])
		 	by_director = Movie.find(:all, :conditions => ['director LIKE ?', "%#{params[:find]}%"])
		 	@movies = by_title + by_director
		elsif params[:director] && params[:director].length > 0	
		 	@movies = Movie.find(:all, :conditions => ['director LIKE ?', "%#{params[:director]}%"]) 
		elsif params[:duration] && params[:duration].length > 0 
			if params[:duration] == "Under 90 minutes"
				@movies = Movie.duration 
			elsif params[:duration] == "Between 90 and 120 minutes"	
				@movies = Movie.duration
			else 
			 	@movies = Movie.duration
			end	 	
	  else
	  	@movies = Movie.all
	  end
	end

	def show
	  @movie = Movie.find(params[:id])
	end

	def new
	  @movie = Movie.new
	end

	def edit
	  @movie = Movie.find(params[:id])
	end

	def create
	  @movie = Movie.new(movie_params)
	  if @movie.save
	    redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
	  else
	    render :new
	  end
	end

	def update
	  @movie = Movie.find(params[:id])

	  if @movie.update_attributes(movie_params)
	    redirect_to movie_path(@movie)
	  else
	    render :edit
	  end
	end

	def destroy
	  @movie = Movie.find(params[:id])
	  @movie.destroy
	  redirect_to movies_path
	end



	protected

	def movie_params
	  params.require(:movie).permit(
	    :title, :release_date, :director, :runtime_in_minutes, :image, :description
	  )
	end
end
