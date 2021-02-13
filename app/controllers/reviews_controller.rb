class ReviewsController < ApplicationController
  before_action :find_cocktail

  def index
    @cocktail = Cocktail.find(params[:cocktail_id])
    @reviews = @cocktail.reviews
  end

  def new
    @review = @cocktail.reviews.new
  end

  def create
    
    @review = @cocktail.reviews.new(review_params)

    if @review.save 
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private 

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
