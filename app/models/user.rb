class User < ApplicationRecord
	has_many :userworkspaces, dependent: :destroy
	has_many :workspaces, through: :userworkspaces
	has_many :groupusers, dependent: :destroy
	has_many :groups, through: :groupusers
<<<<<<< HEAD
	has_many :groupconversations, dependent: :destroy  
	validates :name,length: { minimum: 6 }
	validates :email,length: { minimum: 6 }
=======
	has_many :groupconversations, dependent: :destroy 
	validates :name, presence: true, length: { minimum: 6 }
	validates :email, presence: true, length: { minimum: 6 }
>>>>>>> 76932a19b7c98bbff72ab5abc26d355a0e8af2bd
	has_secure_password
end
