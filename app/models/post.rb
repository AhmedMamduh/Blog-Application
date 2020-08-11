class Post < ApplicationRecord
  #------------------------------ Associations --------------------------------
  belongs_to :author, class_name: 'User', foreign_key: "user_id"
  acts_as_taggable_on :tags
  #------------------------------- Validations --------------------------------
  validates :tag_list, presence: true
  #--------------------------------- Methods ---------------------------------
  def user_is_author?(current_user_id)
    current_user_id == user_id
  end
end
