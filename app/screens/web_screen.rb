class WebScreen < PM::WebScreen
  title "Web Page Loading..."

  def load_finished
    self.title = evaluate('document.title')
  end

end
