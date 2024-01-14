class Customer < ApplicationRecord
    #validations
    validates :firstname, presence: true
    validates :lastname, presence: true
end
