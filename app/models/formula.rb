class Formula < ApplicationRecord
    validates :for1, presence: true
    validates :cantidad, presence: true
    validates :factor, presence: true


    belongs_to :admin_user
    belongs_to :product


   
end
