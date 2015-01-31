module ProjectsHelper

  def completion_box element
    check_box_tag :done, 1, element.done, :class => 'project-completion', :id => "#{element.class.name}+#{element.id}_state", :'data-element_class' => element.class.name.downcase, :'data-element_id' => element.id, :'data-element_endpoint' => send("#{element.class.name.downcase}_path", element, :format => :js)
  end
end
