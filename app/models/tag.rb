class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts

  validates :name, presence: true

  scope :by_name_and_priority, -> { order('priority', 'name') }

  default_scope { order('priority', 'name') }
  # default_scope by_name_and_priority

  PRIORITY_RANGE = 1..100
end
