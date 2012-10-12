require "fuzzyclock/version"

module Fuzzyclock
  def self.time(t)
    hour = t.hour
    minute = t.min
    minute_text = RANGES.
      select{|range, text| range.include?(minute)}.
      map{|range, text| text}.first
    hour = hour + 1 if (33..59).include?(minute)
    hour = ((hour - 1) % 12) + 1
    hour_text = HOURS[hour]
    if (0..3).include?(minute) || (58..59).include?(minute)
      return "#{hour_text} #{minute_text}"
    end
    "#{minute_text} #{hour_text}"
  end

  private

  RANGES = {
    (0..3) => %(o'clock),
    (4..7) => 'five past',
    (8..12) => 'ten past',
    (13..17) => 'quarter past',
    (18..22) => 'twenty past',
    (23..27) => 'twenty five past',
    (28..32) => 'half past',
    (33..37) => 'twenty five to',
    (38..42) => 'twenty to',
    (43..47) => 'quarter to',
    (48..52) => 'ten to',
    (53..57) => 'five to',
    (58..59) => %(o'clock)
  }

  HOURS = {
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve'
  }

end
