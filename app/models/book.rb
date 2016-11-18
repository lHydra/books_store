class Book < ApplicationRecord
  belongs_to :user
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :image, presence: true
  validates :title, length: { in: 4..40 }
  validates :description, length: { in: 100..250 }
end
