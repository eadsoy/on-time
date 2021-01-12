const spotifySearchTest = () => {
  const refreshUrl = "https://accounts.spotify.com/api/token";
  const baseUrl =
    "https://api.spotify.com/v1/me/tracks?market=ES&limit=10&offset=5";
  const refreshToken = gon.refresh_token;
  const token = gon.token;
  const button = document.getElementById("btn-try");
  const tokenData = {
    grant_type: "refresh_token",
    refresh_token: `${refreshToken}`,
  };

  const refreshTokenTest = () => {
    fetch(`${refreshUrl}`, {
      method: "POST",
      headers: {
        Authorization: token,
      },
      body: JSON.stringify(tokenData),
    })
      .then((response) => response.json())
      .then((data) => {
        console.log(data);
      });
  };

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

  button.addEventListener("click", function () {
    refreshTokenTest();
    // getTracks();
  });
};
export { spotifySearchTest };
