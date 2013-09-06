$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bit_toggle'

client = Redis.new
$redis = Redis::Namespace.new(:bit_toggle, redis: client)
