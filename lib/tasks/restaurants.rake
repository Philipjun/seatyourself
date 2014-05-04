namespace :restaurants do 
  desc "set long/lat coordinates for addresses"
  task :update_coordinates => :environment do
    restaurants = Restaurant.where(longitude: nil, latitude: nil)
    restaurants.each do |r|
      r.geocode
      if r.save
        puts "#{r.name} was updated"
      else
        puts "There was a problem updating #{r.name}  with id #{r.id}"
      end
    end
  end
end

