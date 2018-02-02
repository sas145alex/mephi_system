cocoon_after_insert = (e, ins_item) ->
  select2_activation_by_item(ins_item) # from main.js

$(document).on 'cocoon:after-insert', (e, ins_item) ->
  cocoon_after_insert(e, ins_item)
