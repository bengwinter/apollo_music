User.first.playlists.find(2).songs << Song.create(title: "Lovin It", artist: "Marian Hill", url: "https://soundcloud.com/marianhill/lovit-1", source: "SoundCloud", play_count: 2, share_count: 5, favorite_count: 10)
User.first.playlists.find(2).songs << Song.create(title: "Whisky", artist: "Marian Hill", url: "https://soundcloud.com/marianhill/whisky", source: "SoundCloud", play_count: 3, share_count: 7, favorite_count: 14)
User.first.playlists.find(2).songs << Song.create(title: "Eden", artist: "Ben Khan", url: "https://soundcloud.com/benkhan/eden", source: "SoundCloud", play_count: 5, share_count: 8, favorite_count: 21)
User.first.playlists.find(2).songs << Song.create(title: "Undiscovered", artist: "Laura Welsh", url: "https://soundcloud.com/laurawelsh/undiscovered-1", source: "SoundCloud", play_count: 8, share_count: 12, favorite_count: 21)
User.first.playlists.find(2).songs << Song.create(title: "Summer", artist: "Paris Jones", url: "https://soundcloud.com/serendeee/summer-ft-april-kelly-b-a", source: "SoundCloud", play_count: 15, share_count: 15, favorite_count: 14)
User.first.playlists.find(2).songs << Song.create(title: "Termanology", artist: "Take My Turn", url: "https://soundcloud.com/macmediapromo/termanology-f-action-bronson", source: "SoundCloud", play_count: 4, share_count: 7, favorite_count: 12)
User.first.playlists.find(2).songs << Song.create(title: "Mean Streets", artist: "Tennis", url: "https://soundcloud.com/tennisinc/mean-streets-1", source: "SoundCloud", play_count: 7, share_count: 12, favorite_count: 9)
User.first.playlists.find(2).songs << Song.create(title: "Dreams", artist: "wet", url: "https://soundcloud.com/wetnyc/dreams", source: "SoundCloud", play_count: 11, share_count: 22, favorite_count: 3)
User.first.playlists.find(2).songs << Song.create(title: "Sand Through Fingers", artist: "Handbook", url: "https://soundcloud.com/handbook/handbook-sand-through-fingers", source: "SoundCloud", play_count: 24, share_count: 1, favorite_count: 5)
User.first.playlists.find(2).songs << Song.create(title: "White Tiger Remix", artist: "Izzy Bizu", url: "https://soundcloud.com/wantigga/white-tiger-wantigga-remix", source: "SoundCloud", play_count: 7, share_count: 32, favorite_count: 7)

Song.all.each do |song|
  client = SoundCloud.new(:client_id => ENV['SOUNDCLOUD_CLIENT_ID'])
  track = client.get('/resolve', :url => song.url)
  song.update(stream_id: track["id"])
end


