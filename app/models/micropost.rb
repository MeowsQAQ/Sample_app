class Micropost < ApplicationRecord
  belongs_to :user
  default_scope ->{order(create_at: :desc)}
  mount_uploader :picture ,PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: {maximum:140}
  # 自定义验证
  validate  :picture_size

  private
    def picture_size
      if picture.size >5.megabytes
        errorss.add(:picture , "should be less than 5MB")
      end
    end
end
