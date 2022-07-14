class Redcarpet::CustomRender < Redcarpet::Render::HTML
  def paragraph(text)
    new_text = note(text)
    new_text = msg(new_text)

    new_text
  end

  private

  def note(text)
    pattern = /\A\[note:?(.*)\]/
    note = text.match(pattern)
    return text unless note

    color = note[1].present? ? "is-#{note[1]}" : ""
    text.sub(pattern, "<div class='notification is-light #{color}'>").sub("[/note]", "</div>")
  end

  def msg(text)
    pattern = /\A\[msg:?(.*) title=(.+)\]/
    msg = text.match(pattern)
    return text unless msg

    color = msg[1].present? ? "is-#{msg[1]}" : ""
    title = msg[2]

    new_text = text.sub(
      pattern,
      "<div class='message #{color}'><div class='message-header'>#{title}</div><div class='message-body'>"
    )
    new_text.sub("[/msg]", "</div></div>")
  end
end
