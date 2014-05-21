require 'active_record'
require 'acts_as_html_sanitized/model_extensions'

module ActsAsHtmlSanitized
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.send(:include, ActsAsHtmlSanitized::ModelExtensions)
  end
end
