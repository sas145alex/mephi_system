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
      :name => 'Scaffolds',
      :icon => 'bug',
      :children => [
        {
          :name => 'people',
          :icon => 'bed',
          :controller => :people,
          :action => :index,
          :class => ''
        },
        {
          :name => 'workers',
          :icon => 'bed',
          :controller => :workers,
          :action => :index,
          :class => ''
        },
        {
          :name => 'posts',
          :icon => 'bed',
          :controller => :posts,
          :action => :index,
          :class => ''
        },
        {
          :name => 'departments',
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
          :name => 'task_workers',
          :icon => 'bomb',
          :controller => :task_workers,
          :action => :index,
          :class => ''
        },
        {
          :name => 'tasks',
          :icon => 'bomb',
          :controller => :tasks,
          :action => :index,
          :class => ''
        },
        {
          :name => 'directions',
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
