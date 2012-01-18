require 'rspec'
require 'spec_helper'

describe Fixnum do
  context "ordinalize" do
    describe "if fixnum value is between 11 and 13" do
      it "should append a th onto the fixnum value" do
        between11 = 11.ordinalize
        between11.should == "11th"
        between12 = 12.ordinalize
        between12.should == "12th"
        between13 = 13.ordinalize
        between13.should == "13th"
      end
    end
    describe "if fixnum value % 10 is 1" do
      it "should append an st onto the fixnum value" do
        st1 = 1.ordinalize
        st1.should == "1st"
        st2 = 21.ordinalize
        st2.should == "21st"
        st3 = 31.ordinalize
        st3.should == "31st"
      end
    end
    describe "if fixnum value % 10 is 2" do
      it "should append an nd onto the fixnum value" do
        st1 = 2.ordinalize
        st1.should == "2nd"
        st2 = 22.ordinalize
        st2.should == "22nd"
        st3 = 32.ordinalize
        st3.should == "32nd"
      end
    end
    describe "if fixnum value % 10 is 3" do
      it "should append an nd onto the fixnum value" do
        st1 = 3.ordinalize
        st1.should == "3rd"
        st2 = 23.ordinalize
        st2.should == "23rd"
        st3 = 33.ordinalize
        st3.should == "33rd"
      end
    end
    describe "if fixnum value is not between 11 and 13 nor % 10 is 1, 2, or 3" do
      it "should append a th onto the fixnum value" do
        st1 = 5.ordinalize
        st1.should == "5th"
        st2 = 27.ordinalize
        st2.should == "27th"
        st3 = 100.ordinalize
        st3.should == "100th"
      end
    end
  end
end

describe NinjaDate do
  context "get_first_thurs_month" do
    describe "if December of 2012, then the next month will be in 2013" do
      it "should print out Thursday, January 3rd, 2013" do
        time_now = Time.parse("Dec 11 2012")
        Time.stub(:now).and_return(time_now)
        $stdout.should_receive(:puts).with("Thursday, January 3rd, 2013")
        NinjaDate.get_first_thurs_month
      end
    end
    describe "if January of 2012, then the date should be Thursday, February 2nd, 2012" do
      it "should print out Thursday, February 2nd, 2012" do
        time_now = Time.parse("Jan 17 2012")
        Time.stub(:now).and_return(time_now)
        $stdout.should_receive(:puts).with("Thursday, February 2nd, 2012")
        NinjaDate.get_first_thurs_month
      end
    end
    describe "if February of 2012, then the date should be Thursday, March 1st, 2012" do
      it "should print out Thursday, March 1st, 2012" do
        time_now = Time.parse("Feb 05 2012")
        Time.stub(:now).and_return(time_now)
        $stdout.should_receive(:puts).with("Thursday, March 1st, 2012")
        NinjaDate.get_first_thurs_month
      end
    end
    describe "if March of 2012, then the date should be Thursday, March 1st, 2012" do
      it "should print out Thursday, April 5th, 2012" do
        time_now = Time.parse("Mar 10 2012")
        Time.stub(:now).and_return(time_now)
        $stdout.should_receive(:puts).with("Thursday, April 5th, 2012")
        NinjaDate.get_first_thurs_month
      end
    end
    describe "if May of 2034, then the date should be Thursday, June 1st, 2034" do
      it "should print out Thursday, June 1st, 2034" do
        time_now = Time.parse("May 22 2034")
        Time.stub(:now).and_return(time_now)
        $stdout.should_receive(:puts).with("Thursday, June 1st, 2034")
        NinjaDate.get_first_thurs_month
      end
    end
  end
end
