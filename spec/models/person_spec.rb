require 'spec_helper'

describe Person do
  it "should return to_html" do
    person = Person.create(:first_name => "John", :last_name => "Lennon", :email => "john.lennon@beatles.com")
    person.to_html.should == <<-EOF
      <table>
        <thead>
          <th>Field</th>
          <th>Value</th>
        </thead>
        <tr>
          <td>email</td>
          <td>john.lennon@beatles.com</td>
        </tr>
        <tr>
          <td>first_name</td>
          <td>John</td>
        </tr>
        <tr>
          <td>last_name</td>
          <td>Lennon</td>
        </tr>
      </table>
    EOF
  end
end
