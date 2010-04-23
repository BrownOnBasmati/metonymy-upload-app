class Edition < ActiveRecord::Base
    belongs_to :artist
    belongs_to :image
end
