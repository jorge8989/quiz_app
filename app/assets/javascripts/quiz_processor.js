function processQuiz() {
  //DOM elements
  var $quizForm = $('.quiz-form');
  var $quizResults = $('.quiz-results');
  var $yourScore = $('.your-score');
  var $submitButton = $('.submit-quiz');
  var $personalityDescription = $('.personality-description');
  var $pointsField = $('#user_result_points');
  var $personalityIdField = $('#user_result_personality_id');
  var $personalityImage = $('.personality-image');
  
  //DOM data
  var quizId = $quizForm.data('id');
  var totalQuestions = $quizForm.data('total-questions');
  
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
      //ajax call to get all the personalities values of this quiz 
      $.ajax({
         url: '/quizzes/'+quizId+'.json',
         dataType: 'json',
         success: function(data) {
          var personalities = data.personalities;
          var result;
          $.each(personalities, function(index, personality) {
            var references = _.range(personality.low_range, personality.high_range+1);
            //the _.range functions is from the underscore framework
            if (references.indexOf(points) != -1) {
              result = personality;
            }
          });
          $personalityIdField.attr('value', result.id);
          $personalityDescription.text(result.description);
          $personalityImage.attr('src', result.image_med_url);
          //this is the ajax call that saves the result
          $.ajax({
            type: 'POST',
            url: $('form').attr('action'),
            data: $('form').serialize(),
            dataType: 'json',
            success: function() {
            }
          });
         } 
      });
      //AJAX
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
      });
  }
  
  init();
}

$(function() {
   if ($(".quiz-form").length > 0) {
       processQuiz();
   }
});