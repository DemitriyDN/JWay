class Subscription < ApplicationController
  before_filter :authenticate_user!, only: [:index]

  def index
    @subscriptions = Subscription.all
  end

  def create
    Subscription.create(subscription_params)
    render nothing: true
  end

  def delete
  end

  private
  def subscription_params
    params.require(:subscription).permit( :email, :last_id )
  end
end
