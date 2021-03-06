const spotifySearchTest = () => {
  const routeDuration = parseInt(gon.duration.toString().replace(".", ""), 10);
  const token = gon.token;
  const button = document.getElementById("btn-try");
  const buttonRefresh = document.getElementById("btn-try-again");
  const tracksUrl = "https://api.spotify.com/v1/me/top/tracks";
  const baseUrl = "https://api.spotify.com/v1/me/top/artists";
  let container = document.querySelector(".spotify.row");
  let tracks = [];
  let artists = [];
  let recommendations = [];
  let artistsParam = "";
  let tracksParam = "";
  let duration = 0;

  // calculate track number based on route duration
  let durationParam = Math.floor(routeDuration / 210000);
  console.log(routeDuration);

  // delete previous data for new request
  const emptyParams = () => {
    tracks = [];
    artists = [];
    artistsParam = "";
    tracksParam = "";
    duration = 0;
    container.innerHTML = "";
  };

  // get User's top artists
  const getUserArtists = () => {
    fetch(`${baseUrl}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${token}`,
        Accept: "application/json",
      },
    })
      .then((response) => response.json())
      .then((data) => {
        data.items.forEach((res) => {
          artists.push({
            id: res.id,
            name: res.name,
            duration: res.duration_ms,
          });
        });
        console.log(data);
        if (artists.length === 1) {
          artistsParam +=
            artists[Math.floor(Math.random() * artists.length)].id;
        } else if (artists.length >= 1) {
          artistsParam +=
            artists[Math.floor(Math.random() * artists.length)].id;
          artistsParam += `%2C${
            artists[Math.floor(Math.random() * artists.length)].id
          }`;
        } else {
          artistsParam = "";
        }
      })
      .then(getUserTracks);
  };

  // get User's top tracks
  const getUserTracks = () => {
    fetch(`${tracksUrl}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${token}`,
        Accept: "application/json",
      },
    })
      .then((response) => response.json())
      .then((data) => {
        data.items.forEach((res) => {
          tracks.push({
            id: res.id,
            name: res.name,
            duration: res.duration_ms,
          });
        });
        if (tracks.length === 1) {
          tracksParam += tracks[Math.floor(Math.random() * tracks.length)].id;
        } else if (artists.length >= 1) {
          tracksParam += tracks[Math.floor(Math.random() * tracks.length)].id;
          tracksParam += `%2C${
            tracks[Math.floor(Math.random() * tracks.length)].id
          }`;
        } else {
          tracksParam = "";
        }
        console.log(data);
      })
      .then(getRecommendations);
  };

  // get recommendations based on user's top artist, tracks and selected category.
  const getRecommendations = () => {
    // const category_id = 'rock';
    let recParams = `seed_genres=rock&limit=${durationParam}&seed_tracks=${tracksParam}&seed_artists=${artistsParam}`;
    let genreUrl = `https://api.spotify.com/v1/recommendations?${recParams}`;
    fetch(`${genreUrl}`, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${token}`,
        Accept: "application/json",
      },
    })
      .then((response) => response.json())
      .then((data) => {
        data.tracks.forEach((track) => {
          if (duration <= routeDuration) {
            duration += track.duration_ms;
            recommendations.push({
              id: track.id,
              name: track.name,
              duration: track.duration_ms,
            });
            const tracksPlayer = `<div id="tracks--${track.id}"><iframe src="https://open.spotify.com/embed/track/${track.id}" height="250" frameborder="0" allowtransparency="true" allow="encrypted-media"></iframe></div>`;
            container.insertAdjacentHTML("beforeend", tracksPlayer);
          }
        });
      });
    // .then(emptyParams);
  };

  button.addEventListener("click", function () {
    getUserArtists();
  });

  buttonRefresh.addEventListener("click", function () {
    emptyParams();
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
