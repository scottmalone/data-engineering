module ApplicationHelper
  def flash_color
    {
      :alert => "red",
      :message => "green",
      :error => "red",
      :notice => "green"
    }
  end
end
