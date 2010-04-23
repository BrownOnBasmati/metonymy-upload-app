class Artist < ActiveRecord::Base
    has_many :editions, :dependent => :destroy
    has_many :images, :through => :editions

    accepts_nested_attributes_for :images, :allow_destroy => true
end
