# loader_f = ->
#   $('.long, .longpaginate .page a, .longpaginate .next a, .longpaginate .prev a, .longpaginate .last a, .longpaginate .first a').on 'click', ->
#     $('#loader').modal('show')
#     true
#   true


# $('#sidebar').toggleClass('active')



@select2_activation = ->
  window.select2_activation_by_item($(document))

@datepicker_activation = ->
  window.datepicker_activation_by_item($(document))

@datepicker_activation_by_item = (item)->
  # item.find('.datepicker').datepicker({language: 'ru', format: 'dd.mm.yyyy'})
  item.find('.datepicker').datepicker({
    dateFormat: 'dd.mm.yy',
    changeMonth: true,
    changeYear: true,
    nextText: '',
    prevText: '',
    yearRange:'-90:+3'
    })

@select2_activation_by_item = (item)->
  item.find('.select2').select2({theme: "bootstrap"})
  item.find('.ui-datepicker-month').select2({theme: "bootstrap"})
  $('span.select2-container').removeAttr('style')



app_ready_f = ->
  # loader_f()
  window.datepicker_activation()
  window.select2_activation()


$(document).ready app_ready_f
# $(document).on 'page:load', app_ready_f
$(document).on 'turbolinks:load', app_ready_f
