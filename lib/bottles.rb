# frozen_string_literal: true

require 'bundler/setup'

class Bottles
  attr_accessor :verse_int, :verse_array

  def initialize
    self.verse_array = []
  end

  def verse(int)
    self.verse_array.clear
    self.verse_int = int
    verse_array << "#{quantity.capitalize} #{containers_of_drink} #{containers_location},"
    verse_array[0] += " #{quantity} #{containers_of_drink}."
    verse_array << "#{action_1.capitalize} #{action_2},"
    decrement_verse_int
    verse_array[1] += " #{quantity} #{containers_of_drink} #{containers_location}."
    verse_array.join("\n") + "\n"
  end

  def verses(arg1, arg2)
    verses_array = create_inclusive_array_from_limits(arg1, arg2)
    verses_array.map { |verse_number| verse(verse_number) }.join("\n")
  end

  def song
    verses(99,0)
  end

  private

  def create_inclusive_array_from_limits(limit1, limit2)
    ints = nil
    if limit1 < limit2
      ints = (limit1..limit2).to_a
    elsif limit1 > limit2
      ints = (limit2..limit1).to_a.reverse
    else
      raise ArgumentError
    end
  end

  def decrement_verse_int
    self.verse_int -=1
    self.verse_int = 99 if self.verse_int < 0
  end

  def quantity
    case verse_int
    when 2..100
    "#{verse_int}"
    when 1
    "#{verse_int}"
    when 0
    "no more"
    else raise ArgumentError
    end
  end

  def containers_of_drink
    case verse_int
    when 2..100
    "bottles of beer"
    when 1
    "bottle of beer"
    when 0
    "bottles of beer"
    else raise ArgumentError
    end
  end

  def containers_location
    "on the wall"
  end

  def action_1
    case verse_int
    when 2..100
    "take one down"
    when 1
    "take it down"
    when 0
    "go to the store"
    else raise ArgumentError
    end
  end

  def action_2
    case verse_int
    when 2..100
    "and pass it around"
    when 1
    "and pass it around"
    when 0
    "and buy some more"
    else raise ArgumentError
    end
  end
end

# bottle_instance = Bottles.new
# z = bottle_instance.verse(1)
# p z
# p z
# y = bottle_instance.verses(99, 97)
# p y
# bottle_instance.song
