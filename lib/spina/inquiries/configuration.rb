module Spina
    module Inquiries
      include ActiveSupport::Configurable
  
      config_accessor :title, :controller, :description, :spina_icon, :plugin_type
  
      self.title = 'Inquiries'
      self.controller = 'inquiries'
      self.description = 'Manage inquiries that come in through the website'
      self.spina_icon = 'pencil-outline'
  
      self.plugin_type = 'website_resource'
    end
  end