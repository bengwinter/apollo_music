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

  $('#create-playlist').click(function(e){
    e.preventDefault();
    var name = $('#new-playlist-name').val();

    $('#name').val('');

    // Make the Ajax call to create the new post. 
    // This ajax will evaluate as truthy, turning it back on for a normal submit
    $.ajax({
      url: 'create_playlist',
      type: 'POST',
      data: {name: name},
      success: function(){
      }
    });
    // Return false so the value of this button isn't truthy, and doesn't submit
    return false;
  });

  $('.single-playlist').click(function(e){
    e.preventDefault();
    var playlist_id = e.target.id;

    $.ajax({
      url: 'single_playlist_fetch',
      type: 'GET',
      data: {playlist_id: playlist_id},
      success: function(){
      }
    });
    return false;
  });

  $('#add-song').click(function(e){
    e.preventDefault();
    var playlist_id = $('#new-song-playlist-id').val();
    var song_url = $('#new-song-url').val();
    var song_title = $('#new-song-title').val();
    var song_title = $('#new-song-artist').val();

    $('#new-song-url').val('');
    $('#new-song-playlist-id').val('');
    $('#new-song-title').val('');
    $('#new-song-artist').val('');

    $.ajax({
      url: 'add_song',
      type: 'POST',
      data: {playlist_id: playlist_id, song_url: song_url},
      success: function(){
      }
    });
    return false;
  });
});