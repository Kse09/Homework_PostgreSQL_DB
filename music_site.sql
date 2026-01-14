CREATE TABLE IF NOT EXISTS genre (
	id_genre SERIAL PRIMARY KEY,
	genre_name VARCHAR(40) UNIQUE NOT NULL 
);

CREATE TABLE IF NOT EXISTS artist (
	id_artist SERIAL PRIMARY KEY,
	name VARCHAR(80) NOT NULL 
);

CREATE TABLE IF NOT EXISTS artist_genre (
	id_artist INTEGER REFERENCES artist(id_artist),
	id_genre INTEGER REFERENCES genre(id_genre),
	CONSTRAINT pk_artist_genre PRIMARY KEY (id_artist, id_genre)
);

CREATE TABLE IF NOT EXISTS album (
	id_album SERIAL PRIMARY KEY, 
	album_name VARCHAR(60) NOT NULL,
	release_year integer NOT NULL
);

CREATE TABLE IF NOT EXISTS album_artist (
	id_album INTEGER REFERENCES album(id_album),
	id_artist INTEGER REFERENCES artist(id_artist),
	CONSTRAINT pk_album_artist PRIMARY KEY (id_album, id_artist)
);

CREATE TABLE IF NOT EXISTS track (
	id_track SERIAL PRIMARY KEY,
	track_name VARCHAR(60) NOT NULL,
	duration INTEGER NOT NULL,
	id_album INTEGER NOT NULL REFERENCES album(id_album)
);

CREATE TABLE IF NOT EXISTS collection (
	id_collection SERIAL PRIMARY KEY,
	collection_name VARCHAR(60) NOT NULL,
	collection_release integer
);

CREATE TABLE IF NOT EXISTS collection_tracks (
	id_collection INTEGER NOT NULL REFERENCES collection(id_collection),
	id_track INTEGER NOT NULL REFERENCES track(id_track),
	CONSTRAINT pk_col_tr PRIMARY KEY (id_collection, id_track)
);
 