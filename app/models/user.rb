class User < ApplicationRecord
  has_and_belongs_to_many :workspaces
  has_and_belongs_to_many :groups
  has_many :user_conversations
end
