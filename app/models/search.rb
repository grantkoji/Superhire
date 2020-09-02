class Search < ApplicationRecord

    def search_heroes


        if self.minimum_price != nil && self.maximum_price != nil
            # User.where("price > #{self.minimum_price}", is_hero: "true").and(User.("price < #{self.maximum_price}", is_hero: "true"))
          User.where("price >= #{self.minimum_price} and price <= #{self.maximum_price}", is_hero: "true")
        elsif self.minimum_price
            User.where("price >= #{self.minimum_price}", is_hero: "true")
        elsif self.maximum_price
            User.where("price <= #{self.maximum_price}", is_hero: "true")
        else
            nil
        end
    end

     # Search method in model called users by name
        # search method with whatever end point.
        # Itll do a findby

        # heroes = []
   
        # if self.minimum_price != nil
        #     heroes << User.where(["price > ?", minimum_price], is_hero: "true")
        # end
        # if self.maximum_price != nil
        #     heroes << User.where(["price < ?", maximum_price], is_hero: "true")
        # end
        # if self.minimum_intelligence != nil
        #     heroes << User.where(["intelligence > ?", minimum_intelligence], is_hero: "true")
        # end
        # if self.minimum_strength != nil
        #     heroes << User.where(["strength > ?", minimum_strength], is_hero: "true")
        # end
        # if self.minimum_speed != nil
        #     heroes << User.where(["speed > ?", minimum_speed], is_hero: "true")
        # end
        # if self.minimum_durability != nil
        #     heroes << User.where(["durability > ?", minimum_durability], is_hero: "true")
        # end
        # if self.minimum_power != nil
        #     heroes << User.where(["power > ?", minimum_power], is_hero: "true")
        # end
        # if self.minimum_combat != nil
        #     heroes << User.where(["price > ?", minimum_combat], is_hero: "true")
        # end
        # if self.location != ""
        #     heroes << User.where(["location LIKE ?", location], is_hero: "true")
        # end
        # heroes.uniq
     
    # end
    # <h3> Note that all Ratings Below have a Maximun of 50 Unless Approved by Dr. Charles Xavier</h3>
    # <label>Minimum Intelligence Rating:</label>
    # <%= number_field_tag :minimum_intelligence %><br>
    # <label>Minimum Strength Rating</label>
    # <%= number_field_tag :minimum_strength %><br>
    # <label>Minimum Speed</label>
    # <%= number_field_tag :minimum_speed %><br>
    # <label>Minimum Durability</label>
    # <%= number_field_tag :minimum_durability %><br>
    # <label>Minimum Power</label>
    # <%= number_field_tag :minimum_power %><br>
    # <label>Minimum Combat Ability</label>
    # <%= number_field_tag :minimum_combat %><br>
    # <label> Location </label>
    # <%= f.select :location, ["","NY","DC"] %><br>

end
