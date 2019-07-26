class Workspace < ApplicationRecord

<<<<<<< HEAD
    paginates_per 1
=======
>>>>>>> c97fc7dfbd02e1f7b6f10eb08866af686d07cd79
    has_many :userworkspaces, dependent: :destroy
    has_many :users, through: :userworkspaces
    validates :name, presence: true
end
