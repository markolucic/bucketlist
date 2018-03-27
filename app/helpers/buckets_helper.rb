module BucketsHelper
  def liked?(bucket)
    UserLike.where(user: current_user, bucket: bucket).exists?
  end
end
