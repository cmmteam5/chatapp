class User < ApplicationRecord
	has_many :userworkspaces, dependent: :destroy
	has_many :workspaces, through: :userworkspaces
	has_many :groupusers, dependent: :destroy
	has_many :groups, through: :groupusers
	has_many :groupconversations, dependent: :destroy 
	validates :name, length: { minimum: 6 }
	validates :email, length: { minimum: 6 }
	has_secure_password

	paginates_per 5
end