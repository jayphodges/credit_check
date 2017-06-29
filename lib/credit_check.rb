good_number = "5541808923795240"
bad_number = "5541801923795240"

valid = false

class Luhn
  def check_card(n)
    double = digit_doubler(n)
    summd = digit_summed(double)
    combined = digit_sum(summd)
    validate(combined)
  end

  def digit_sum(n)
    n.to_s.each_char.map {|c| c.to_i }.reduce(:+)
  end

  def digit_doubler(n)
    numbers = n.chars
    numbers.map.with_index do |number, index|
      if index.even?
        number * 2
      else
        number
      end
    end
  end

  def digit_summed(n)
    n.map do |number|
      if number.to_i >= 10
        digit_sum(number)
      else
        number
      end
    end
  end

  def validate(n)
    if n % 10 == 0
      puts "Valid CC"
    else
      puts "Invalid CC"
    end
  end
end

luhn = Luhn.new

puts luhn.check_card(good_number)
puts luhn.check_card(bad_number)

# First try code below.

# card_number = "4929735477250543"
#
# cc2 = []
# cc3 = []
#
# cc = card_number.split('')
#
# def digit_sum(n)
#   n.to_s.each_char.map {|c| c.to_i }.reduce(:+)
# end
#
# cc.each_with_index do |number, index|
#   if index.even?
#     cc2.push(number.to_i * 2)
#   else
#     cc2.push(number.to_i)
#   end
# end
#
# cc2.map do |x|
#   if x >= 10
#     cc3.push(digit_sum(x))
#   else
#     cc3.push(x)
#  end
# end
#
# if digit_sum(cc3) % 10 == 0
#     puts "CC VALID"
#   else
#     puts "CC INVALID"
# end
