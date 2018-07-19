$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift File.expand_path('../../test', __FILE__)
require 'format_number'
require 'action_view'
require 'config/active_record'

require 'minitest/autorun'
