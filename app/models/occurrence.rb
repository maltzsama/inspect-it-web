class Occurrence < ApplicationRecord
    mount_uploader :image, ImageUploader 
end
