# see also config/application.rb for xgettext option setup

FastGettext.add_text_domain 'app', :path => 'locale', :type => :po
FastGettext.default_available_locales = ['en', 'ga'] # all you want to allow
FastGettext.default_text_domain = 'app'

# So we use en values if rails i18n ones are missing (e.g. time.formats.short_date)
I18n::Backend::Simple.send(:include, I18n::Backend::Fallbacks)
