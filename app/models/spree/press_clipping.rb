class Spree::PressClipping < ActiveRecord::Base

  has_many :images, -> { order(:position) }, as: :viewable, dependent: :destroy, class_name: "Spree::Image"

  validates :name, :published_at, presence: true

end