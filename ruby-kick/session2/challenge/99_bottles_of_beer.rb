#!/usr/bin/env ruby

# written by Terry Pensel 10/2012
# Note: 
# I wanted separate methods to do seperate tasks. I don't like calling methods within other
# methods unless it's neccessary. There were only a few exceptions (two, one, and zero bottles of beer), 
# The translate and print_stanza methods can be reused easily. 
# 
# Original problem as stated in ruby-kickstart.com Session2 challenge (11_classes.rb) by Josh Cheek. 

# Write a program that outputs the lyrics for "Ninety-nine Bottles of Beer on the Wall"
# Your program should print the number of bottles in English, not as a number. For example:
#
# Ninety-nine bottles of beer on the wall,
# Ninety-nine bottles of beer,
# Take one down, pass it around,
# Ninety-eight bottles of beer on the wall.
# ...
# One bottle of beer on the wall,
# One bottle of beer,
# Take one down, pass it around,
# Zero bottles of beer on the wall.
#
# Your program should not use ninety-nine output statements!
# Design your program with a class named BeerSong whose initialize method 
# receives a parameter indicating the number of bottles of beer initially on the wall.
# If the parameter is less than zero, set the number of bottles to zero. Similarly,
# if the parameter is greater than 99, set the number of beer bottles to 99
# Then make a public method called print_song that outputs all stanzas from the number of bottles of beer down to zero.
# Add any additional methods you find helpful.


class BeerSong
 
  attr_accessor :beer, :h_bottles, :l_bottles
  
  def initialize(beer)
    beer = 99 if beer > 99
    beer = 0 if beer < 0
    @beer = beer
    @h_bottles = h_bottles   # represents high bottles of beer (English)
    @l_bottles = l_bottles   # represents next lower bottle of beer (English)
  end
  
  # Main method to print song
  
  def print_song
    beer.downto 1 do |x|
      translate x
      print_stanza( h_bottles, l_bottles) 
    end
  end
  
  # Main method to print a stanza of the song, plus exceptions for Two, One, and Zero
  
  def print_stanza(h_bottles, l_bottles)
    if h_bottles == "Zero"
      nil
    elsif h_bottles == "Two"
      puts "Two bottles of beer on the wall,"              ,
           "Two bottles of beer,"                          ,
           "Take one down, pass it around,"                ,
           "One bottle of beer on the wall."  
      # puts  # comment out line if you want to pass Josh's rake test   
    elsif h_bottles == "One"
      puts "One bottle of beer on the wall,"               ,
           "One bottle of beer,"                           ,
           "Take one down, pass it around,"                ,
           "Zero bottles of beer on the wall."
    else
      puts  "#{h_bottles} bottles of beer on the wall,"    ,
            "#{h_bottles} bottles of beer,"                ,
            "Take one down, pass it around,"               ,
            "#{l_bottles} bottles of beer on the wall." 
      # puts  # comment out line if you want to pass Josh's rake test      
    end
  end
  
  # translates the number of beers to English. 
  
  def translate(n)   
    
    # Hashes and Arrays of English words
    
    ten_words_static = {90 => "Ninety", 80 => "Eighty", 70 => "Seventy", 60 => "Sixty", 50 => "Fifty", 40 => "Forty", 30 => "Thirty", 20 => "Twenty", 10 => "Ten"}
    static_words = {19 => "Nineteen", 18 => "Eighteen", 17 => "Seventeen", 16 => "Sixteen", 15 => "Fifteen", 14 => "Fourteen", 13 => "Thirteen", 12 => "Twelve", 11 => "Eleven"}
    single_words = %w(zero one two three four five six seven eight nine)
    tmp_arry = Array.new # used to store h_bottles and l_bottles values
    while tmp_arry.size < 2
        case 
          when n < 10
            @h_bottles = single_words[n].capitalize 
          when (n > 10) && (n <= 19)
            @h_bottles = static_words[n]
          when  (n%10) == 0 
            @h_bottles = ten_words_static[n]
          when n%10 != 0
            @h_bottles = ten_words_static[n/10*10] + "-" + single_words[n%10]
          else 
            nil
        end
      tmp_arry.push(@h_bottles)
      n = n - 1 # used to get next bottle of beer count
    end
    # used to get back results from translation
    @l_bottles = tmp_arry.pop
    @h_bottles = tmp_arry.pop
  end
end

# Remove a # for Testing   
        
#a = BeerSong.new(25)
#a = BeerSong.new(-5)
#a = BeerSong.new(134)
#a = BeerSong.new(1)
#a = BeerSong.new(0)  
a = BeerSong.new(99)        

a.print_song