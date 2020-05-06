module ApplicationHelper
  def nl2br(str, html_safe = true)
    str = str.to_s.gsub(/\R/, '<br>')
    html_safe ? str.html_safe : str
  end
end