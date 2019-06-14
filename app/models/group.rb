class Group < ApplicationRecord
  belongs_to :workspace
  has_and_belongs_to_many :users
  has_many :group_conversations

end
