module Spina
  class ClientMailer < ActionMailer::Base
    layout 'spina/email'

    def client(client)
      @client = client
      @current_account = Account.first

      #attachments.inline['logo.png'] = LogoUploader.new.read(@current_account.logo) if @current_account.logo.url

      mail(
        to: "\"#{@current_account.name}\" <#{ @current_account.email }>",
        from: "\"#{@client.name}\" <#{@client.email}>",
        subject: 'Website - New client'
      )
    end

  end
end