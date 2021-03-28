require "spina"

module Spina
  module Inquiries
    class Engine < ::Rails::Engine
      isolate_namespace Spina::Inquiries

      config.before_initialize do
        ::Spina::Plugin.register do |plugin|
          plugin.name = "Inquiries"
          plugin.namespace = "inquiries"
        end
      end

      config.to_prepare do
        Rails.application.config.assets.precompile += %w[spina/inquiries/admin/inquiries.css]
      end
    end
  end
end
