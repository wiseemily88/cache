
require 'pry'
class Cache
  attr_reader  :current_cache

  def initialize
    @current_cache = {}
  end

  def put(key, value)
    if current_cache[key]
      current_cache[key] << value
    else
      current_cache[key] = [value]
    end
  end

  def get(key, version = 0)
    if current_cache[key] && current_cache[key].length > version
      puts current_cache[key][version - 1]
    else
      puts 'null'
    end
  end

end


cache_1 = Cache.new
cache_1.put("fish", "trout")
cache_1.put("fish", "salmon")
cache_1.put("fish", "tuna")
cache_1.get("fish")
cache_1.get("fish", 1)
cache_1.get("fish", 2)
cache_1.get("fish", 3)

cache_1.get('goat')
