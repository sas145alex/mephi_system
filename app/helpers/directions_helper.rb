module DirectionsHelper
  def link_to_my_tasks(direction, text = 'Мои задания')
    link_to( (fa_icon 'tasks',text: text), tasks_path(direction: direction), class: "btn btn-warning")
  end
end
