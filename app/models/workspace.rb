class Workspace < ApplicationRecord
    paginates_per 1
    has_many :userworkspaces, dependent: :destroy
    has_many :users, through: :userworkspaces
    has_many :groups, dependent: :destroy
    validates :name, presence: true

    paginates_per 1
end
