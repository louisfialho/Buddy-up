// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initMapbox } from '../plugins/init_mapbox';
import { initChatroomCable } from "../channels/chatroom_channel";
import { initUpdateNavbarOnScroll } from '../components/navbar';
import {add_participants} from './booking';
import { eventsTabs } from '../components/events-tabs';
import { initAutocomplete } from '../plugins/init_autocomplete';
// import { btnBack } from '../components/return-back';

document.addEventListener('turbolinks:load', () => {
  if (document.querySelector(".events-index")) {
    initMapbox();
  }

  if (document.querySelector(".pages-home")) {
    initAutocomplete();
  }

  if (document.querySelector(".events-index")) {
    initAutocomplete();
  }

  if (document.querySelector(".events-show")) {
    eventsTabs();
    add_participants();
    const btnBack = document.querySelector('.button-back');
      btnBack.addEventListener('click', () => {
        window.history.back();
    });
  }


  initChatroomCable();
  initUpdateNavbarOnScroll();

})

// if !Turbolinks?
//   location.reload
// Turbolinks.dispatch("turbolinks:load")
// = require datetime_picker_input

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';






// import {save_booking} from './booking'
// save_booking()



