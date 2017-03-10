require 'active_record'

ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => ':memory:'
)

ActiveRecord::Schema.define do
  unless ActiveRecord::Base.connection.data_sources.include? 'numbers'
    create_table :numbers do |table|
      table.column :decimal, :decimal
      table.column :float, :float
      table.column :integer, :integer
    end
  end
end

class Number < ActiveRecord::Base
  serialize :decimal, FormatNumber.with(:number_to_currency, unit: '!')
  serialize :float, FormatNumber.with(:number_to_currency, unit: '!')
  serialize :integer, FormatNumber.with(:number_to_currency, unit: '!')
end
