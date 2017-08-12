require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return false if include?(key)
      self[key.hash] << key
      @count += 1
    resize! if num_buckets < @count
      key

  end

  def include?(key)
      return true if self[key.hash].include?(key)
      return false
  end

  def remove(key)
    return nil unless include?(key)
      self[key.hash].delete(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    old_array = @store
    @store = Array.new(num_buckets * 2){ Array.new }
    old_array.each do |el|
      el.each do |x|
          insert(x)
          @count -= 1
      end
    end
    p @store
  end
end
