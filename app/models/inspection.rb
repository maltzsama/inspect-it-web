class Inspection < ApplicationRecord
    validates :name, presence: true 
    belongs_to :company
    has_many :occurrences, :dependent => :delete_all
end
