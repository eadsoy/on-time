curl -H "Authorization: Basic ZjM4Zj...Y0MzE=" -d grant_type=refresh_token -d refresh_token=NgAagA...NUm_SHo 



const spotifySearchTest = () => {
  const refreshUrl = 'https://accounts.spotify.com/api/token'
  const baseUrl =
    "https://api.spotify.com/v1/me/tracks?market=ES&limit=10&offset=5";
  const refreshToken = gon.token;
  const button = document.getElementById("btn-try");
  const getTracks = () => {
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
        console.log(data);
      });
  };
  button.addEventListener("click", getTracks);
};

export { spotifySearchTest };
