class User < ApplicationRecord
    has_many :appointments
    has_many :superheros, through: :appointments 
    has_many :client_users, foreign_key: :customer_id, class_name: 'Hero'
    has_many :user_heros, through: :client_users
    has_many :provider_users, foreign_key: :hrs_id, class_name: 'Hero'
    has_many :customers, through: :provider_users
    has_many :appointments, through: :client_users
    has_many :appointments, through: :provider_users

    validates :username, presence: true 
    validates :username, uniqueness: true 
    validates :intelligence, :strength, :speed, :durability, :power, :combat, numericality: { less_than: 50 }

    has_secure_password

    def customer_appointments
        x = Appointment.all.select do |appt|
            appt.customer_id == self.id
        end
        y = x.sort do |appt1, appt2| 
            appt1.start_time_military <=> appt2.start_time_military
        end
        y
    end

    def hero_appointments
        x = Appointment.all.select do |appt|
            appt.hrs_id == self.id
        end
        y = x.sort do |appt1, appt2| 
            appt1.start_time_military <=> appt2.start_time_military
        end
        y
    end

    def hero_appointments_for_validation
        x = Appointment.all.select do |appt|
            appt.hrs_id == self.id
        end
    end



    def total_appointments
        self.customer_appointments + self.hero_appointments
    end

    def hours_booked
        hours_booked = []
        array_of_appointments = self.hero_appointments_for_validation
        # array_of_appointments.delete(self.hero_appointments_for_validation.last)
        array_of_appointments.each do |appointment|
            total_time = appointment.end_time_military - appointment.start_time_military
            index = 0 
            while index < total_time do 
                hours_booked << appointment.start_time_military + index
                index += 1
            end
        end
        hours_booked
    end

    def self.search(search)   
        if search
            names = User.where(name: search, is_hero: "true")
            if names.any?
                user = User.where(name: search, is_hero: "true")
            else 
                User.all.select do |us|
                    us.is_hero == true   
                end
            end
        else
            User.all.select do |us|
                us.is_hero == true   
            end
        end
    end

    def first_and_last_name
        "#{self.first_name} #{self.last_name}"
    end

    def welcome
        "#{self.name}'s Page"
    end

end
