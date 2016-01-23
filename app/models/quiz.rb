class Quiz < ActiveRecord::Base
    has_many :personalities
    has_many :questions
    validates :name, presence: true
    validates :description, presence: true
end
