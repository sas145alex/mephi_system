# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# $('#department-select').on 'change', (e) ->
#   console.log('it was change!')

@activate_tasks_scripts = ->
  handler_master()

handler_master = ->
  selector = $("#department-select")
  selector.val('')
  selector.change(select_department_handler)

  selector = $('#checkbox-manager')
  selector.prop('checked', false)
  selector.change(show_only_managers_handler)

  selector = $('#documents')
  selector.on('cocoon:after-insert', activate_remove_document_links)
  selector.find('.remove-document').click(remove_document_handler)

select_department_handler = (e) ->
  value = $("#department-select").val()
  console.log('попытка отослать отдел = ', value)
  $.ajax({
    type: "POST",
    url: "./build_worker_cards",
    data: { department_id: value },
    error: (jqXHR, textStatus, errorThrown) ->
      console.log("AJAX error: #{textStatus}")
    success: (data, textStatus, jqXHR) ->
      console.log("AJAX успешен!")
  })

show_only_managers_handler = (e) ->
  value = $('#checkbox-manager').prop('checked')
  if value
    $('#workers-result:not([class*="show-only-managers"])').addClass('show-only-managers')
  else
    $('#workers-result[class*="show-only-managers"]').removeClass('show-only-managers')

@links_hidden_select_handler = (e) ->
  value = $(this).attr('data-worker-id')
  already_selected_values = $('#worker-ids').val()
  searched_indx = -1
  $.each(already_selected_values, (i,item) ->
    if item == value
      searched_indx = i)
  if searched_indx >= 0
    already_selected_values.splice(searched_indx,1)
  else
    already_selected_values.push(value)
  $(this).toggleClass('btn-success btn-danger')
  $(this).find('i').toggleClass('fa-times fa-check')
  new_values = already_selected_values
  $('#worker-ids').val(new_values)

activate_remove_document_links = (e, inserted_item) ->
  $(inserted_item).find('.remove-document').click( ->
    $(this).parent('li').remove() )

remove_document_handler = () ->
  $(this).parent('li').remove() 
