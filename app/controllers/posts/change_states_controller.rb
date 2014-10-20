class Posts::ChangeStatesController < ApplicationController
  def update
    find_post

    State.change_state(@post, swich_params[:state])

    render nothing: true
  end

  private
  def swich_params
    params.permit( :id, :state )
  end
end
