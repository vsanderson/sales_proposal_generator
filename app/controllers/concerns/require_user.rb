module RequireUser
  extend ActiveSupport::Concern

  included do
    before_action :require_user
  end
end