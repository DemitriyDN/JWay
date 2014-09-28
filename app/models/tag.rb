class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts

  validates :name, presence: true

  scope :by_name, -> { order('name') }

  # default_scope by_name
end
