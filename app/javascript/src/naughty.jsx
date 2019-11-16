import $ from 'jquery';
$(document).on('content:loaded', (event) => {
  $(event.target).find('#naughty').on('click', e => {
    $('#showBackend').removeClass('d-none')
  })
})
