namespace myApp;

entity Genre {
  key ID: UUID;
  image: String(50);
  name: String(50);
  stations: Association to many Station on stations.genre = $self;
}

entity Station {
  key ID: UUID;
  image: String(50);
  audioStream: String(50);
  genre: Association to Genre;
}
