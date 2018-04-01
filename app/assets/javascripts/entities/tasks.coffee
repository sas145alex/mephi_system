# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# $('#department-select').on 'change', (e) ->
#   console.log('it was change!')

@activate_tasks_scripts = ->
  handler_master()

handler_master = ->
  selector = $("#department-select")
  selector.change(select_department_handler)

select_department_handler = (e) ->
  value = $("#department-select").val()
  console.log('попытка отослать отдел = ', value)
  # console.log("")
  # $.ajax
  #   url: '/'
  #   type: 'POST'
  #   dataType: 'script'
  #   data: {department_id: value}
  #   error: (jqXHR, textStatus, errorThrown) ->
  #     console.log("AJAX error: #{textStatus}")
  #   success: (data, textStatus, jqXHR) ->
  #     console.log("AJAX успешен!")

  $.ajax({
    type: "POST",
    url: "./build_worker_cards",
    data: { department_id: value },
    error: (jqXHR, textStatus, errorThrown) ->
      console.log("AJAX error: #{textStatus}")
    success: (data, textStatus, jqXHR) ->
      console.log("AJAX успешен!")
  })
