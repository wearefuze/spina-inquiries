# frozen_string_literal: true

module Spina
  module Admin
    class InquiriesController < AdminController
      layout "spina/admin/admin"

      before_action :set_inquiry, only: [:show, :mark_as_read, :destroy]
      before_action :set_breadcrumb, only: [:index, :show, :read, :spam]

      def show
        add_breadcrumb @inquiry.name
      end

      def index
        @inquiries = Spina::Inquiry.valid
                                   .unread
                                   .order(created_at: :DESC)
      end

      def read
        @inquiries = Spina::Inquiry.valid
                                   .read
                                   .order(created_at: :DESC)

        render :index
      end

      def spam
        @inquiries = Spina::Inquiry.spam
                                   .order(created_at: :DESC)

        render :index
      end

      def destroy
        @inquiry.destroy
        redirect_to spina.admin_inquiries_path
      end

      def destroy_spam
        @inquiries = Spina::Inquiry.spam

        @inquiries.destroy_all
        redirect_to spina.admin_inquiries_path, notice: "Emptied spam"
      end

      def mark_as_read
        @inquiry.update(read: true)
        redirect_to spina.admin_inquiries_path
      end

      def mark_as_spam
        @inquiry.update(spam: true)
        redirect_to spina.admin_inquiries_path
      end

    private

      def inquiry_params
        params.require(:inquiry).permit(:email, :message, :name, :phone, :email, :spam)
      end

      def set_inquiry
        @inquiry = Spina::Inquiry.find(params[:id])
      end

      def set_breadcrumb
        add_breadcrumb 'Inquiries', spina.admin_inquiries_path
      end
    end
  end
end
