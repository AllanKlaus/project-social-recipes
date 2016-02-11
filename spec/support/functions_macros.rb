module FunctionsMacros
  def login(user = nil)
    user ||= create(:user)

    visit new_user_session_path

    fill_in 'user[email]',    with: user.email
    fill_in 'user[password]', with: user.password
    click_on 'login'

    user
  end

  def to_slug(text)
    ret = text.strip

    ret.gsub! /['`]/, ''
    ret.gsub! /\s*@\s*/, ' at '
    ret.gsub! /\s*&\s*/, ' and '
    ret.gsub! /\s*[^A-Za-z0-9\-]\s*/, '-'
    ret.gsub! /_+/, '-'
    ret.gsub! /\A[_\.]+|[_\.]+\z/, ''

    # ret.gsub! %w(['`]), ''
    # ret.gsub! %w(\s*@\s*), ' at '
    # ret.gsub! %w(\s*&\s*), ' and '
    # ret.gsub! %w(\s*[^A-Za-z0-9\.\-]\s*), '-'
    # ret.gsub! %w(_+), '-'
    # ret.gsub! %w(\A[_\.]+|[_\.]+\z), ''

    ret.downcase
  end
end
