class Image < ActiveRecord::Base
    belongs_to :artist

    def url size
        [API_IMAGE,self.id,size.to_s,self.file_name].join('/')
    end
end
