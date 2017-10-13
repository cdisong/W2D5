class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    self.prev.next = self.next
    self.next.prev = self.prev

    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next.equal?(@tail)
  end

  def get(key)
    # result = search(key)
    # result.val if result
    each { |node| return node.val if node.key == key }

    nil
  end

  def include?(key)
    each { |node| return true if node.key == key }

    false
    # search(key) ? true : false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    new_node.next = @tail
    new_node.prev = @tail.prev
    new_node.prev.next = new_node
    @tail.prev = new_node
  end

  def update(key, val)
    # result = search(key)
    # result.val = val if result

    each { |node| node.val = val if node.key == key }

  end

  def remove(key)
    # result = search(key)
    # result.remove if result

    each { |node| node.remove if node.key == key }

  end

  def each(&prc)
    current_node = @head.next
    until current_node.equal?(@tail)
      prc.call(current_node)
      current_node = current_node.next
    end
  end

  private

  # def search(key)
  #   current_node = @head
  #   until current_node.key == key
  #     current_node = current_node.next
  #     return nil if current_node.equal?(@tail)
  #   end
  #   return current_node
  # end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
