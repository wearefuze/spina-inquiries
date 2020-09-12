module Spina
  class InquiriesController < Spina::ApplicationController
    def index
      @inquiry = Spina::Inquiry.new
    end

    def create
      @inquiry = Spina::Inquiry.new(inquiry_params)

      if @inquiry.save
        Spina::InquiryMailer.inquiry(@inquiry).deliver_now
        redirect_to spina.inquiries_url, notice: "Thank you for your message!"
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
