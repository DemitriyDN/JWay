class SubscriptionsController < ApplicationController
  before_filter :authenticate_user!, only: [:index, :delete]

  def index
    @subscriptions = Subscription.all
  end

  def create
    subscription = Subscription.new(subscription_params)

    if subscription.save
      flash[:notice] = 'Подписка оформленна!'
    else
      flash[:alert] = subscription.errors.full_messages.join(', ')
    end

    redirect_to root_path
  end

  def delete
  end

  private
  def subscription_params
    params.require(:subscription).permit( :email, :last_id )
  end
end
