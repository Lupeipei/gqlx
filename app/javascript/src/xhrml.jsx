import _ from 'lodash'
import $ from 'jquery'

$(function() {
  const handleResponse = function($element, data) {
    if (!$element.data('xhrml')) { return }
    $element.removeData('xhrml')
    $element.data('type', 'xhrml')

    const target = $element.data('target')
    let $target = null
    if (_.startsWith(target, '#')) {
      $target = $(target)
    } else {
      $target = $element.closest(target)
    }

    if ($element.data('replace')) {
      const $data = $(data)
      $target.replaceWith($data)
      $data.trigger('xhrml:success')
      $data.trigger('content:loading')
      $data.trigger('content:loaded')
    } else {
      $target.html(data)
      $target.trigger('xhrml:success')
      $target.trigger('content:loading')
      $target.trigger('content:loaded')
    }
  }

  $(document).on({
    'ajax:before': function(event) {
      const $element = $(event.target)
      if ($element.data('type') !== 'xhrml') { return }

      $element.data('type', 'html')
      $element.data('xhrml', true)
    },
    'ajax:success': function(event, data) {
      const $element = $(event.target)
      handleResponse($element, data)
    },
    'ajax:error': function(event, xhr) {
      if (xhr.status == 401) {
        window.location = "/users/sign_in"
      } else {
        const $element = $(event.target)
        handleResponse($element, xhr.responseText)
      }
    }
  })
})


$(document).on('ajax:aborted:file', function(event) {
  const $form = $(event.target)
  $(event.target).ajaxSubmit({
    beforeSerialize($f) {
      $f.trigger('ajax:before')
    },
    success(data) {
      $form.trigger('ajax:success', data)
    },
    error(xhr) {
      $form.trigger('ajax:error', xhr)
    }
  })

  return false
})
