class FeedbackSerializer < ActiveModel::Serializer
  attributes :id, :project_name, :app_name, :app_comp, :feedback_title, :feedback_desc, :screenshot,:email
  has_many :user
end
