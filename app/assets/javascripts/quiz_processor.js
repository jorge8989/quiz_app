function processQuiz() {
  //DOM elements
  var $quizForm = $('.quiz-form');
  var $quizResults = $('.quiz-results');
  var $yourScore = $('.your-score');
  var $submitButton = $('.submit-quiz');
  var totalQuestions = $('.quiz-question').length
  var $pointsField = $('#user_result_points');
  var $personalityIdField = $('#user_result_personality_id');
  
  
  var quizId = $quizForm.data('id');
  
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
      $.ajax({
         url: '/quizzes/'+quizId+'.json',
         dataType: 'json',
         success: function(data) {
          var personalities = data.personalities;
          $.each(personalities, function(index, personality) {
            var references = _.range(personality.low_range, personality.high_range+1);
            if (references.indexOf(points) != -1) {
              $personalityIdField.attr('value', personality.id);
            }
          });
         } 
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