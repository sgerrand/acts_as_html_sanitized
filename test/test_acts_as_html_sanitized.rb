require 'helper'

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
ActiveRecord::Schema.verbose = false

def rails_3?
  defined?(ActiveRecord::VERSION) && ActiveRecord::VERSION::MAJOR >= 3 && ActiveRecord::VERSION::MAJOR < 4
end

def setup_db
  # AR caches columns options like defaults etc. Clear them!
  ActiveRecord::Base.connection.schema_cache.clear!
  ActiveRecord::Schema.define(version: 1) do
    create_table :tests do |t|
      t.column :str, :string
      t.column :txt, :text
      t.column :created_at, :datetime
      t.column :updated_at, :datetime
    end
  end
end

def teardown_db
  ActiveRecord::Base.connection.tables.each do |table|
    ActiveRecord::Base.connection.drop_table(table)
  end
end

class Test < ActiveRecord::Base
  self.table_name = 'tests'

  acts_as_html_sanitized
end

class TestActsAsHtmlSanitized < MiniTest::Unit::TestCase
  def setup
    ActiveRecord::Base.connection.tables.each { |table| ActiveRecord::Base.connection.drop_table(table) }
    setup_db
  end

  def teardown
    teardown_db
  end

  def test_module_has_expected_name
    assert_kind_of Module, ActsAsHtmlSanitized
  end

  def test_string_attrs_are_sanitized
    input = '<em>I am emphasised</em>'
    Test.create(str: input)
    assert_match ' I am emphasised', Test.first.str
  end

  def test_string_attrs_do_not_contain_html
    input = '<em>I am emphasised</em>'
    Test.create(str: input)
    refute_match input, Test.first.str
  end

  def test_string_attrs_are_sanitized
    input =<<HTML
<script type="text/javascript">
alert('ACHIEVEMENT UNLOCKED: XSS attack'):
</script>
HTML
    Test.create(txt: input)
    assert_match "\nalert('ACHIEVEMENT UNLOCKED: XSS attack'):\n\n", Test.first.txt
  end

  def test_string_attrs_do_not_contain_html
    input =<<HTML
<script type="text/javascript">
alert('ACHIEVEMENT UNLOCKED: XSS attack'):
</script>
HTML
    Test.create(txt: input)
    refute_match input, Test.first.txt
  end
end
