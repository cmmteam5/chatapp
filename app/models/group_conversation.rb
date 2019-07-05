class GroupConversation < ApplicationRecord
  belongs_to :group
  has_many :group_threads
end
