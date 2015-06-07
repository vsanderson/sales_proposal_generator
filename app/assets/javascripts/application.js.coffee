#= require jquery
#= require jquery_ujs

$('document').ready (event) ->
  $(@).on 'click', '.add-fields', ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
#    event.preventDefault()

  $('select[name$="[product_id]"]').each (el)->
    price_field = $(@).parents('.row').find('p.product-price')
    $.get("/products/#{$(@).val()}.json", (data) -> price_field.html('$' + parseFloat(data.price).toPrecision(4)))

  $(@).on 'change', 'select[name$="[product_id]"]', (e)->
    price_field = $(@).parents('.row').find('p.product-price')
    $.get("/products/#{$(@).val()}.json", (data) -> price_field.html('$' + parseFloat(data.price).toPrecision(4)))
