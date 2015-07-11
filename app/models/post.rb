#encoding: UTF-8
class Post < ActiveRecord::Base
  has_and_belongs_to_many :tags
  belongs_to :user #加上user的關聯
  belongs_to :author, class_name: 'User',
             foreign_key: :user_id
  validates :title, :content, presence: true
  #validate :title_must_start_with_x
  before_validation :set_content_from_title

 # def title_must_start_with_x #validate implementation
  #  unless title.to_s.start_with? 'X'
   #   errors.add(:title, '開頭必須是X')
   # end
  #end

def set_content_from_title #callback implementation
    self.content = title if content.blank?   
end

end
