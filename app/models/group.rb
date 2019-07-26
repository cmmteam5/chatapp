class Group < ApplicationRecord
  belongs_to :workspace

  has_many :groupusers, dependent: :destroy
  has_many :users, through: :groupusers
  
  has_many :groupconversations
  
end
