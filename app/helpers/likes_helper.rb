module LikesHelper
  def disable_like_button?(dog)
    !enable_like_button?(dog)
  end

  def enable_like_button?(dog)
    current_user &&
    current_user == dog.user &&
    !current_user.liked?(dog)
  end
end


