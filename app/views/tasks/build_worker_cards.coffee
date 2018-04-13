$('.workers-result .workers-result-table').remove()
$('.workers-result').append('<%= j render( partial: "build_worker_cards", object: @workers_info, as: :workers_info )  if !@workers_info.empty? %>')
$('.workers-result').find('.link-to-hidden-select').on('click', links_hidden_select_handler)
