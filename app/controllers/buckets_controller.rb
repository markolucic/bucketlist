class BucketsController < ApplicationController
  before_action :find_bucket, only: [:show, :edit, :delete, :like, :dislike, :add_to_my_list, :remove_from_my_list]
  before_action :authenticate_user!, only: [:like, :dislike, :add_to_my_list, :remove_from_my_list]

  include BucketsHelper

  def index
    @buckets = Bucket.all
  end

  def show
  end

  def new
    @bucket = Bucket.new
  end

  def create
    bucket = Bucket.create!(bucket_params)
    bucket.users << current_user
    if bucket.save
      flash[:success] = 'Successfully created!' 
      redirect_to bucket
    else
      flash[:error] = 'There was an error while creating!'
      render 'new'
    end
  end

  def my_list 
    @my_buckets = []
    Bucket.all.each do |b| 
      @my_buckets << b if current_user.buckets.include? b
    end
  end

  def like
    return false if liked?(@bucket)
    @bucket.like!
    UserLike.create!(user: current_user, bucket: @bucket)
    redirect_to root_path
  end

  def dislike
    return false unless liked?(@bucket)
    @bucket.dislike!
    UserLike.where(user: current_user, bucket: @bucket).last.destroy
    redirect_to root_path
  end

  def add_to_my_list
    @bucket.users << current_user
    redirect_to root_path
  end

  def remove_from_my_list
    @bucket.users.delete(current_user)
    redirect_to root_path
  end

  private

  def find_bucket
    @bucket ||= Bucket.find_by(id: params[:id])
  end

  def bucket_params
    params.require(:bucket).permit(:name, :description, :image_url)
  end
end
