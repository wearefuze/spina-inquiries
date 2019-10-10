module Spina
  class Inquiry < ActiveRecord::Base
    include ActionView::Helpers::TextHelper

    validates :email,
              presence: {
                message: 'Enter email address'
              },
              format: {
                with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
                message: 'Enter a valid email address (e.g john@doe.com)'
              }
    validates :name,
              presence: {
                message: 'Enter name'
              }
    validates :message,
              presence: {
                message: 'Enter message'
              }

    scope :new_messages, -> { where(archived: false) }
    scope :sorted, -> { order("created_at DESC") }

    def summary
      truncate(message, length: 120)
    end
  end
end
