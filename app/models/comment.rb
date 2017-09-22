class Comment < ApplicationRecord
  belongs_to :feedback
  belongs_to :user

  has_many :feedback
  has_many :user
end
