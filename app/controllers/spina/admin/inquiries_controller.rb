module Spina
  module Admin
    class InquiriesController < AdminController
      layout "spina/admin/admin"

      before_action :inquiries_count, only: [:index, :read]

      def show
        @inquiry = Inquiry.find(params[:id])
        add_breadcrumb I18n.t("spina.inquiries.all"), spina.admin_inquiries_path
        add_breadcrumb @inquiry.name
      end

      def index
        add_breadcrumb I18n.t("spina.inquiries.all"), spina.admin_inquiries_path
        @inquiries = Inquiry.newest_first.not_marked_as_read
      end

      def read
        add_breadcrumb I18n.t("spina.inquiries.inbox"), spina.read_admin_inquiries_path
        @inquiries = Inquiry.newest_first.marked_as_read
      end

      def mark_as_read
        @inquiry = Inquiry.find(params[:id])
        @inquiry.update(read: true)
        redirect_to spina.admin_inquiries_path
      end

      def destroy
        @inquiry = Inquiry.find(params[:id])
        @inquiry.destroy
        redirect_to spina.admin_inquiries_path
      end

      private

      def inquiry_params
        params.require(:inquiry).permit(:read, :email, :message, :name, :phone)
      end

      def inquiries_count
        inquiries = Inquiry.all

        @inquiries_read_count = inquiries.marked_as_read.count
        @inquiries_not_read_count = inquiries.not_marked_as_read.count
      end
    end
  end
end
