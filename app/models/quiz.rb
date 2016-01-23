class Quiz < ActiveRecord::Base
    has_many :personalities
    validates :name, presence: true
    validates :description, presence: true
end
