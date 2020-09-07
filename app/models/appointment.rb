class Appointment < ApplicationRecord
    belongs_to :customer, class_name: 'User'
    belongs_to :hrs, class_name: 'User', optional: true
    belongs_to :superhero, optional: true

    validate :no_murder, :invalid_time_frame
    validate :no_double_bookings

    def start_time_military
        start_time = 0
        if self.start_time == 12 && self.start_ampm == "PM"
            return 12
        elsif self.start_time == 12 && self.start_ampm == "AM"
            return 0
        elsif self.start_ampm == "PM"
            start_time = self.start_time + 12
        else
            start_time = self.start_time
        end
        start_time
    end

    def end_time_military
        end_time = 0
        if self.end_time == 12 && self.end_ampm == "PM"
            return 12
        elsif self.end_time == 12 && self.end_ampm == "AM"
            return 24
        elsif self.end_ampm == "PM"
            end_time = self.end_time + 12
        else
            end_time = self.end_time
        end
        end_time
    end

    def requested_hours_booked
        requested_hours_booked = []
        total_time = self.end_time_military - self.start_time_military
        index = 0 
        while index < total_time do 
            requested_hours_booked << self.start_time_military + index
            index += 1
        end
        requested_hours_booked
    end


    def invalid_time_frame
        if self.end_time_military <= self.start_time_military
            errors.add(:start_time, "invalid. Search for Doctor Strange if you need further assistance.")
        end
    end

    def no_murder 
        if self.description_of_service == "Felonious Robbery"
            errors.add(:description_of_service, " - Forbidden Selection! The Justice League has been alerted of your ill intentions.")
        end
    end

    def no_double_bookings
        if self.superhero_id
            provider = Superhero.find_by(id: self.superhero_id)
        elsif self.hrs_id
            provider = User.find_by(id: self.hrs_id)
        end
        provider_booked = false
        provider.hours_booked.each do |hour|
            self.requested_hours_booked.each do |rhour|
                if hour == rhour
                    provider_booked = true
                end
            end
        end
      

        if provider_booked == true
            errors.add(:start_time, "invalid. Your requested Hero is already booked at this given time frame.")
        end

    end


end