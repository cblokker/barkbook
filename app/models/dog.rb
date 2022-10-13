class Dog < ApplicationRecord
  has_many_attached :images
  belongs_to :user
  has_many :likes, dependent: :destroy

  # Consider DogQuery Object
  scope :order_by_most_liked, -> { order(likes_count: :desc) }
  scope :order_by_name, -> { order(:name) }

  def self.order_by(sorting_method)
    case sorting_method
    when 'order_by_most_liked' then order_by_most_liked
    when 'order_by_name' then order_by_name
    when 'order_by_most_liked_in_last_hour' then order_by_most_liked # TODO
    else order_by_name
    end
  end
end
