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


def make_rewards_seed(number_rewards = 75)
  # Remove old file
    File.delete("rewards_seed.txt") if File.exist?("rewards_seed.txt")
  
  # Add reward items and make sure teh names are unique
  used_names = []
  while used_names.length < 75 do 
    item_source_pick = Random.rand(3)
      
    case item_source_pick
    when 0
    #dummy_name = Faker::Name.name      #=> "Christophe Bartell"
    #Faker::Commerce.product_name
      dummy_name = Faker::Games::Zelda.item
    when 1
      dummy_name = Faker::Games::Dota.item
    when 2
      dummy_name = Faker::Commerce.product_name
    end

    if used_names.include?(dummy_name) 
      next
    end

    dummy_tokens = Random.rand(5000)
    is_available = Random.rand(2) == 1
    #puts is_available
    #puts dummy_name 
    #puts dummy_tokens
    insert_cmd = "INSERT INTO rewards (item_name, tokens, available) VALUES ('#{dummy_name}', #{dummy_tokens}, #{is_available});\n"

    # Write to file
    File.open("rewards_seed.txt", "a") do |f|
      f.write(insert_cmd)
    end
  
  end # number_reward do
  
  # Check if there's enough items
  if used_names.length < number_rewards
    puts "Unable to generate enough items..."
  end
end # make_rewards_seed


make_guests_seed
make_rewards_seed



