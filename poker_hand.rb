#!/usr/bin/env ruby
#
# This program will shuffle a deck a cards randomly, and show a hand of 5 cards
# written by Terry Pensel
# 10/15/2012
# 


class Cardgame

# List of Relavant cards

  @@card_names = {
    2 => '2',
    3 => '3',
    4 => '4',
    5 => '5',
    6 => '6',
    7 => '7',
    8 => '8',
    9 => '9',
    10 => '10',
    11 => 'Jack',
    12 => 'Queen', 
    13 => 'King', 
    1 => 'Ace'}
        
# Main method call for getting cards for hand
        
      def get_cards
         @@hand = Array.new
         @@real_hand = Array.new
         while @@hand.length < 5  
            card_num = rand(53) 
            @@hand.push(card_num) if card_num.nonzero? # handles 0 condition and push to hand array
            @@hand.uniq!   # eliminates possible duplicates
          end
        # puts "HANDS"  
        # print @@hand, "\n"
        translate_hand()   # Translates the numbers into REAL cards 
      end

    def translate_hand
      #puts "Inside Translate"
      #print @@hand, "\n"
      # This loop assigns suit to each card.
        @@hand.each do |num|
            @@card_suit = case num
              when 1..13 then "Clubs"
              when 14..26 then "Spades"
              when 27..39 then "Diamonds"
              when 40..52 then "Hearts"
            end  
              # this get the card name for the array 
              val = num%13
              # handles exception for even divisor of 13 without changing random generation
              if (num.to_f/13 == num/13) 
                val = 13  
              end      
          @@real_hand.push("#{@@card_names[val]} of #{@@card_suit}")
          
          end  
      puts "REAL HAND"
      puts @@real_hand
    end        
end


puts "This program generates a random generation of 5 cards from a normal French deck"
puts "written by Terry Pensel"
puts "10/2012"
puts

begin
puts "New Hand? \(y\/n\)"
new_hand = gets.chomp
  if new_hand == "y"
    show_hand = Cardgame.new
    show_hand.get_cards
  elsif new_hand == "n"
    puts "Done? \(y\/n\)"
    done = gets.chomp
    puts "Thanks for playing. Have a nice day!!!"
  end 
end while (done != "y")
  
