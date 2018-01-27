# togglef = ->
#   toggle_link = $(".with-subitems")
#   toggle_link.off('click')
#   toggle_link.on 'click', ->
#     $(this).parent().children(".subitems").toggle(300)
#     false
#   false

activate_handler_sidebar_toggle = ->
  toggle_btn = $('#sidebar-toggler')
  toggle_btn.off('click')
  toggle_btn.on 'click', ->
    $('#sidebar').toggleClass('d-none d-sm-block d-block d-sm-none')
    $('main').toggleClass('offset-lg-2 offset-sm-3 col-sm-12 col-lg-12')
    false
  false

app_ready_f = ->
  activate_handler_sidebar_toggle()
  # togglef()

$(document).ready app_ready_f
$(document).on 'turbolinks:load', app_ready_f
