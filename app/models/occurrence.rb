class Occurrence < ApplicationRecord
    mount_uploader :image, ImageUploader 
    belongs_to :inspection

    def image_url
        if image?
            image
        end
    end
end
