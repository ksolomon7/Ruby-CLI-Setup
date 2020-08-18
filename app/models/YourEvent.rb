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
     puts "Please provide your email to login:"
     email=STDIN.gets.chomp.downcase
      if role.find_by(email: email) != nil
          puts "Welcome back #{role.find_by(email: email).name}!".colorize(:yellow)
          sleep 3
          main_menu
      elsif role.find_by(email: email) == nil
          puts "Sorry! This email does not exist.".colorize(:red)
          sleep 3
          login_or_signup(client_or_event_planner)
      end
   end

  #  def main_menu
  #     puts "MAIN MENU".co
  #     puts "Please choose from the following options"


  #  end


   def run
    welcome
    login_or_signup(client_or_event_planner)
    # wanna_see_favs?
    # get_joke(what_subject)
  end

##################################################HELPER METHODS!!!########################################################

end
