class Comment < ActiveRecord::Base
  belongs_to :post
  validates :name, presence: true
  validates :content, presence: true, length: {maximum: 140}
end
