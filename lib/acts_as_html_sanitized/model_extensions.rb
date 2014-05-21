require 'active_record'
require 'sanitize'

module ActsAsHtmlSanitized
  module ModelExtensions
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def acts_as_html_sanitized
        before_validation do |record|
          for column in record.class.content_columns
            if column.type == :string || column.type == :text
              unless record[column.name].nil?
                record[column.name] = Sanitize.clean(record[column.name])
              end
            end
          end
        end
      end
    end
  end
end
