const datepicker = document.querySelector('.datepicker')

const calcDays = () => {
  const pattern = "[0-9]{4}-[0-9]{2}-[0-9]{2}"
  const pattern2 = "to [0-9]{4}-[0-9]{2}-[0-9]{2}"

  const startDate = new Date(datepicker.value.match(pattern)[0]);
  const endDate = new Date(datepicker.value.match(pattern2)[0].substring(3));

  const diff = Math.abs(end_date - start_date)
  const nbOfDays = diff / (1000 * 3600 * 24)

}

const dateEntered = document.addEventListener('input', function (event) {
    console.log(calcDays);
});

export { dateEntered }
