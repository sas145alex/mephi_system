togglef = ->
  toggle_link = $(".with-subitems")
  toggle_link.off('click')
  toggle_link.on 'click', ->
    $(this).parent().children(".subitems").toggle(300)
    false
  false

activate_handler_sidebar_toggle = ->
  toggle_btn = $('#sidebar_toggler')
  toggle_btn.off('click')
  toggle_btn.on 'click', ->
    id = toggle_btn.attr('href')
    $(id).toggleClass('active-sidebar')
    false
  false

app_ready_f = ->
  activate_handler_sidebar_toggle()
  togglef()

$(document).ready app_ready_f
$(document).on 'turbolinks:load', app_ready_f
