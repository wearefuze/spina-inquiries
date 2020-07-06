module Spina
  class InquiryMailer < ActionMailer::Base
    layout 'spina/email'

    def inquiry(inquiry)
      @inquiry = inquiry
      @current_account = Account.first

      mail(
        to: "\"#{@current_account.name}\" <#{ @current_account.email }>",
        from: "no-reply@#{@current_account.name.parameterize}.com",
        reply_to: "#{@inquiry.email}",
        subject: "Website enquiry"
      )
    end

  end
end
