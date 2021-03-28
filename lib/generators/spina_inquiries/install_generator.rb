require "rails/generators/base"
require "rails/generators/migration"
require "rails/generators/active_record"

module SpinaInquiries
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      extend ActiveRecord::Generators::Migration

      source_root File.expand_path("templates", __dir__)

      def self.next_migration_number(path)
        ActiveRecord::Generators::Base.next_migration_number(path)
      end

      def copy_migration_file
        migration_template "create_spina_inquiries_table.rb", Rails.root.join("db/migrate/create_spina_inquiries_table.rb")
      end

      def copy_view_files
        directory 'views', Rails.root.join("app/views/spina/inquiries")
        directory 'mailer', Rails.root.join("app/views/spina/inquiry_mailer")
      end
    end
  end
end
