class Question < ActiveRecord::Base
    belongs_to :quiz
    has_many :quiz_options
    validates :content, presence: true
    validates_uniqueness_of :content, scope: :quiz_id
end
