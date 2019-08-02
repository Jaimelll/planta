class Header < ApplicationRecord
    belongs_to :admin_user
    has_many :movements
end
