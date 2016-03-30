class Contact #Object consist of state and behaviour
  attr_accessor :id, :first_name, :last_name, :email, :note

  @@contacts = []
  @@next_id = 1

  def initialize(first_name, last_name, email,note)
    @id = @@next_id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end

  def full_name
    "#{first_name} #{last_name}"
    #[first_name, last_name].join(" ")
  end

  def self.create(options) #self. means this method should be defined in the class
    #1.make a new contact
    new_contact = new(options[:first_name],options[:last_name],options[:email],options[:note])

    #2.add it to the list of contacts(@@contacts)
    @@contacts << new_contact

    #3.Increment the global id
    @@next_id += 1

    #4.return the new contact
    new_contact
  end

  def self.find(id)
    @@contacts.each do |contact|
      if id == contact.id
        return contact
      end
    end
    return "Not Found."
  end

  def self.delete_all
    @@contacts == []
  end

  def self.all
    @@contacts
  end

  def update
        puts "What first name would you like to change?"
        self.first_name = gets.chomp
        return self
  end

end


Contact.create(first_name:"Mina",last_name:"Mikhail",email:"mina@bitmaker.io",note:"Awesome")
Contact.find(3)
