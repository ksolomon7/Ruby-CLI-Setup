class YourEvent

   attr_accessor :prompt
   
   def initialize
    @prompt=TTY::Prompt.new
   end

   def welcome
    puts "Welcome to YourEvents. The app that knows what fun you are up to!".colorize(:yellow)
   end

   def client_or_event_planner
    prompt.select("Are you a client or eventplanner?", %w(Client EventPlanner))
   end

   def login_or_signup(role_str)
     role=role_str.constantize
     puts "Please provide your email to login."
     email=STDIN.gets.chomp.downcase
     role.find_by(email: email)
     main_menu
     binding.pry
   end

   def main_menu



   end
   

   def run
    welcome
    login_or_signup(client_or_event_planner)
    # wanna_see_favs?
    # get_joke(what_subject)
  end
#    def login_or_signup
    
#    end


end
