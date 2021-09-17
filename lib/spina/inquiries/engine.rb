require "spina"
require "pg"
require "spam_email"
require "filters_spam"
require "invisible_captcha"

module Spina
  module Inquiries
    class Engine < ::Rails::Engine
      isolate_namespace Spina::Inquiries

      config.before_initialize do
        ::Spina::Plugin.register do |plugin|
          plugin.name = "Inquiries"
          plugin.namespace = "inquiries"
        end

        ::Spina.config.tailwind_purge_content.concat Spina::Inquiries::Engine.root.glob("app/views/**/*.*")
      end
    end
  end
end
