class List < ApplicationRecord
    has_many :todos
    belongs_to :user
    
end
