# frozen_string_literal: true

module Spina
  module Admin
    class InquiriesController < AdminController
      layout "spina/admin/admin"

      admin_section :inquiries

      before_action :set_inquiry, only: %i[mark_as_read destroy]
      before_action :set_breadcrumb, only: %i[index read]

      def index
        @inquiries = Spina::Inquiry.unread.order(created_at: :DESC)
      end

      def read
        @inquiries = Spina::Inquiry.read.order(created_at: :DESC)

        render :index
      end

      def destroy
        @inquiry.destroy
        redirect_to spina.admin_inquiries_path
      end

      def mark_as_read
        @inquiry.update(read: true)
        redirect_to spina.admin_inquiries_path
      end

    private

      def set_inquiry
        @inquiry = Spina::Inquiry.find(params[:id])
      end

      def set_breadcrumb
        add_breadcrumb "Inquiries", spina.admin_inquiries_path
      end
    end
  end
end
