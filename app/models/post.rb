class Post < ActiveRecord::Base
  # associations
   has_many :comments, dependent: :destroy

  # validations
   validates :title,   presence: true, length: { in: 2..25 }
   validates :content, presence: true, length: { in: 3..140 }

  # FriendlyId
   extend FriendlyId
   friendly_id :title, use: :slugged

  # paperclip
    has_attached_file :image, styles: { post: "700x400>",
    thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    #validates_attachment_content_type :article, content_type: /\Aimage\/.*\Z/
    validates_attachment :image, content_type: { content_type: ["image/jpg",
                                      "image/jpeg", "image/png", "image/gif"] }
  end
