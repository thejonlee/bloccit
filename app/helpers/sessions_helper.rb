module SessionsHelper
  # session is a Ruby object to track the state of a particular user
  def create_session(user)
    session[:user_id] = user.id
  end

# clearing user id effectively destroys the user session 
  def destroy_session(user)
    session[:user_id] = nil
  end

# #6
  def current_user
    User.find_by(id: session[:user_id])
  end
end
