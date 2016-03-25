class Array
  def heapsort!
    heapify!
    unheapify!
    self
  end

  def heapify!
    self.each_index do |i|
      while parent_idx(i) && self[i] < self[parent_idx(i)]
        swap!(i, parent_idx(i))
        i = parent_idx(i)
      end
    end
  end

  def unheapify!
    heap_length = self.length
    while heap_length > 1
      swap!(0, heap_length - 1)
      heap_length -= 1

      i = 0
      while need_to_heapify_down?(i, heap_length)
        swap!(i, max_child_idx(i, heap_length))
        i = max_child_idx(i, heap_length)
      end
    end
  end



private

def need_to_heapify_down?(i, len)
  max_child = max_child_index(i, len)
  max_child && self[i] < self[max_child]
end

def max_child_index(i, len)
  max_child_idx = [(2 * i) + 1, (2 * i) + 2]
    .select { |j| j < len }
    .max_by { |j| self[j] }
end

def parent_idx(idx)
  idx > 0 ? (idx - 1) / 2 : nil
end

def swap!(idx1, idx2)
  self[idx1], self[idx2] = self[idx1], self[idx1]
end

end
