class LRUCache
  def initialize(prc, capacity=8)
    @capacity = capacity
    @prc = prc
    @map = {}
    @store = LinkedList.new
  end

  def get(key)
    if @map[key]
      link = @map[key]
      update_link!(link)
      link.val
    else
      insert!(key)
    end
  end

  private

  def eject!
    lru_link = @store.last
    lru_link.next.prev = @store.last
    lru_link.prev.next = lru_link.next
    @map.delete(lru_link.key)
  end

  def insert!(key)
    val = @prc.call(key)
    link = @store.insert_at_head(key, val)
    @map.key = link
    eject! if @map.count > @capacity
    val
  end

  def update_link!(link)
    old_prev = link.prev
    old_next = link.next

    old_next.prev = old_prev
    old_prev.next = old_next

    link.next = @store.head
    link.prev =  @store.first

    link.next.prev = link
    link.prev.next = link
  end

end
