class Workspace < ApplicationRecord

    has_many :userworkspaces, dependent: :destroy
    has_many :users, through: :userworkspaces
    validates :name, presence: true
end
