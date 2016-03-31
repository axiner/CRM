# Add any require_relative statements here
require_relative 'contact'

class CRM

  def self.run(name)
    a_crm_app = CRM.new
    a_crm_app.main_menu
  end


  def initialize(name)
    @name = name
  end


  def main_menu
    while true
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end


  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end


  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    end
  end


  def add_new_contact
    puts 'Enter First Name: '
    first_name = gets.chomp

    puts 'Enter Last Name: '
    last_name = gets.chomp

    puts 'Enter Email Address: '
    email = gets.chomp

    puts 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end


  def modify_existing_contact
      
  end


  def delete_contact
    Contact.delete_all
  end


  def display_all_contacts
    Contact.all
  end


  def search_by_attribute
    puts "Please type in an information kind(first_name, last_name, email or note)."
      attribute = gets.chomp
    puts "Please type in the corresponding content."
      value = gets.chomp

    Contact.find_by(attribute, value)

    puts "#{attribute} : #{value}"
  end

  # This method should accept as its argument an array of contacts
  # and display each contact in the contacts array
  def display_contacts(contacts)
    # Fill this in
    # HINT: Make use of this method in the display_all_contacts and search_by_attribute methods
  end

  # Add other methods here, if you need them.

end

# Run the program here (See 'Using a class method`)
