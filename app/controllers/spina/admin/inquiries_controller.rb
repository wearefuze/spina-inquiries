module Spina
  module Admin
    class InquiriesController < AdminController

      authorize_resource class: Inquiry

      layout 'spina/admin/website'

      def show
        @inquiry = Inquiry.find(params[:id])
        add_breadcrumb I18n.t('spina.inquiries.all'), spina.admin_inquiries_path
        add_breadcrumb @inquiry.name
      end

      def inbox_show
        @inquiry = Inquiry.find(params[:id])
        add_breadcrumb I18n.t('spina.inquiries.inbox'), spina.inbox_admin_inquiries_path
        add_breadcrumb @inquiry.name
        render :show
      end

      def index
        add_breadcrumb I18n.t('spina.inquiries.all'), spina.admin_inquiries_path
        @inquiries = Inquiry.sorted
      end

      def inbox
        add_breadcrumb I18n.t('spina.inquiries.inbox'), spina.inbox_admin_inquiries_path
        @inquiries = Inquiry.new_messages.sorted
      end

      def mark_as_read
        @inquiry = Inquiry.find(params[:id])
        @inquiry.update_attribute(:archived, true)
        redirect_to spina.inbox_admin_inquiries_path
      end

      def destroy
        @inquiry = Inquiry.find(params[:id])
        @inquiry.destroy
        redirect_to spina.admin_inquiries_path
      end

      private

      def inquiry_params
        params.require(:inquiry).permit(:archived, :email, :message, :name, :phone)
      end
    end
  end
end