# frozen_string_literal: true

module Spina
  class InquiryMailer < ActionMailer::Base
    layout "spina/inquiry"

    def inquiry(inquiry)
      @inquiry = inquiry
      @current_account = Account.first

      mail(
        to: "\"#{@current_account.name}\" <#{@current_account.email}>",
        from: "no-reply@#{@current_account.name.parameterize}.com",
        reply_to: @inquiry.email.to_s,
        subject: "You've recieved a message from your website",
      )
    end
  end
end
