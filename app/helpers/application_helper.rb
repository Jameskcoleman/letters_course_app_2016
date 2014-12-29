module ApplicationHelper

  def is_active?(link_path)
    "active" if request.fullpath.include? link_path
  end

  def display_datetime(dt)
    dt.in_time_zone('Eastern Time (US & Canada)').strftime("%m/%d/%Y %l:%M%P %Z") # 03/14/2013 9:09pm
  end

end