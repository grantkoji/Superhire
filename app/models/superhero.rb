require 'net/http'
require 'open-uri'
require 'json'

class Superhero < ApplicationRecord
    has_many :appointments
    has_many :users, through: :appointments 

    def self.price(attributes)
        price = 0 
        attributes.each do |attribute|
            if attribute == 100
                price += 10000000
            elsif attribute >= 90
                price += 1000000
            elsif attribute >= 80
                price += 50000
            elsif attribute >= 70 
                price += 20000
            elsif attribute >= 60
                price += 7500
            elsif attribute >= 50
                price += 2000
            elsif attribute >= 25
                price += 100
            else
                price += 20
            end
        end
        price
    end

    def self.search_api(hero_name)
        name_array = hero_name.split(" ")
        name = name_array.join("_")
        info = URI.parse("https://superheroapi.com/api.php/10100168794062182/search/#{name}")
        response = Net::HTTP.get_response(info)
        api_hero_information = JSON.parse(response.body)
        super_search = [] 
        if api_hero_information["response"] == "success"
            price_attributes = []
            api_hero_information["results"].each do |hero_info|
                website_id = hero_info["id"].to_i
                if Superhero.find_by(website_id: website_id)
                    superhero = Superhero.find_by(website_id: website_id)
                    super_search << superhero
                else 
                    name = hero_info["name"]
                    intelligence = hero_info["powerstats"]["intelligence"].to_i
                    price_attributes << intelligence
                    strength = hero_info["powerstats"]["strength"].to_i
                    price_attributes << strength
                    speed = hero_info["powerstats"]["speed"].to_i
                    price_attributes << speed
                    durability = hero_info["powerstats"]["durability"].to_i
                    price_attributes << durability
                    power = hero_info["powerstats"]["power"].to_i
                    price_attributes << power
                    combat = hero_info["powerstats"]["combat"].to_i
                    price_attributes << combat
                    alignment = hero_info["biography"]["alignment"]
                    img_url = hero_info["image"]["url"]
                    price = Superhero.price(price_attributes)
                    alter_ego = hero_info["biography"]["aliases"][0]
                    if alignment == "bad"
                        price = price * 2
                    end
                    new_sup = Superhero.create(alter_ego: alter_ego, name: name, intelligence: intelligence, strength: strength, speed: speed, durability: durability, power: power, combat: combat, alignment: alignment, img_url: img_url, price: price, website_id: website_id)
                    super_search << new_sup
                end
            end 
        end
        super_search
    end

    def name_and_alter
        "#{self.name} - Alias: #{self.alter_ego}"
    end

    def superhero_appointments 
        x = Appointment.all.select do |appt|
            appt.superhero_id == self.id
        end
        y = x.sort do |appt1, appt2| 
            appt1.start_time_military <=> appt2.start_time_military
        end
        y
    end

    def hours_booked
        hours_booked = []
        array_of_appointments = self.superhero_appointments
        array_of_appointments.delete(self.superhero_appointments.last)
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

end