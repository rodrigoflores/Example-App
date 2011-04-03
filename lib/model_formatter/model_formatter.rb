module ModelFormatter
  def to_html
    response = []
    response << <<-EOF
      <table>
        <thead>
          <th>Field</th>
          <th>Value</th>
        </thead>
    EOF
    (attributes.keys - ["created_at", "updated_at", "id"]).each do |attribute|
      response << <<-EOF
        <tr>
          <td>#{attribute}</td>
          <td>#{self.send(attribute.to_sym)}</td>
        </tr>
      EOF
    end
    response << "      </table>\n"
    response.join
  end
end