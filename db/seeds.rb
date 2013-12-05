User.first.playlists.find(2).songs << Song.create(title: "Lovin It", artist: "Marian Hill", url: "https://soundcloud.com/marianhill/lovit-1", source: "SoundCloud", plays: 2, shares: 5, favorites: 10)
User.first.playlists.find(2).songs << Song.create(title: "Whisky", artist: "Marian Hill", url: "https://soundcloud.com/marianhill/whisky", source: "SoundCloud", plays: 3, shares: 7, favorites: 14)
User.first.playlists.find(2).songs << Song.create(title: "Eden", artist: "Ben Khan", url: "https://soundcloud.com/benkhan/eden", source: "SoundCloud", plays: 5, shares: 8, favorites: 21)
User.first.playlists.find(2).songs << Song.create(title: "Undiscovered", artist: "Laura Welsh", url: "https://soundcloud.com/laurawelsh/undiscovered-1", source: "SoundCloud", plays: 8, shares: 12, favorites: 21)
User.first.playlists.find(2).songs << Song.create(title: "Summer", artist: "Paris Jones", url: "https://soundcloud.com/serendeee/summer-ft-april-kelly-b-a", source: "SoundCloud", plays: 15, shares: 15, favorites: 14)
User.first.playlists.find(2).songs << Song.create(title: "Termanology", artist: "Take My Turn", url: "https://soundcloud.com/macmediapromo/termanology-f-action-bronson", source: "SoundCloud", plays: 4, shares: 7, favorites: 12)
User.first.playlists.find(2).songs << Song.create(title: "Mean Streets", artist: "Tennis", url: "https://soundcloud.com/tennisinc/mean-streets-1", source: "SoundCloud", plays: 7, shares: 12, favorites: 9)
User.first.playlists.find(2).songs << Song.create(title: "Dreams", artist: "wet", url: "https://soundcloud.com/wetnyc/dreams", source: "SoundCloud", plays: 11, shares: 22, favorites: 3)
User.first.playlists.find(2).songs << Song.create(title: "Sand Through Fingers", artist: "Handbook", url: "https://soundcloud.com/handbook/handbook-sand-through-fingers", source: "SoundCloud", plays: 24, shares: 1, favorites: 5)
User.first.playlists.find(2).songs << Song.create(title: "White Tiger Remix", artist: "Izzy Bizu", url: "https://soundcloud.com/wantigga/white-tiger-wantigga-remix", source: "SoundCloud", plays: 7, shares: 32, favorites: 7)

Song.all.each do |song|
  client = SoundCloud.new(:client_id => ENV['SOUNDCLOUD_CLIENT_ID'])
  track = client.get('/resolve', :url => song.url)
  song.update(stream_id: track["id"])
end


