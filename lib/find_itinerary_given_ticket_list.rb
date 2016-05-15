# Find Itinerary from a given list of tickets
# Given a list of tickets, find itinerary in order using the given list.

# Example:

# Input:
"Chennai" -> "Banglore"
"Bombay" -> "Delhi"
"Goa"    -> "Chennai"
"Delhi"  -> "Goa"

# Output:
# Bombay->Delhi, Delhi->Goa, Goa->Chennai, Chennai->Banglore,

ticket_list = { "Chennai" => "Banglore",
                "Bombay"  => "Delhi",
                "Goa"     => "Chennai",
                "Delhi"   => "Goa"
              }

def solve(ticket_list)
  initial_origin = ''
  final_destination = ''
  location = ''

  origins = ticket_list.keys
  destinations = ticket_list.values

  origins.each do |origin|
    initial_origin = origin unless destinations.include?(origin)
  end

  destinations.each do |destination|
    final_destination = destination unless origins.include?(destination)
  end

  count = 1
  ticket_list.each do |k, v|
    if count == 1
      puts "#{initial_origin} - #{ticket_list[initial_origin]}"
      location = ticket_list[initial_origin]
      count += 1
    elsif count == ticket_list.size
      puts "#{ticket_list.key(final_destination)} - #{final_destination}"
    else
      puts "#{location} - #{ticket_list[location]}"
      location = ticket_list[location]
      count += 1
    end
  end

end
