import $ from 'jquery';

$(document).on('content:loaded', function(event) {
  $(event.target).find('.array-add-item').each(function() {
    $(this).on('click', e => {
      e.preventDefault()
      const inputList = this.parentElement.querySelectorAll('.input-group')
      const lastLineField = inputList[inputList.length - 1]
      const $cloneField = $(lastLineField).clone()
      $cloneField.find('input').val("")
      $cloneField.find('button').removeAttr('disabled')
      $(lastLineField).after($cloneField)
    })
  })

  $(event.target).on('click', '.array-remove-item', e => {
    e.preventDefault()
    e.currentTarget.parentElement.parentElement.remove()
  })
})
