class Heap
  def initialize(initial_values=[])
    @store = []
    initial_values.each { |val| insert(val) }
  end

  def pop
    swap(0, -1)
    val = @store.pop
    heapify_down!
    val
  end

  def insert(val)
    @store << val
    heapify_up!
  end

  def peek
    @store.first
  end

  private

  def parent(child_idx)
    (child_idx - 1) / 2
  end

  def children(parent_idx)
    [parent_idx * 2 + 1, parent_idx * 2 + 2].select { |i| i < @store.length }
  end

  def heapify_down!
    i = 0
    loop do
      smallest_child = children(i).min { |a, b| @store[a], @store[b] }
      break unless smallest_child
      if @store[i] > @store[smallest_child]
        swap(i, smallest_child)
        i = smallest_child
      else
        break
      end
    end
  end

  def heapify_up!
    i = @store.length - 1
    while i > 0
      parent_idx = parent(i)
      if @store[i] = < @store[parent_idx]
        swap(i, parent_idx)
        i = par_idx
      else
        break
      end
    end
  end

  def swap(a, b)
    @store[a], @store[b] = @store[b], @store[a]
  end
end
