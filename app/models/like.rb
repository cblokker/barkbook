class Like < ApplicationRecord
  belongs_to :user
  belongs_to :dog, counter_cache: true

  # not a part of the use_case, but made an assumption that a user cannot
  # like a dog more than once.
  validates :user_id, uniqueness: { scope: :dog_id }
end
