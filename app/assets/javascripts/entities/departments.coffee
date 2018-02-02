# console.log('это сообщение из общих скриптов departments')

select_post_change_hahdler = (container) ->
  # console.log(selector)
  all_select = container.find($('select[id$=post_id]'))
  all_select.off('change')
  all_select.on 'change', (e) ->
    # console.log( $(this).find('option:selected').val() )
    selected_post_id = $(this).find('option:selected').val()
    attr_name = $(this).attr('name').match(/attributes]\[(\d+)\]/)
    timestamp = attr_name[attr_name.length - 1]
    # console.log('attr_name = ', attr_name)
    # console.log("timestamp = ", timestamp)
    # console.log("selected_post_id = ", selected_post_id)
    # console.log("попытка послать ajax")

    if selected_post_id
      # отсылаем в контроллер id выбранной должности и timestamp
      # console.log('ПОСТ ВЫБРАН!')
      $.ajax
        url: '/fill_existing_post_form'
        type: 'POST'
        dataType: 'script'
        data: { selected_post_id: selected_post_id, timestamp: timestamp }
        error: (jqXHR, textStatus, errorThrown) ->
          console.log("ajax on departments#fill_existing_post_form failled! error: #{textStatus}")
        success: (data, textStatus, jqXHR) ->
          console.log("ajax on departments#fill_existing_post_form success!")
    else
      # очищаем поля, если выбрано значение должности id = 0
      $(this).parents('.nested-fields').find('input').val('')


@ajax_for_filling_nested_post_form = ->
  nested_posts_container = $('#wrapper-for-nested-posts')
  select_post_change_hahdler(nested_posts_container)
  # console.log(nested_posts_container)
  nested_posts_container.on 'cocoon:after-insert', (e, ins_item)->
    # cocoonCallback()
    select_post_change_hahdler(ins_item)


departments_ready_f = ->
  window.ajax_for_filling_nested_post_form()

# $(document).ready departments_ready_f
$(document).on 'turbolinks:load', departments_ready_f
