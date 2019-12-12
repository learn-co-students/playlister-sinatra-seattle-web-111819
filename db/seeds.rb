# Add seed data here. Seed your database with `rake db:seed`

Artist.find_or_create_by(name: "Arty")
Artist.find_or_create_by(name: "Brody")

Genre.find_or_create_by(name: "Rock")
Genre.find_or_create_by(name: "Roll")

Song.find_or_create_by(name: "Arty Rocks AND Rolls", artist_id: 1)
Song.find_or_create_by(name: "Brody Rocks AND Rolls 2", artist_id: 2)

SongGenre.find_or_create_by(song_id: 1, genre_id: 1)
SongGenre.find_or_create_by(song_id: 1, genre_id: 2)
SongGenre.find_or_create_by(song_id: 2, genre_id: 1)
SongGenre.find_or_create_by(song_id: 2, genre_id: 2)
