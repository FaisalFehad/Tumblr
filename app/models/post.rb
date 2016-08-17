class Post < ActiveRecord::Base
   has_many :comments, dependent: :destroy
   validates :title, presence: true, length: {in: 2..25 }
   validates :content, presence: true, length: {in: 3..140}
# FriendlyId
   extend FriendlyId
   friendly_id :title, use: :slugged
end
