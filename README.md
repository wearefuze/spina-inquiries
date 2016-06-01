![Spina CMS](http://www.denkwebsite.nl/spinacms.png)

[Visit the website](http://www.spinacms.com)

# Getting Started

This is a Spina CMS plugin example, this project is meant to be cut into a gem and included in your parent Spina project.

To start using this project locally, first clone it and add the following lines to your Gemfile:

```
gem 'spina-inquiries', path: '/path/to/the/project'
```

Make sure you run the migration installer to get started.

```
rails g spina_inquiries:install
```

This should copy the migration file required to create the Spina::Inquiry model.

In your Spina project, make sure your selected theme has 'inquiries' added to plugins

```
self.plugins = ['inquiries']
```

Restart your server and head over to '/admin/pages', you should see your plugin located below the Media Library.

That's all it takes to get the plugin working :)

Now modify away and make your own plugins!

This project rocks and uses MIT-LICENSE.