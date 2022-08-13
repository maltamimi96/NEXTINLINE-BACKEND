class Client < ApplicationRecord
    belongs_to :store
    validates :first_name,presence:true
    validates :last_name,presence:true
    validates :phone,presence:true
    validates :email,presence:true,uniqueness: true

end
