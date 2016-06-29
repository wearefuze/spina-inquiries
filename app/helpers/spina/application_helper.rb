module Spina
  module ApplicationHelper
  def foundation_class_for flash_type
    case flash_type
      when "success"
        "success"
      when "error"
        "alert"
      when "alert"
        "warning"
      when "notice"
        "notice"
      else
        flash_type.to_s
    end
  end
end
end