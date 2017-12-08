module ApplicationHelper
  def link_to_show(path, text='Show')
    link_to( (fa_icon 'eye',text: text), path, class: "btn btn-success")
  end
  def link_to_edit(path,text='Edit')
    link_to( (fa_icon 'edit',text: text), path, class: "btn btn-info")
  end
  def link_to_destroy(path, text='Destroy')
    link_to( (fa_icon 'ban', text: text), path, method: :delete,
    data: { confirm: 'Are you sure?'}, class: "btn btn-danger")
  end
end
