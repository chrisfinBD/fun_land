# Christie Finnie
# Due: 2019-11-23
#
# Ruby seed app for Fun Land game venue rewards and guests
#
require 'faker'

def make_guests_seed(number_guests = 250)
# Remove old file
  File.delete("guests_seed.txt") if File.exist?("guests_seed.txt")

# Add guests 
  number_guests.to_i.times do |i| 
    #puts i
    dummy_name = Faker::Name.name      #=> "Christophe Bartell"
    dummy_tokens = Random.rand(10000)
    #puts dummy_name 
    #puts dummy_tokens
    insert_cmd = "INSERT INTO guests (name, tokens) VALUES ('#{dummy_name}', #{dummy_tokens});\n"

  # Write to file
    File.open("guests_seed.txt", "a") do |f|
      f.write(insert_cmd)
    end

  end

end


def make_rewards_seed(number_rewards = 3)
  # Remove old file
    File.delete("rewards_seed.txt") if File.exist?("rewards_seed.txt")
  
  # Add guests 
  number_rewards.to_i.times do |i| 
      dummy_name = Faker::Name.name
      dummy_tokens = Random.rand(5000)
      is_available = Random.rand(2) == 1
      puts is_available
      #puts dummy_name 
      #puts dummy_tokens
      insert_cmd = "INSERT INTO rewards (item_name, tokens, available) VALUES ('#{dummy_name}', #{dummy_tokens}, #{is_available});\n"
  
    # Write to file
      File.open("rewards_seed.txt", "a") do |f|
        f.write(insert_cmd)
      end
  
    end
  
  end


make_guests_seed
make_rewards_seed

