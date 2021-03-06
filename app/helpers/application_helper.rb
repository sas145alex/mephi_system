module ApplicationHelper
  def link_to_show(path, text=t('views.general.links.show') )
    link_to( (fa_icon 'eye',text: text), path, class: "btn btn-success")
  end

  def link_to_edit(path,text=t('views.general.links.edit') )
    link_to( (fa_icon 'edit',text: text), path, class: "btn btn-info")
  end

  def link_to_destroy(path, text=t('views.general.links.destroy') )
    link_to( (fa_icon 'ban', text: text), path, method: :delete,
    data: { confirm: t('views.general.questions.sure') }, class: "btn btn-danger")
  end

  def lnil(data)
    data.nil? ? 'не указано' : l(data)
  end

  def breadcrumb_tag(&block)
    render 'application/breadcrumb', block: capture(&block)
  end


  def link_to_download_file(object_with_file)
    render partial: 'link_to_download_file',
      object: object_with_file, as: 'document'
  end

  def t_boolean(val)
    if val
      t('values.boolean.true')
    else
      t('values.boolean.false')
    end
  end
end
