
require 'pry'

class Cache
  attr_reader  :current_cache

  def initialize
    @current_cache = {}
  end

  def put(key, value, date)
    if !current_cache[key]
      current_cache[key] = {}
    end
    current_cache[key][date] = value
    current_cache[key]['last'] = date
  end

  def get(key, date = nil)
    if current_cache[key]
      if date.nil?
        last_date = current_cache[key]['last']
        puts current_cache[key][last_date]
      else
        puts current_cache[key][date]
      end
    else
      puts 'null'
    end
  end

end


cache_1 = Cache.new
cache_1.put("fish", "trout", "12/3/2012")
cache_1.put("fish", "salmon", "3/5/1998")
cache_1.put("fish", "tuna", "3/9/2001")
cache_1.get("fish")
cache_1.get("fish", "12/3/2012")
cache_1.get("fish", "3/5/1998")
cache_1.get("fish", '2/3/2009')

cache_1.get('goat')
