# frozen_string_literal: true

module Spina
  class InquiryMailer < ActionMailer::Base
    layout "spina/inquiry"

    def inquiry(inquiry)
      @inquiry = inquiry
      current_account = Spina::Account.first

      mail(
        to: "#{current_account.name} <#{current_account.email}>",
        from: from(current_account.email),
        reply_to: @inquiry.email.to_s,
        subject: "Website Inquiry",
      )
    end

    private

    def from(email)
      from = email.partition("@")
      from[0] = "noreply"

      from.join
    end
  end
end
