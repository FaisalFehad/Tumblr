class Post < ActiveRecord::Base
   has_many :comments, dependent: :destroy
   validates :title, presence: true, length: { in: 2..20 }
   validates :content, presence: true, length: {in: 3..140}
end
