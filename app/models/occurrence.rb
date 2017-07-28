class Occurrence < ApplicationRecord
    mount_uploader :image, ImageUploader 
    belongs_to :inspection 
    belongs_to :regulation
end
