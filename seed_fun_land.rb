# Christie Finnie
# Due: 2019-11-23
#
# Ruby seed app for Fun Land game venue rewards and guests
#
require 'faker'

def make_guests_seed(number_guests = 3)
# Remove old file
  File.delete("guests_seed.txt") if File.exist?("guests_seed.txt")

# Add guests 
  puts number_guests.class
  number_guests.to_i.times do |i| 
    puts i
    dummy_name = Faker::Name.name      #=> "Christophe Bartell"
    dummy_tokens = Random.rand(10000)
    puts dummy_name 
    puts dummy_tokens
    insert_cmd = "INSERT INTO guests (name, tokens) VALUES (#{dummy_name}, #{dummy_tokens});\n"

  # Write to file
    File.open("guests_seed.txt", "a") do |f|
      f.write(insert_cmd)
    end

  end

end


make_guests_seed

