module TopBarHelper
  def top_bar_items(ru)
    result = []
    result << {
      :name => 'root',
      # :icon => 'bed',
      :controller => :welcome,
      :action => :welcome,
      :class => 'nav-item nav-link'
    }
    result << {
      :name => 'root',
      :icon => 'bed',
      :controller => :welcome,
      :action => :welcome,
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
