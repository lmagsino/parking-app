$(document).ready(function () {

  $('.js-manual-time').prop('checked', true)
  $('.js-manual-time select').attr('disabled', true)

  $('.js-current-time').on('click', function (e) {
    if ($(this).is(':checked')) {
      $('.js-manual-time select').attr('disabled', true)
    } else {
      $('.js-manual-time select').attr('disabled', false)
    }
  });

  $('.js-btn-park').on('click', function (e) {

    let entryPoint = $('.js-entry-point').val();
    let plateNumber = $('.js-plate-number').val();
    let vehicleType = $('.js-vehicle-type').val();
    let dateTime = getTime();

    $.ajax({
      url: 'park',
      type: 'post',
      data: { 'entry_point': entryPoint, 'vehicle_type': vehicleType, 'plate_number': plateNumber, 'transaction_time': dateTime },
      dataType: 'json',
      success: function (response) {
        console.log(response)
        alert('You have successfully reserved a slot: ' + response.location)
      },
      error: function (response) {
        alert('Sorry, No available parking slot for you')
      }
    });
  });

  $('.js-btn-unpark').on('click', function (e) {

    let plateNumber = $('.js-plate-number').val();
    let dateTime = getTime();

    $.ajax({
      url: 'unpark',
      type: 'post',
      data: { 'plate_number': plateNumber, 'transaction_time': dateTime },
      dataType: 'json',
      success: function (response) {
        alert('Total amount: ' + response.amount)
      },
      error: function (response) {
        alert('Error retrieving the total amount. Please try again.')
      }
    });
  });

  function getTime() {
    var datetime;
    if ($(this).is(':checked')) {
      year = $('.js-manual-time #time__1i').val()
      month = $('.js-manual-time #time__2i').val()
      date = $('.js-manual-time #time__3i').val()
      hour = $('.js-manual-time #time__4i').val()
      minute = $('.js-manual-time #time__5i').val()
      datetime = new Date(year, month - 1, date, hour, minute, 0);
    } else {
      datetime = new Date($.now());
    }

    return datetime.toLocaleString();
  }

});
