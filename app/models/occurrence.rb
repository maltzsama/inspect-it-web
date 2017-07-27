class Occurrence < ApplicationRecord
    mount_uploader :image, ImageUploader 
    belongs_to :inspection
end
