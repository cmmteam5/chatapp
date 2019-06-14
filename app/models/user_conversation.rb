class UserConversation < ApplicationRecord
  belongs_to :user
  has_many :user_threads
end
