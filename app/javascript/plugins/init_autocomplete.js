// app/javascript/plugins/init_autocomplete.js
import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('search');
  if (addressInput) {
    places({ container: addressInput }).configure({
      language: 'en'
    })}
  const addressInputTwo = document.getElementById('search-end');
  if (addressInputTwo) {
    places({ container: addressInputTwo }).configure({
      language: 'en'
    })
  };
};


export { initAutocomplete };
