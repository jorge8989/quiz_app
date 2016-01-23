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
  
  function handleEvents() {
      $submitButton.on('click', function() {
         $quizForm.hide();
         $quizResults.show();
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