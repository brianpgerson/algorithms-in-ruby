# inputs: "4321", 10

require 'byebug'

def dumb_eval(string, target)
  debugger
  nums = string.split("")
  results = rec_eval(nums, "", [], target)
  results
end

def helper(nums, current, res, target)
  first = nums.first.to_i
  use_plus = rec_eval(nums.drop(1), "#{current}#{first} + ", res, target - first);
  use_minus = rec_eval(nums.drop(1), "#{current}#{first} - ", res, target + first);
  use_multi = rec_eval(nums.drop(1), "#{current}#{first} * ", res, target / first);
  use_divide = rec_eval(nums.drop(1), "#{current}#{first} / ", res, target * first);

  if nums.length >= 2
    to_lose = nums[0] + nums[1]
    combined_first = [to_lose].concat(nums.drop(2))
    lose_it = rec_eval(combined_first, "#{current}", res, target)
    return use_plus + use_minus + use_multi + use_divide + lose_it
  else
    return use_plus + use_minus + use_multi + use_divide
  end
end

def rec_eval(nums, current, res, target)
  if target == 0 && nums.length == 0
    res << current[0...-3]
    return res
  elsif nums.length == 0 && target != 0
    return []
  else
    return helper(nums, current, res, target)
  end
end
