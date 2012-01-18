require 'chronic'

#Since ruby itself doesn't support ordinalize I found the source in rails to use
class Fixnum
  def ordinalize
    if (11..13).include?(self % 100)
      "#{self}th"
    else
      case self % 10
        when 1; "#{self}st"
        when 2; "#{self}nd"
        when 3; "#{self}rd"
        else    "#{self}th"
      end
    end
  end
end

class NinjaDate
  def self.get_first_thurs_month
  next_month = Chronic.parse("next month") #chronic gem nicely gets us the date for the next month
  #Use strftime on the date object returned from chronic to get the day of the month and convert
  #to an integer. Pass that int to built in monthnames constant. Once we get back the name of
  #the month we pass that to chronic gem again to get the first thursday in that month. Then use
  #strftime to properly print out the date and use the Fixnum class ordinalize method for the day.
  #Finally print out to stdout.
  first_thurs_next_month = Chronic.parse("1st thursday in #{Date::MONTHNAMES[next_month.strftime("%m").to_i]}")
  exact_day = first_thurs_next_month.strftime("%A, %B #{first_thurs_next_month.day.ordinalize}, %Y")
  puts "#{exact_day}"
  end
end

NinjaDate.get_first_thurs_month
