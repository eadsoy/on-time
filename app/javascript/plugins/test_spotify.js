const spotifySearchTest = () => {
  const routeDuration = gon.duration;
  let durationParam = Math.floor(routeDuration / 210.000)
  console.log(routeDuration);
  console.log(durationParam);
  const token = gon.token;
  const button = document.getElementById("btn-try");
  const buttonRefresh = document.getElementById("btn-try-again");
  const tracksUrl = "https://api.spotify.com/v1/me/top/tracks";
  const baseUrl = "https://api.spotify.com/v1/me/top/artists";
  let tracks = [];
  let artists = [];
  let artistsParam = "";
  let tracksParam = "";
  let duration = 0;

  const emptyParams = () => {
    tracks = [];
    artists = [];
    artistsParam = "";
    tracksParam = "";
  }
  
  // get User's top artists and tracks
  const getUserArtists = () => {
    fetch(`${baseUrl}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        'Authorization': `Bearer ${token}`,
        'Accept': "application/json",
      },
    })
      .then((response) => response.json())
      .then((data) => {
        data.items.forEach((res) => {
          artists.push({'id': res.id, 'name': res.name, duration: res.duration_ms}); 
        })
        console.log(data);
        if (artists.length === 1 ) {
          artistsParam += artists[Math.floor(Math.random() * artists.length)].id
        } else if (artists.length >=1) {
          artistsParam += artists[Math.floor(Math.random() * artists.length)].id
          artistsParam += `%2C${artists[Math.floor(Math.random() * artists.length)].id}`
        } else {
          artistsParam = '';
        }
      })
      .then(getUserTracks);
      
  };

  const getUserTracks = () => {
    fetch(`${tracksUrl}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        'Authorization': `Bearer ${token}`,
        'Accept': "application/json",
      },
    })
      .then((response) => response.json())
      .then((data) => {
        data.items.forEach((res) => {
          tracks.push({id: res.id, name: res.name, duration: res.duration_ms}); 
        })
        if (tracks.length === 1 ) {
          tracksParam += tracks[Math.floor(Math.random() * tracks.length)].id
        } else if (artists.length >=1) {
          tracksParam += tracks[Math.floor(Math.random() * tracks.length)].id
          tracksParam += `%2C${tracks[Math.floor(Math.random() * tracks.length)].id}`
        } else {
          tracksParam = '';
        }
        console.log(data);
      })
      .then(getRecommendations); 
  };

  // const calculatePlaylist = () => {
  //   if (duration < routeDuration) {
  //     getUserArtists();
  //   } else if (duration > routeDuration) {
  //     (let i = 0)
  //   }
  //   console.log(duration);
  // }

  // get recommendations based on user's top artist, tracks and selected category.
  const getRecommendations = () => {
    // const category_id = 'rock';  
    let recParams = `seed_genres=rock&limit=${durationParam}&seed_tracks=${tracksParam}&seed_artists=${artistsParam}`;
    let genreUrl = `https://api.spotify.com/v1/recommendations?${recParams}`
    fetch(`${genreUrl}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        'Authorization': `Bearer ${token}`,
        'Accept': "application/json",
      },
    })
      .then((response) => response.json())
      .then((data) => {   
        // data.tracks.forEach(track => {
        //   duration += track.duration_ms;
        // })
        console.log(data);
      })
      // .then(calculatePlaylist)
      .then(emptyParams);
  }

  button.addEventListener("click", function () {
    getUserArtists();
    
  });

  buttonRefresh.addEventListener("click", function () {
    getUserArtists();
  });
};
export { spotifySearchTest };


// const genres = ["acoustic", "alt-rock", "alternative", "ambient", "blues", "british", "chill", "classical", "club", "country", "dance", "deep-house", "disco", "disney", "drum-and-bass", "dubstep", "edm", "electronic", "folk", "french", "funk", "garage", "german", "groove", "grunge", "guitar", "happy", "hard-rock", "heavy-metal", "hip-hop", "holidays", "house", "indie", "jazz", "k-pop", "kids", "metal", "new-release", "party", "piano", "pop", "punk", "r-n-b", "reggae", "road-trip", "rock", "rock-n-roll", "rockabilly", "soul", "soundtracks"]



// // create playlist for User
//   const token = gon.token;
//   const playlistUrl = 'https://api.spotify.com/v1/users/11120027346/playlists'


//   const createPlaylist = () => {
//     const requestData = {
//       "name": "New Playlist",
//       "description": "New playlist description",
//       "public": false
//     }
//     fetch(`${playlistUrl}`, {
//       method: "POST",
//       headers: {
//         "Content-Type": "application/json",
//         'Authorization': `Bearer ${token}`,
//         'Accept': "application/json",
//       },
//       body: JSON.stringify(requestData)
//     })
//       .then((response) => response.json())
//       .then((data) => {
//         console.log(data);
//       });
//   };