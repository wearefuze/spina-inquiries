module Spina
  module Admin
    class ClientsController < AdminController

      authorize_resource class: Client

      layout 'spina/admin/website'

      def show
        @client = Client.find(params[:id])
        add_breadcrumb I18n.t('spina.clients.all'), spina.admin_clients_path
        add_breadcrumb @client.name
      end

      def index
        add_breadcrumb I18n.t('spina.clients.all'), spina.admin_clients_path
        @clients = Client.sorted
      end

      def destroy
        @client = Client.find(params[:id])
        @client.destroy
        redirect_to spina.admin_clients_path
      end

      private

      def client_params
        params.require(:client).permit(:email, :name, :phone, :service, :your_goals, :your_lifestyle, :your_routine)
      end
    end
  end
end