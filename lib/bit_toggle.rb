require "bit_toggle/version"
require "redis"
require "redis-namespace"

module BitToggle
  extend self

  def disable(feature, object)
    $redis.srem(feature_key(feature), object_key(object))
  end

  def disabled?(feature, object)
    !enabled?(feature, object)
  end

  def enable(feature, object)
    $redis.sadd(feature_key(feature), object_key(object))
  end

  def enable_globally(feature)
    enable(feature, :global)
  end

  def enabled?(feature, object)
    has_membership?(feature, object) || has_membership?(feature, :global)
  end

  def feature_key(feature)
    "features:#{feature.to_s}"
  end

  def object_key(object)
    "#{object.class}:#{object.to_s}"
  end

  def remove(feature)
    $redis.del(feature_key(feature))
  end

  private
  def has_membership?(feature, object)
    $redis.sismember(feature_key(feature), object_key(object))
  end
end
