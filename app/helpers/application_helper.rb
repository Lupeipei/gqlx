module ApplicationHelper
  def flash_class(level)
    case level
    when :notice
      "alert alert-info"
    when :success
      "alert alert-success"
    when :error
      "alert alert-danger"
    when :warning
      "alert alert-warning"
    else
      "alert alert-primary"
    end
  end
end
