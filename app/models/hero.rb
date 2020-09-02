class Hero < ApplicationRecord
    belongs_to :customer, class_name: 'User'
    belongs_to :hrs, class_name: 'User'
end