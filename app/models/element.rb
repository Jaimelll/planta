class Element < ApplicationRecord
    belongs_to :admin_user
    has_many :details
end
