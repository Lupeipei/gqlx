import $ from 'jquery';

const initArrayInput = function(root) {
  $(root).on('click', '.array-add-item', e => {
    e.preventDefault()
    const currentLineField = e.currentTarget.parentElement.parentElement
    const $cloneField = $(currentLineField).clone()
    $cloneField.find('input').val("")
    $cloneField.find('button').removeAttr('disabled')
    $(currentLineField).after($cloneField)
  })

  $(root).on('click', '.array-remove-item', e => {
    e.preventDefault()
    e.currentTarget.parentElement.parentElement.remove()
  })
}

$(document).on('content:loaded', function(event) {
  initArrayInput(event.target)
})
