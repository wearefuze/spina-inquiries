# Getting Started

To start using this project locally, add the following lines to your Gemfile:

```
gem 'spina-clients', github: 'DigitalReflow/spina-clients'
```

Make sure you run the migration installer to get started.

```
rails g spina_clients:install
```

This should copy the migration file required to create the Spina::Client model.

Restart your server and head over to '/admin/clients', you should see your plugin located below the in the side menu.

That's all it takes to get the plugin working :)

You will need to add the form to the consumer view and associated controller

```
module Spina
  class ClientsController < Spina::ApplicationController

    def create
      @client = Client.new(client_params)

      if @client.save
        ClientMailer.client(@client).deliver
      else
        render :failed
      end
    end

    private

    def client_params
      params.require(:client).permit(:archived, :email, :message, :name, :phone)
    end
  end
end
```

```
= simple_form_for Spina::Client.new, remote: true do |f|
  = f.input :name
  = f.input :email
  = f.input :phone
  = f.input :message
  = f.submit
```

This project rocks and uses MIT-LICENSE.