class PasswordManager2
    def initialize
        @passwords = {}
    end

    def valid(password)
        password.length > 7 && password.match?(/[!@$%&]/)
    end

    def add(service, password)
        if @passwords.has_key?(service)
            "ERROR: Service names must be unique"
        elsif @passwords.any? { |k, v| v['password'] == password}
            "ERROR: Passwords must be unique"
        else
            @passwords[service] = {
                'password' => password,
                'added_on' => Time.now
            }
        end
    end

    def services
        return @passwords.keys
    end

    def remove(service)
        @passwords.delete(service)
    end

    def update(service, password)
        if @passwords.has_key?(service)
            if @passwords.any? { |k, v| v['password'] == password}
                "ERROR: Passwords must be unique"
            else
                @passwords[service]['password'] = password
                @passwords[service]['added_on'] = Time.now
            end
        else
            "ERROR: Service does not exist"
        end
    end

    def password_for(service)
        @passwords[service]['password']
    end

    def sort_by(arg)
        if arg == "service"
            @passwords.keys.sort
        else
            @passwords.sort_by { |k, v| v['added_on']}.to_h.keys
        end
    end
end
=begin 
class recipe

class PasswordManager2

begin by initializing our passwords hash in initialize method
def initialize

define a method for valid, checks if password is correct length and contains special characters
def valid(password) 

define a method for add, adds service and password, stores both unless password in use or service already has password
def add(service, password)

define a method for services which returns our services but not the passwords
def services

define a method to remove service and password
def remove(service)

define a method for update, updates password of our service with a new one if the new password isn't in use already
def update(service, password)

define a method password_for which returns the password for the specified service
def password_for(service)

define a method sort_by which returns a list of our services sorted by either the service or when it was added
def sort_by(arg)
=end