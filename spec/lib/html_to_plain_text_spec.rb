require "spec_helper"

describe HtmlToPlainText do

  def convert(html)
    HtmlToPlainText.convert(html)
  end

  it "converts paragraphs" do
    convert("<p>l1</p><p>l2</p>").should == "l1\n\nl2"
  end

  it "removes line breaks characters inside html tags" do
    convert("<p>l1\r\n</p><p>l2\n</p>").should == "l1\n\nl2"
  end

  it "converts line breaks" do
    convert("l1<br />l2").should == "l1\nl2"
  end

  it "consecutive spans" do
    convert("<p><span>l1</span><span>l2</span></p>").should == "l1 l2"
    convert("<p><span>l1</span> <span>l2</span></p>").should == "l1 l2"
    convert("<p><span>l1</span> \n<span>l2</span></p>").should == "l1 l2"
  end

  it "new lines for list elements" do
    convert("<ul><li>l1</li><li>l2</li></ul>").should == "l1\nl2"
    convert("<ul><li>l1</li> <li>l2</li></ul>").should == "l1\nl2"
    convert("<ul><li>l1</li> \n<li>l2</li></ul>").should == "l1\nl2"
  end

  it "cleans nbsp characters" do
    convert("l1&nbsp;l2").should == "l1 l2"
  end

  it "strips whitespace" do
    convert("  \l1\nl2  ").should == "l1\nl2"
  end

  it "cleans space at beggining and end of lines" do
    convert("\t  \nl1\t \n l2 \t\n \t").should == "l1\nl2"
  end

  it "strips consecutive spaceswhen more than 1" do
    convert("l1 l2").should == "l1 l2"
    convert("l1        l2").should == "l1 l2"
  end

  it "strips consecutive newlines when more than 2" do
    convert("l1\n\nl2").should == "l1\n\nl2"
    convert("l1\n\n\n\n\nl2").should == "l1\n\nl2"
  end

  it "strips starting and ending spaces" do
    convert("   l1 l2   ").should == "l1 l2"
  end

  it "cleans tab characters" do
    convert(" \t\t  l1\t\tl2 \t\t  ").should == "l1 l2"
  end
end

