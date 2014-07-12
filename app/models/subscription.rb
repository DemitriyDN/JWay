class Subscription < ActiveRecord::Base
  validates :last_id, numericality: true
  validates :email, :last_id, presence: true
  validates :email, length: { minimum: 7, maximum: 254 }

  scope :get_unconfirmed, ->(id) { where('last_id < ?', id) }

  def self.send_notification_with id
    subscribers = Subscription.get_unconfirmed(id)

    subscribers.each do |subscriber|
      SubscriptionNotifier.notify(subscriber.email).deliver
      subscriber.update_attribute(:last_id, id)
    end
  end
end
