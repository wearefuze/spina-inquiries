module Spina
  class Client < ActiveRecord::Base
    include ActionView::Helpers::TextHelper

    validates_presence_of :email, :name, :phone, :your_goals, :your_lifestyle, :your_routine, :service
    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

    scope :sorted, -> { order("created_at DESC") }

  end
end