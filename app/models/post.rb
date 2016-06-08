class Post < ActiveRecord::Base
   has_many :comments
   validates :title, presence: true, length: { in: 2..20 }
   validates :content, presence: true, length: {in: 3..140}
end
