$(document).ready(function(){
  $('#create_user_submit').click(function(e){
    e.preventDefault();
    var email = $('#email').val();
    var password = $('#password').val();
    var code = $('#code').val();

    $('#email').val('');
    $('#password').val('');
    $('#code').val('');

    // Make the Ajax call to create the new post. 
    // This ajax will evaluate as truthy, turning it back on for a normal submit
    $.ajax({
      url: 'create_user',
      dataType: 'html',
      type: 'POST',
      data: {email: email, password: password, sc_access_token: code},
      success: function(){
        alert('fuck ben')
      }
    });
    // Return false so the value of this button isn't truthy, and doesn't submit
    return false;
  });
});