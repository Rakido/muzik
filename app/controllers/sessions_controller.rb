class Users::SessionsController < Devise::SessionsController
  respond_to :js
end