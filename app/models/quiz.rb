class Quiz < ActiveRecord::Base
    has_many :personalities
    has_many :questions
    validates :name, presence: true
    validates :description, presence: true
    
    scope :with_questions_count_greater_than, -> (number) {
        joins(:questions).group('quizzes.id')
        .having('count(quiz_id) > ?', number)
    }

end
