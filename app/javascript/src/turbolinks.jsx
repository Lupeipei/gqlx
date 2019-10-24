import $ from 'jquery';

import Turbolinks from 'turbolinks';

Turbolinks.start();

$(document).on({
  'turbolinks:load'(event) {
    const $element = $(event.target);
    $element.trigger('content:loading');
    $element.trigger('content:loaded');
  }
});
