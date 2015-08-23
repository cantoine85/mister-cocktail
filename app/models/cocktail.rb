class Cocktail < ActiveRecord::Base

  # Associations
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  # Validations
  validates :name, presence: true
  validates :name, uniqueness: true

  # Paperclip : Add picture to a cocktail
  has_attached_file :picture,
    styles: { medium: "500x500>", thumb: "100x100>" }

  # Validations for attachment content type
  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
end
