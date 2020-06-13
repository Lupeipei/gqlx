import $ from 'jquery';

$(document).on('content:loaded', function(event) {
  $(event.target).find('.array-add-item').each(function() {
    $(this).on('click', e => {
      e.preventDefault()
      const currentLineField = this.parentElement.parentElement
      const $cloneField = $(currentLineField).clone()
      $cloneField.find('input').val("")
      $cloneField.find('button').removeAttr('disabled')
      $(currentLineField).after($cloneField)
    })
  })

  $(event.target).on('click', '.array-remove-item', e => {
    e.preventDefault()
    e.currentTarget.parentElement.parentElement.remove()
  })
})
