function processQuiz() {
  var $quizForm = $('.quiz-form');
  var $quizResults = $('.quiz-results');
  var $yourScore = $('.your-score');
  var $submitButton = $('.submit-quiz');
  var totalQuestions = $('.quiz-question').length
  var $pointsField = $('#user_result_points');
  
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
  
  function showResults() {
      var points = 0;
      $('input[type="radio"]:checked').each(function(){
          points+= parseInt($(this).val());
      });
      $quizForm.hide();
      $yourScore.text('score: '+points);
      $pointsField.attr('value', points);
      $quizResults.show();
  }
  
  function handleEvents() {
      $submitButton.on('click', function() {
         showResults();
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