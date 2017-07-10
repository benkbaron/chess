# PHASE 2
def convert_to_int(str)
    Integer(str)
  rescue ArgumentError => e
    puts e.message
    nil
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  begin
    if FRUITS.include? maybe_fruit
      puts "OMG, thanks so much for the #{maybe_fruit}!"
    else

      raise StandardError
    end
  rescue StandardError => e
    if maybe_fruit == "coffee"
      puts "Thanks, but I want a fruit. Try again:"
      maybe_fruit = gets.chomp
      retry
    else
      puts "Go away."
    end
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit)
end

# PHASE 4
class BestFriend
  def initialize(*args)
    name = args[0]
    yrs_known = args[1]
    fav_pastime = args[2]
    raise "Wrong number of arguments." if args.length < 3
    raise "You don't know me." if yrs_known < 5
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime

  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
