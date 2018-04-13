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
    $('.workers-result:not([class*="show-only-managers"])').addClass('show-only-managers')
  else
    $('.workers-result[class*="show-only-managers"]').removeClass('show-only-managers')

@links_hidden_select_handler = (e) ->
  value = $(this).attr('data-worker-id')
  hidden_select = $(this).parents('.task-worker-wrapper').find('.receivers .select-worker').first()
  target_for_data_attr = $(this).parents('.task-worker-wrapper').find('.workers-result')
  handle_links_colors_and_manager_checkbox($(this), hidden_select)
  handle_hidden_select(value, hidden_select, target_for_data_attr)

@handle_links_colors_and_manager_checkbox = (item, selector) ->
  # item - элемент ссылки
  # selector - выпадающий скрытый список с id

  val = item.attr('data-worker-id')
  all_links = item.parents('.workers-result-table').find('.link-to-hidden-select')
  manager_checkbox = item.parents('.task-wrapper').find('.checkbox-show-manager-container').find('input').first()
  # все линки делаем зелеными
  all_links.each (i, link) ->
    $(link).attr('class', 'btn btn-success link-to-hidden-select')
    $(link).find('.fa').first().attr('class','fa fa-check default-icon')
    $(link).removeAttr('data-show-only-me')
  if val == selector.val()
    item.parents('tr').removeAttr('data-show-only-me')
    manager_checkbox.removeAttr('disabled')
  else
    # если входное значение и значение в списке разные
    # только этот линк делаем красным, остальные зеленые
    item.attr('class','btn btn-danger link-to-hidden-select')
    item.find('.fa').first().attr('class','fa fa-times default-icon')
    # добавляем дата-атрибут, при помощи css скрываем все остальные
    item.parents('tr').attr('data-show-only-me', 'true')
    manager_checkbox.attr('disabled','disabled')



@handle_hidden_select = (val, selector, container_for_data_attr) ->
  # если удаляем - то убираем дата-атрибут и очищаем список
  # если добавляем - то добавляем дата-атрибут и вносим занчение в список
  # val = входное значение
  # selector = скрытый список для которого сравниваем val
  # container_for_data_attr = контейнер
  #   для дата-атрибута (при помощи css скрываем все остальные записи)
  if val != selector.val()
    selector.val(val)
    container_for_data_attr.attr('data-select-worker','true')
  else
    selector.val(0)
    container_for_data_attr.attr('data-select-worker','false')

activate_remove_document_links = (e, inserted_item) ->
  $(inserted_item).find('.remove-document').click( ->
    $(this).parent('li').remove() )

remove_document_handler = () ->
  $(this).parent('li').remove()
