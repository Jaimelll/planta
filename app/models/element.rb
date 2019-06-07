class Element < ApplicationRecord
    belongs_to :admin_user
    has_many :details
    accepts_nested_attributes_for :details
end
