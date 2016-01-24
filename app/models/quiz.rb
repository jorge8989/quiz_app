class Quiz < ActiveRecord::Base
    has_many :personalities
    has_many :questions
    validates :name, presence: true
    validates :description, presence: true
    validates_uniqueness_of :name, scope: :description
    has_attached_file :image, styles: {medium: "300x300>", thumb: "150x150>"}, default_url: "/images/:style/:filename"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
    validates :image, presence: true
    
    scope :with_questions_count_greater_than, -> (number) {
        joins(:questions).group('quizzes.id')
        .having('count(quiz_id) > ?', number)
    }

end
