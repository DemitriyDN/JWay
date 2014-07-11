class Subscription < ActiveRecord::Base

  validates :last_id, numericality: true
  validates :email, :last_id, presence: true
  validates :email, length: { minimum: 7, maximum: 254 },
                    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
end
