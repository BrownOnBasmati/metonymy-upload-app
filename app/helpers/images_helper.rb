require 'digest/md5'

module ImagesHelper
    TAG_PREFIX = 'upload'.freeze
    def upload_tag
        begin
            k=Digest::MD5.hexdigest("we love animals #{rand} #{Time.now.to_f}")
            "#{TAG_PREFIX}[#{k}]"
        end
    end
end
