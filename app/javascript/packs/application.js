import "bootstrap";

// for complete automaticaly address form
import { initAutocomplete } from '../plugins/init_autocomplete';

initAutocomplete();

import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

// for date selection

import "../plugins/flatpickr";
import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css"; // Note this is important!

const bdate = document.getElementById('bdate');

flatpickr(".datepicker", {
  mode: "range",
  dateFormat: "Y-m-d",
  minDate: bdate.dataset.startDate,
  maxDate: bdate.dataset.endDate
})
