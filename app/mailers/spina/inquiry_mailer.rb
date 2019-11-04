module Spina
  class InquiryMailer < ActionMailer::Base
    layout 'spina/email'

    def inquiry(inquiry)
      @inquiry = inquiry
      @current_account = Account.first

      mail(
        to: "\"#{@current_account.name}\" <#{ @current_account.email }>",
        from: "\"#{@inquiry.name}\" <#{@inquiry.email}>",
        subject: @inquiry.message.truncate(97, separator: ' ')
      )
    end

  end
end
