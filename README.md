[![Dependabot Status](https://api.dependabot.com/badges/status?host=github&repo=dankmitchell/spina-inquiries)](https://dependabot.com)

# Spina Inquiries

Easily setup inquiries in your Spina app 📨

### Install

```ruby
gem 'spina-inquiries', github: 'dankmitchell/spina-inquiries'
```

### Generator

```ruby
rails g spina_inquiries:install
```

Restart your server and head over to [/admin/inquiries](http://localhost:3000/admin/inquiries).

### Frontend

#### Controller

```ruby
module Spina
  class InquiriesController < Spina::ApplicationController

    def index
      @inquiry = Spina::Inquiry.new
    end

    def create
      @inquiry = Spina::Inquiry.new(inquiry_params)

      if @inquiry.save
        Spina::InquiryMailer.inquiry(@inquiry).deliver_now
        redirect_to spina.inquiries_url
        flash[:notice] = 'Thank you for your message.'
      else
        render :index
      end
    end

    private

    def inquiry_params
      params.require(:inquiry).permit(:read, :email, :message, :name, :phone)
    end
  end
end
```

#### View

`spina/inquiries/index`

```
<%= form_for @inquiry do |f| %>
  <%= f.text_field :name %>
  <%= f.text_field :email %>
  <%= f.phone_field :phone %>
  <%= f.text_area :message %>
  <%= f.submit "Submit" %>
<% end %>
```

### Routes

```ruby
Spina::Engine.routes.draw do
  resources :inquiries
end
```
