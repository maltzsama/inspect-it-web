module ApplicationHelper
  def flash_class(level)
    {
      notice: 'alert alert-info',
      success: 'alert alert-success',
      error: 'alert alert-danger',
      alert: 'alert alert-warning'
    }.fetch(level.to_sym)
  end
end
