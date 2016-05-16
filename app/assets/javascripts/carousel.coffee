$(document).on 'page:load', ->
  $('.js__arrow').on "click", ->
    (new_el = $('.js__slide-' + $( this ).data('number'))).css('z-index', 99)
    (elem = $(this).parents('.slide-wrapper')).fadeOut 'slow', ->
      elem.css('z-index', 1)
      elem.css('display', 'block')
      new_el.css('z-index', 100)

