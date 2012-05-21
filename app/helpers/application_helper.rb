module ApplicationHelper

  def display_create_report_form?
    action_name.eql?('index')
  end
end
