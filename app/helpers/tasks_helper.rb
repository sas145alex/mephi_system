module TasksHelper
  def manager_post_name(manager)
    if manager
      Post.human_attribute_name(:name)
    else
      "Управляющая " + Post.human_attribute_name(:name).downcase
    end
  end

  def link_to_show_delegation_to_me(task, text = '')
    link_to( (fa_icon 'tree',text: text), link_to_show_delegation_to_me_task_path(task), class: "btn btn-warning")
  end

  def link_to_show_all_delegation(root_task, text = 'Просмотр распределения')
    link_to( (fa_icon 'tree',text: text), show_all_delegation_task_path(root_task), class: "btn btn-info")
  end
end
