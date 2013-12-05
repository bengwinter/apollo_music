$(document).ready(function(){
  $('#create_user_submit').click(function(e){
    e.preventDefault();
    var email = $('#email').val();
    var password = $('#password').val();

    $('#email').val('');
    $('#password').val('');


    // Make the Ajax call to create the new post. 
    // This ajax will evaluate as truthy, turning it back on for a normal submit
    $.ajax({
      url: 'create_user',
      dataType: 'script',
      type: 'POST',
      data: {email: email, password: password},
      success: function(){
      }
    });
    // Return false so the value of this button isn't truthy, and doesn't submit
    return false;
  });
});