class RestaurantsController < ApplicationController
    def index
    @restaurants = if params[:search]
      Restaurant.where("lower(name) like ?", "%#{params[:search]}%")
    else
      Restaurant.all
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def search
    @restaurants = Restaurant.where("lower(name) like ?", "%#{params[:search]}%")
    render @restaurant
  end


  def show
    @restaurant = Restaurant.find(params[:id])

    if current_user
      @reservation = @restaurant.reservations.build
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to edit_restaurant_url(@restaurant)
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
        redirect_to restaurants_path

  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :capacity, :url)
  end
end