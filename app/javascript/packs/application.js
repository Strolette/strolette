import "bootstrap";

// for complete automaticaly address form
import { initAutocomplete } from '../plugins/init_autocomplete';

initAutocomplete();

import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

// for date selection

import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css"; // Note this is important!

const bdate = document.getElementById('bdate');

flatpickr(".datepicker", {
  mode: "range",
  dateFormat: "Y-m-j",
  minDate: bdate.dataset.startDate,
  maxDate: bdate.dataset.endDate
})


// CalDays on booking

import { dateEntered } from '../components/datepicker';

dateEntered();
