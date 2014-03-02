module MainHelper
  def html_to_plain_text(html)
    HtmlToPlainText.convert(html)
  end
end
