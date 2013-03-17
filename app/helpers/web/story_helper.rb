module Web::StoryHelper
  def story_assigned
    @story.user_name || "нет"
  end

  def bstrp_btn name
    case name.to_s
    when "accept" then "btn-success"
    when "reject" then "btn-danger"
    when "finish" then "btn-info"
    when "deliver" then "btn-warning"
    end
  end
end
