import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.querySelectorAll('#address-input');
  if (addressInput) {
    places({ container: addressInput });
  }
};

export { initAutocomplete };

