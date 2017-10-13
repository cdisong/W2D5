require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key)
      self[key] << key
      @count += 1
      resize! if count >= num_buckets
    end
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    @count -= 1 if self[key].delete(key)

  end

  private

  def [](key)
    @store[key.hash % num_buckets]

    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    values = @store.flatten
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    values.each do |val|
      insert(val)
    end
  end
end
