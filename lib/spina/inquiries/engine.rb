module Spina
  module Inquiries
    class Engine < ::Rails::Engine
      initializer 'spina.plugin.register.spina_inquiries', before: :load_config_initializers do
        ::Spina::Plugin.register do |plugin|
          plugin.name = 'Inquiries'
          plugin.namespace = 'inquiries'
        end
      end
    end
  end
end
