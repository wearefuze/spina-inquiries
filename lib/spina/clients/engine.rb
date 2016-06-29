module Spina
  module Clients
    class Engine < ::Rails::Engine
      initializer 'spina.plugin.register.spina_clients', before: :load_config_initializers do
        ::Spina::Plugin.register do |plugin|
          plugin.name = 'Clients'
          plugin.namespace = 'clients'
        end
      end
    end
  end
end
