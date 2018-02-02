prefix_id = "department_post_departments_attributes_" + <%= @timestamp %>
all_selects_except_this = $('.select-post-id:not(#' + prefix_id + '_post_id)')
this_select = $('.select-post-id#' + prefix_id + '_post_id')

ids = []
all_selects_except_this.each( ->
  id = $(this).val()
  if id != ''
    ids.push(+id) )

uniq_post_on_page = true
if ids.includes( +this_select.val() )
  rendered_span = $('span#select2-' + prefix_id + '_post_id-container')
  rendered_span.text('Выбранный отдел уже в списке')
  this_select.val('')
  uniq_post_on_page = false


attrs = (<%= raw @attrs %>)
if uniq_post_on_page
  # если выбранная сущность уникальна для этой страницы
  # то заполним поля формы данными сущности
  values = (<%= raw @attrs.each_with_index.map{|atr,ind| @post.try(@attrs[ind])} %>)
else
  # если выбранная сущность уже есть на странице
  # то очищаем поля формы для неё
  values = (<%= raw @attrs.each_with_index.map{''} %>)

$.each attrs, (index, item) ->
  id_string = '#' + prefix_id + "_post_attributes_" + item
  $(id_string).val(values[index])
