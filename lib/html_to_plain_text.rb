# Converts HTML to human readable plain text
# Some regexps taken from premailer gem
module HtmlToPlainText

  def self.convert(html)

    # replace new lines (\r\n and \r) inside tags with empty space
    html.gsub!(/\r\n?/, " ")

    # paragraphs
    html.gsub!(/<\/p>/i, "\n\n")

    # line breaks
    html.gsub!(/<br[\/ ]*>/i, "\n")

    # wrap spans
    html.gsub!(/(<\/span>)[\s]*(<span)/mi, '\1 \2')

    # newline for list elements
    html.gsub!(/<\/li>[\s]*(?![\n])/i, "\n")

    # strip tags
    html.gsub!(/<\/?[^>]*>/, '')

    # remove linefeeds (\r\n and \r -> \n)
    html.gsub!(/\r\n?/, "\n")

    # clean &nbsp characters
    html.gsub!('&nbsp;', ' ')

    # replace tab with space
    html.gsub!(/\t+/, " ")

    # spaces at beggining and end of lines
    html.gsub!(/\n[ \t]+/, "\n") # space at start of lines
    html.gsub!(/[ \t]+\n/, "\n") # space at end of lines

    # no more than two consecutive newlines
    html.gsub!(/[\n]{3,}/, "\n\n")

    # no more than two consecutive spaces
    html.gsub!(/ {2,}/, " ")

    html.strip
  end
end
