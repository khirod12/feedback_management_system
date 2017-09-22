class CommentSerializer < ActiveModel::Serializer
  attributes :id, :comment_text, :vote_count
  has_many :feedback
  has_many :user
end
