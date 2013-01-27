# 阿拉伯数字转换成罗马数字

require "test/unit"

def unit(num, symbols, total_value)
  case num
    when 1..3: num.times { total_value += symbols[:low] }
    when 4: total_value += symbols[:low] + symbols[:mediu]
    when 5: total_value += symbols[:mediu]
    when 6..8: total_value += symbols[:mediu]; (num - 5).times { total_value += symbols[:low]}
    when 9: total_value += symbols[:low] + symbols[:high]
  end 

  return total_value
end

def convert(src)
  s4 = src / 1000
  s3 = (src % 1000) / 100 
  s2 = (src % 100) / 10 
  s1 = (src % 10)

  total_value = ''
  s4.times { total_value += 'M' }

total_value = unit(s3, {:high => 'M', :mediu => 'D', :low => 'C'}, total_value)
total_value = unit(s2, {:high => 'C', :mediu => 'L', :low => 'X'}, total_value)
total_value = unit(s1, {:high => 'X', :mediu => 'V', :low => 'I'}, total_value)

return total_value 
end

class TestSetupTeardown < Test::Unit::TestCase
 
  def test_1
    assert_equal('MMDCCLI', convert(2751)) 
  end
 
  def test_2
    assert_equal('CDXLVIII', convert(448)) 
  end

  def test_3
    assert_equal('CCCLXIX', convert(369))
  end
def test_4
    assert_equal('MCD', convert(1400))
  end
def test_5
    assert_equal('MCDXXXVII', convert(1437))
  end
def test_6
    assert_equal('MMMCCCXXXIII', convert(3333))
  end
def test_7
    assert_equal('MMMDCCCLXXXVIII', convert(3888))
  end
end



