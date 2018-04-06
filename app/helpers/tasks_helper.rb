module TasksHelper
  def manager_post_name(manager)
    if manager
      Post.human_attribute_name(:name)
    else
      "Управляющая " + Post.human_attribute_name(:name).downcase
    end
  end
end
