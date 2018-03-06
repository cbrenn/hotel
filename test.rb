require 'date'
date_a =(Date.new(2012, 01, 01)..Date.new(2012, 01, 30)).to_a


puts date_a

Date.new(2012, 01, 01).upto(Date.new(2012, 01, 30)) do |date|
  # Do stuff with date
end
