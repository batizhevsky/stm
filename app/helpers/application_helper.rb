module ApplicationHelper
  include AuthHelper
  require 'set'

  def init_tabs
    @tabs ||= [stories_path, new_story_path]
    @active_tab ||= 0
  end

  def class_if_active(i, a)
    { class: 'active' } if i == a
  end

  def tab_helper
    init_tabs
    activate_current_tab

    form = ""
    @tabs.uniq.each_with_index do |el, i|
      form << content_tag(:li, link_to(t(el), el), class_if_active(i, @active_tab))
    end
    form.html_safe
  end

  def activate_current_tab
    if request
      current_path = url_for(request.path)
      if [root_path, root_with_locale_path].include?(current_path)
        @active = 0
      else
        add_and_active current_path
      end
    end
  end

  def add_to_tabs path
    init_tabs
    @tabs |= [path]
  end

  def set_active_tab path
    init_tabs
    index = @tabs.index(path)
    @active_tab = index if index
  end

  def add_and_active path
    add_to_tabs path
    set_active_tab path
  end

end
