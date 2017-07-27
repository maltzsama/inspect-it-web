class Inspection < ApplicationRecord
    validates :name, presence: true 
    belongs_to :company
    has_many :occurrences
end
