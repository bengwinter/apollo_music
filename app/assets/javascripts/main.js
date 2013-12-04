$(document).ready(function(){
  $('#create_user_submit').click(function(e){
    e.preventDefault();
    var email = $('#email').val();
    var password = $('#password').val();
    var access_token = $('#access_token').val();
    var expiration = $('#expiration').val();
    var refresh_token = $('#refresh_token').val();


    $('#email').val('');
    $('#password').val('');
    $('#access_token').val('');
    $('#expiration').val('');
    $('#refresh_token').val('');


    // Make the Ajax call to create the new post. 
    // This ajax will evaluate as truthy, turning it back on for a normal submit
    $.ajax({
      url: 'create_user',
      dataType: 'html',
      type: 'POST',
      data: {email: email, password: password, access_token: access_token, expiration: expiration, refresh_token: refresh_token},
      success: function(){
        window.location.href = 'http://localhost:3000';
      }
    });
    // Return false so the value of this button isn't truthy, and doesn't submit
    return false;
  });
});