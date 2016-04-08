def number_bank_exits?(account)
  
  case account

      when /^\d{4}\-\d{3}-\d{3}$/        then true
      when /\s\d{4}\-\d{3}-\d{3}$/       then true
      when /^\d{4}\-\d{3}-\d{3}\s/       then true
      when /\s\d{4}\-\d{3}-\d{3}\s/      then true   
      when /\D\d{4}\-\d{3}-\d{3}\D/      then true
      when /[a-zA-z]\d{4}\-\d{3}-\d{3}$/ then true
      when /^\d{4}\-\d{3}-\d{3}[a-zA-z]/ then true
      else
        false
      end
end


#/(.)(.)(.)/.match("abc")[2]   #=> "b"

def number_bank(string)
   exist = number_bank_exits?(string)
  if exist 
     /\d{4}\-\d{3}-\d{3}/.match(string).to_s
  else
    nil   
  end

end

def number_bank_array(string)
   exist = number_bank(string)
   array = []
  if exist != nil 
     array << exist
  else
    array   
  end

end


def number_bank_xxx(string)
   count = number_bank(string)
  if count != nil
    count.gsub(/\d{4}\-\d{3}/, "XXXX-XXX")
  end
end


def number_bank_format(string)
  a = /^\d{10}$/.match(string).to_s
  b = /^\d{4}\.\d{3}.\d{3}$/.match(string).to_s
  if a != ""
    a.insert(4, "-")
    a.insert(8, "-")
    a
  else
    b = b.gsub(/[.]/, "-")
  end
  
end

p number_bank_format("5555555555")
p number_bank_format("5555.555.555")

=begin
p number_bank_exits?("1234-123-123")
p number_bank_exits?(" 1234-123-123")
p number_bank_exits?(" 1234-123-123 ")
p number_bank_exits?("1234-123-123 ")
p number_bank_exits?("51234-123-123")
p number_bank_exits?("1234-123-1235")
p number_bank_exits?("a1234-123-123b")

p number_bank("kkk1234-123-123llllll")
p number_bank("kkk1234-123-123")
p number_bank("1234-123-123llllll")
p number_bank("1234-123-123")
p number_bank("1234-120003-123")

p number_bank_array("kkk1234-123-123llllll")
p number_bank_array("kkk1234-123-123")
p number_bank_array("1234-123-123llllll")
p number_bank_array("1234-123-123")
p number_bank_array("1234-120003-123")

p number_bank_xxx("kkk1234-123-123llllll")
p number_bank_xxx("kkk1234-123-123")
p number_bank_xxx("1234-123-123llllll")
p number_bank_xxx("1234-123-123")
p number_bank_xxx("1234-120003-123")

=end
