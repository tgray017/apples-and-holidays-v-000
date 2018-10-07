require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |season, season_holidays|
    if season == :winter
      season_holidays.each do |holiday, supply_array| 
        supply_array << supply
      end
    end
  end
end

def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash.each do |season, season_holidays|
    season_holidays.each do |holiday, supply_array|
      supply_array << supply if holiday == :memorial_day
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supplies = []
  holiday_hash.each do |season, season_holidays|
    if season == :winter
      season_holidays.each do |holiday, supply_array|
        supply_array.each {|supply| winter_supplies << supply}
      end
    end
  end
  winter_supplies
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, season_holidays|
    puts "#{season.capitalize}:"
    season_holidays.each do |holiday, supply_array|
      holiday_array = holiday.to_s.split('_')
        holiday_array.each {|word| word.capitalize!}
      puts "  #{holiday_array.join(' ')}: #{supply_array.join(', ')}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  holidays_with_bbq = []
  holiday_hash.each do |season, season_holidays|
    season_holidays.each do |holiday, supply_array|
      if supply_array.include?("BBQ")
        holidays_with_bbq << holiday
      end
    end
  end
  holidays_with_bbq
end





