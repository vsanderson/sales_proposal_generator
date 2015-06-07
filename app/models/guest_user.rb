class GuestUser

  def name
    'Guest User'
  end

  def persisted?
    false
  end

  def guest?
    true
  end

end