class State
  def self.change_state post, state
    if state == 'true'
      post.approved!
    else
      post.verification!
    end
  end
end
