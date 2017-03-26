class User < ActiveRecord::Base

  # associations
   has_many :posts, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # paperclip profile image
  has_attached_file :avatar, styles: { thumb: "100x100>", tiny: "50x50" },
                                      default_url: "/images/:style/missing.png"
  validates_attachment :avatar, content_type: { content_type: ["image/jpg","image/jpeg",
                                                              "image/png", "image/gif"] }
end
