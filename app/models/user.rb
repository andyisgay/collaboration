class User < ActiveRecord::Base
	validates :name, :presence => true
	validates :email, :presence => true
	has_many :posts
	has_secure_password
	#mount_uploader :picture, PictureUploader 
    has_attached_file :file,
	                  styles: {medium: "300x300>", thumb: "100x100>"},
	                  default_url: "/images/:style/missing.png"
	validates_attachment_content_type :file, content_type: /\Aimage\/.*\Z/
	
	extend SimpleCalendar

    has_calendar attribute: :start_time

	def picture_changed?
     true
    end  

    def start_time
     created_at
    end

                 
end
