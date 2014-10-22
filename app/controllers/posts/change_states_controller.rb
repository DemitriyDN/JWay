class Posts::ChangeStatesController < ApplicationController
  def update
    find_post_by('url_link')

    Posts::State.change_state(@post, swich_params[:state])

    render nothing: true
  end

  private
  def swich_params
    params.permit( :id, :state )
  end
end
