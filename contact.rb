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

  def self.create(first_name, last_name, email, note) #self. means this method should be defined in the class
    #1.make a new contact
    new_contact = new(first_name, last_name, email, note)

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

  def self.find_by(attribute,value)
  @@contacts.select do |contact|
    case attribute
    when"first_name"
      if contact.first_name == value
         contact
      end
    when"last_name"
      if contact.last_name == value
         contact
      end
    when"email"
      if contact.email == value
         contact
      end
    when"note"
      if contact.note == value
         contact
      end
    else return "Not found."
      end
    end
  end


  def self.delete_all
    @@contacts == []
  end

  def self.all
    @@contacts
  end

  def update(attribute,value)
    case attribute
    when "first_name"
    self.first_name = value
    when "last_name"
    self.last_name = value
    when "email"
    self.email = value
    when "note"
    self.note = value
    end
  end

end


Contact.create("Mina","Mikhail","mina@bitmaker.io","Awesome")
Contact.create("Kexin","Wu","kexin@bitmaker.io","Cool")
Contact.create("Uzair","Mehmood","uzair@bitmaker.io","Amazing")
