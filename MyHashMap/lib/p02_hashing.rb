class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    result = 0
    self.each_with_index do |el, idx|
      result += el.hash * (idx+1)
    end
    result
  end
end

class String
  def hash
    new_self = self.chars
    result = 0
    new_self.each_with_index do |ch, idx|
      result += ch.ord.hash * (idx+1)
    end
    result
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    result = 0
    self.each do |k, v|
      result += k.to_s.hash * v.to_s.hash
    end
    return result
  end
end
