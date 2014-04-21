class Restaurant < ActiveRecord::Base
  has_many :reservations
  has_many :users, :through => :reservations
  
  # has_many :owners, class: "User", foreign_key: "restaurant_id"

  def opening_hour
    11 # 11am
  end

  def closing_hour
    20 #8pm 
  end

  def time_slot
    reservation_interval = 1.hour 
    start_time = Time.zone.now + 10.minutes
    start_time = Time.zone.at (
      start_time.to_f / reservation_interval).ceil * reservation_interval
    # )
      
    #ceil rounds up to the next integer
    start_time = [start_time, start_time.change(hour: opening_hour)].max

    end_time = (start_time + 3.days).change(hour: closing_hour)

    all_times = [] #use array to get collection
    a_time = start_time #time to store in all times

    begin
      add_times << a_time
      a_time =+ reservation_interval
      if (a_time + reservation_interval) > a_time.change(hour: closing_hour)
        a_time = (a_time +1.day).change(hour:opening_hour)
      end

    end while a_time < end_time

    all_times
  

  end

end
