require 'spec_helper'

describe Fuzzyclock do
  def self.make_time(h,m)
    now = Time.now
    Time.local(now.year, now.month, now.day, h, m, 0)
  end

  TEST_TIMES = {
    "7:45" => 'quarter to eight',
    "7:44" => 'quarter to eight',
    "19:45" => 'quarter to eight',
    '7:00' => %(seven o'clock),
    '0:00' => 'midnight',
    '11:58' => 'noon',
    '12:00' => 'noon',
    '12:04' => 'five past noon',
    '0:04' => 'five past midnight',
    '23:54' => 'five to midnight',
    '0:03' => 'midnight'
  }

  TEST_TIMES.each do |input, output|
    it "should display '#{output}' for an input time of '#{input}'" do
      split_time = input.split(':').map(&:to_i)
      t = Time.local(2012, 1, 1, split_time[0], split_time[1], 0)
      subject.time(t).should eq(output)
    end
  end
end
