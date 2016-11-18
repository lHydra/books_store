class Book < ApplicationRecord
  belongs_to :user

  @types = ['application/pdf', 'application/epub+zip', 'plain/text']
  has_attached_file :image, styles: { medium: '500x500>', thumb: '300x300>' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_attached_file :document,
                              url: '/attach/:basename.:extension',
                              path: ':rails_root/public/attach/:basename.:extension'
  validates_attachment_content_type :document, content_type: @types
  
  validates :image, presence: true
  validates :title, length: { in: 4..40 }
  validates :description, length: { in: 100..250 }
end
