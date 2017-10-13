class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return "this is an empty array".hash if self.empty?
    acc = self.first.hash

    self[1..-1].each_with_index do |el, idx|
      if idx.even?
        acc -= el.hash
      else
        acc /= el.hash
      end
    end

    acc.hash
  end
end

class String
  def hash
    acc = self[0].ord
    self[1..-1].each_char.with_index do |ch, idx|
      if idx.even?
        acc -= ch.ord
      else
        acc = acc.fdiv(ch.ord)
      end
    end
    acc.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.to_a.sort.hash
  end
  0
end
