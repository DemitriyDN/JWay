class Tag < ActiveRecord::Base
  has_and_belongs_to_many :posts

  validates :name, presence: true

  default_scope { order('priority', 'name') }

  # scope :by_name_and_priority, -> { order('priority', 'name') }
  # default_scope by_name_and_priority

  PRIORITY_RANGE = 1..100

  def self.reject_blank_from param
    param[:tag_ids] = param[:tag_ids].reject(&:empty?)
    param
  end
end
