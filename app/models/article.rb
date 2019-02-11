class Article < ApplicationRecord
    before_destroy :destroy_attachments
    enum status: [:draft, :published, :archived]
    has_one_attached :image
    
    extend FriendlyId
    friendly_id :title, use: [:finders, :slugged]
    validates_presence_of :title, :slug

    default_scope { order(:published_on) }

protected
    def destroy_attachments
        puts "IN DESTROY ATTACHMENTS"
        if self.image.attached?
            image_uri1 = URI.parse self.image.service_url
        end

        puts "uri 1 is #{image_uri1}"
       
        if image_uri1 == "eventx.storage.googleapis.com"
            image_path1 = image_uri.path.sub("/", "")
            file = Event.storage_bucket.file image_path1
            file.delete
        end
        
       
    end
end
