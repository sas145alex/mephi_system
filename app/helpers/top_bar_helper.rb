module TopBarHelper
  def top_bar_items(ru)
    result = []
    result << {
      :name => 'people',
      :icon => 'bed',
      :controller => :people,
      :action => :index,
      :class => 'nav-item nav-link'
    }
    result << {
      :name => 'workers',
      :icon => 'bed',
      :controller => :workers,
      :action => :index,
      :class => 'nav-item nav-link'
    }
    # result << {
    #   :name => 'Администрирование',
    #   :icon => 'users',
    #   :children => [
    #   {:name => 'Пользователи',
    #    :controller => :users, :action => :index,
    #    :icon => 'users',
    #    :class => 'long'},
    #   {:name => 'Добавление',
    #    :controller => :users, :action => :new,
    #    :icon => 'user-plus'},
    #   {:name => 'Роли',
    #    :controller => :roles, :action => :index,
    #    :icon => 'align-center',
    #    :class => 'long'},
    # ]}
    return result
  end
end
