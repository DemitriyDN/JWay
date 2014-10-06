module Searchable
  extend ActiveSupport::Concern

  included do
    scope :available_for, -> (user) { user ? all : where(status: 1) }
    scope :sort_by_date, -> { order('created_at DESC') }
    scope :limit_rand, ->(num) { limit(num).order('RANDOM()') }
    scope :get_last_availible_id, -> { where(status: 1).last.id }
  end
end
