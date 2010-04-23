require 'aws/s3'

class ProcessorJob < Struct.new(:file_key,:file_id,:style,:dimensions)
    def perform
        file_path = [IMAGE_CACHE_DIR,file_id,"original",file_key].join('/')
        file_data = File.open(file_path)
        file_processed = Processor::Thumbnail.make(file_data,{:file_id => file_id, :style => style, :geometry => dimensions})
        file_processed_key = "#{file_id}/#{style}/#{file_key}"
        re=/\/var\/www\/image\/processed\//
        file_processed_path = file_processed.path.gsub(re,IMAGE_CACHE_DIR)
        object = AWS::S3::S3Object.store(file_processed_key, file_processed, IMAGE_BUCKET)
        File.delete(file_processed_path) if FileTest.exist?(file_processed_path)
        cache_file(file_processed_key,file_processed_path)
    end
end
