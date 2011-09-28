# Assert that the response is valid HTML5
Spec::Matchers.define :be_valid_html5 do
  validator = nil
  match do |body|
    validator = Html5Validator::Validator.new
    validator.validate_text(body)
    validator.valid?
  end
  failure_message_for_should do |actual|
    validator.inspect
  end
end
