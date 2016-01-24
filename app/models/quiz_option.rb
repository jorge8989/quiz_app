class QuizOption < ActiveRecord::Base
    belongs_to :question
    belongs_to :personality
    validates :content, presence: true
    validates :question_id, presence: true
    validates :personality_id, presence: true
    validates_uniqueness_of :personality_id, scope: :question_id
    validates_uniqueness_of :content
end
