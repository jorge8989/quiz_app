function processQuiz() {
  var $quizForm = $('.quiz-form');
  var $quizResults = $('.quiz-results');
  var $submitButton = $('.submit-quiz');
  var totalQuestions = parseInt($('.number-of-questions').html());
  
  function init() {
      handleEvents();
      disableEnableSubmitButton();
  }
  
  function disableEnableSubmitButton() {
      var checkedRadioButtons = $('input[type="radio"]:checked');
      if (checkedRadioButtons.length < totalQuestions) {
          $submitButton.prop('disabled', 'disabled');
      } else {
          $submitButton.prop('disabled', false);
      }
  }
  
  function maxFreq(personalityIds) {
     var frequency = {};
     var max = 0;
     for (var i = 0; i < personalityIds.length; i++) {
        frequency[personalityIds[i]] = (frequency[personalityIds[i]] || 0)+1;
        if (frequency[personalityIds[i]] > max) {
            var max = personalityIds[i];
        }
     }
     
     return max;
  }
  
  function processAnswers() {
      var answers = []
      var personalityId;
      $('input[type="radio"]:checked').each(function(){
          answers.push(parseInt($(this).val()));
      });

      personalityId = maxFreq(answers)
      $.ajax({
          url: '/personalities/'+personalityId+'.json',
          dataType: 'json',
          success: function(data) {
              $quizForm.hide();
              $('.your-personality').text('You are '+data.name)
              $('.results-description').text(data.description)
              $quizResults.show();
          }
      })
  }
  
  function handleEvents() {
      $submitButton.on('click', function() {
         processAnswers();
      });
      $('input[type="radio"]').on('change', function() {
          disableEnableSubmitButton();
      })
  };
  
  init();
};

$(function() {
   if ($(".quiz-form").length > 0) {
       processQuiz();
   }
});