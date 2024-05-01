# frozen_string_literal: true

require 'bundler/setup'

# Class `Bottles` generates verses of the 99 Bottles of Beer on the wall song
class Bottles
  attr_accessor :verse_int, :verse_array, :quantity, :containers_of_drink, :containers_location, :action1, :action2

  def initialize
    self.verse_array = []
  end

  def verse(int)
    verse_array.clear
    self.verse_int = int
    set_lyrics
    verse_array << "#{quantity.capitalize} #{containers_of_drink} #{containers_location}, #{quantity} #{containers_of_drink}."
    verse_array << "#{action1.capitalize} #{action2},"
    decrement_verse_int
    set_lyrics
    verse_array[1] += " #{quantity} #{containers_of_drink} #{containers_location}."
    "#{verse_array.join("\n")}\n"
  end

  def verses(arg1, arg2)
    array_of_verses = create_inclusive_array_from_limits(arg1, arg2)
    array_of_verses.map { |verse_number| verse(verse_number) }.join("\n")
  end

  def song
    verses(99, 0)
  end

  private

  def create_inclusive_array_from_limits(limit1, limit2)
    case limit1 <=> limit2
    when -1 then (limit1..limit2).to_a
    when 0  then raise ArgumentError
    when 1  then (limit2..limit1).to_a.reverse
    end
  end

  def decrement_verse_int
    self.verse_int -= 1
    self.verse_int = 99 if self.verse_int.negative?
  end

  def set_lyrics
    case verse_int
    when 2..100 then set_verses2upto100
    when 1 then set_verse1
    when 0 then set_verse0
    else raise ArgumentError
    end
  end

  def set_verse0
    self.quantity = 'no more'
    self.containers_of_drink = 'bottles of beer'
    self.containers_location = 'on the wall'
    self.action1 = 'go to the store'
    self.action2 = 'and buy some more'
  end

  def set_verse1
    self.quantity = verse_int.to_s
    self.containers_of_drink = 'bottle of beer'
    self.containers_location = 'on the wall'
    self.action1 = 'take it down'
    self.action2 = 'and pass it around'
  end

  def set_verses2upto100
    self.quantity = verse_int.to_s
    self.containers_of_drink = 'bottles of beer'
    self.containers_location = 'on the wall'
    self.action1 = 'take one down'
    self.action2 = 'and pass it around'
  end
end
