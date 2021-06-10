# frozen_string_literal: true

module Spina
  class InquiriesController < Spina::ApplicationController
    layout "default/application"

    before_action :set_page

    invisible_captcha only: :create, on_spam: :spam_redirect

    def index
      @inquiry = Spina::Inquiry.new
    end

    def create
      @inquiry = Spina::Inquiry.new(inquiry_params)

      if @inquiry.save
        Spina::InquiryMailer.inquiry(@inquiry).deliver_now unless @inquiry.invalid? || @inquiry.spam?
        redirect_to thanks_inquiries_path
      else
        render :index
      end
    end

    def thanks; end

  private

    def inquiry_params
      params.require(:inquiry).permit(:email, :message, :name, :phone, :read, :spam)
    end

    def set_page
      @page = Spina::Page.find_or_create_by(name: "contact") do |page|
        page.title = "Contact"
        page.view_template = "simple"
        page.link_url = "/contact"
        page.deletable = false
      end
    end

    def spam_redirect
      redirect_to root_path
    end
  end
end
