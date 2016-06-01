module Spina
  class Inquiry < ActiveRecord::Base
    include ActionView::Helpers::TextHelper

    validates_presence_of :email, :message, :name
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

    scope :new_messages, -> { where(archived: false) }
    scope :sorted, -> { order("created_at DESC") }

    def summary
      truncate(message, length: 120)
    end
  end
end