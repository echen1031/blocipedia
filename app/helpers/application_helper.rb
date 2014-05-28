module ApplicationHelper

  BOOTSTRAP_FLASH_MSG = {
    success: 'alert-success',
    error: 'alert-error',
    alert: 'alert-block',
    notice: 'alert-info'
  }

  def boostrap_class_for(flash_type)
    BOOTSTRAP_FLASH_MSG.fetch(flash_type, flash_type.to_s)
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      contact(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
        contact content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
        contact message
      end)
    end
    nil
  end
end
