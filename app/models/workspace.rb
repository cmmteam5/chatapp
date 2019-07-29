class Workspace < ApplicationRecord
    paginates_per 1
    has_many :userworkspaces, dependent: :destroy
    has_many :users, through: :userworkspaces
    validates :name, presence: true
end
