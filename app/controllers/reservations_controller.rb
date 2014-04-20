class ReservationsController < ApplicationController
  before_filter :load_restaurant

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user_id = current_user.id

    # logic to check if party size > capacity of restaurant
    if @reservation.party >= @restaurant.capacity
      redirect_to restaurant_path(@restaurant), notice: 'Your party size is greater than seats available, reservation cannot be made'
    else
      if @reservation.save
        redirect_to restaurants_path, notice: 'Reservation has been made'
      else
        render :action => :show
      end
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:user_id, :restaurant_id, :party, :timeslot)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end