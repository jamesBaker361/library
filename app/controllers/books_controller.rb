class BooksController < ApplicationController
	def index
		@books=Book.all
	end

	def update
		@book=Book.find(params[:id])
		puts "update!"
		@votes=@book.votes
		@rating=@book.rating
		if params[:book]["rating"].to_f > 10.0
			puts "big boi"
			@newrating =10.0
		elsif params[:book]["rating"].to_f <0.0
			puts "smol"
			@newrating=0.0
		else
			puts "nice"
			@newrating =params[:book]["rating"].to_f
		end
		@ratingWeighted=((@rating*@votes)+@newrating)/(@votes+1)
		@book.rating=@ratingWeighted
		@book.votes=@votes+1
		@book.save
		redirect_to books_path
	end

	def destroy
		@book=Book.find(params[:id])
		@book.destroy
		redirect_to books_path
	end

	def create
		@book=Book.new(params.require(:book).permit(:title,:author,:rating))
		if @book.rating >10.0
			@book.rating=10
		elsif @book.rating <0.0
			@book.rating=0.0
		else
		end	
		@book.save
		redirect_to books_path
	end

	def show
		@book=Book.find(params[:id])
	end

	def new
	end

end
