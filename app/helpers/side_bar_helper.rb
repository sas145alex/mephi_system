module SideBarHelper
  def side_bar_items(ru)
    result = []

    result << {
      :name => 'Админ',
      :icon => 'users',
      :children => [
        {:name => 'people',
         :controller => :people,
         :action => :index,
         :icon => 'users',
         :class => 'long'},
        {:name => 'workers',
         :controller => :workers,
         :action => :new,
         :icon => 'user-plus'}
      ]
    }

    result << {
      :name => 'Сущности',
      :icon => 'bug',
      :children => [
        {
          :name => 'Люди',
          :icon => 'bed',
          :controller => :people,
          :action => :index,
          :class => ''
        },
        {
          :name => 'Сотрудники',
          :icon => 'bed',
          :controller => :workers,
          :action => :index,
          :class => ''
        },
        {
          :name => 'Должности',
          :icon => 'bed',
          :controller => :posts,
          :action => :index,
          :class => ''
        },
        {
          :name => 'Отделы',
          :icon => 'bed',
          :controller => :departments,
          :action => :index,
          :class => ''
        },
        {
          :name => 'post_departments',
          :icon => 'bed',
          :controller => :post_departments,
          :action => :index,
          :class => ''
        },
        # {
        #   :name => 'my_tests',
        #   :icon => 'bed',
        #   :controller => :my_tests,
        #   :action => :index,
        #   :class => ''
        # },
        {
          :name => 'Вложения',
          :icon => 'bomb',
          :controller => :documents,
          :action => :index,
          :class => ''
        },
        {
          :name => 'task_workers',
          :icon => 'bomb',
          :controller => :task_workers,
          :action => :index,
          :class => ''
        },
        {
          :name => 'Задания',
          :icon => 'bomb',
          :controller => :tasks,
          :action => :index,
          :class => ''
        },
        {
          :name => 'Распоряжение',
          :icon => 'bomb',
          :controller => :directions,
          :action => :index,
          :class => ''
        },

      ]
    }

    return result
  end
end
