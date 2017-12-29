module SideBarHelper
  def side_bar_items(ru)
    result = []

    result << {
      :name => 'Люди',
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
      :icon => 'plus',
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
        }
      ]
    }

    return result
  end
end
