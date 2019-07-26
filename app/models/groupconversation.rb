class Groupconversation < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :groupthreads
  
end
