# TODO: Copy data from http://epochwolf.com/atom.xml
xml.instruct!
xml.feed "xmlns" => "http://www.w3.org/2005/Atom" do
  xml.title "Epoch's Writing"
  xml.id "http://epochwolf.com/writing/"
  xml.link "href" => "http://epochwolf.com/writing"
  xml.link "href" => "http://epochwolf.com/writing/atom.xml", "rel" => "self"
  xml.updated blog("writing").articles.first.date.to_time.iso8601
  xml.author { xml.name "epochwolf" }

  blog("writing").articles[0..10].each do |article|
    xml.entry do
      xml.title article.title
      xml.link "rel" => "alternate", "href" => article.url
      xml.id article.url
      xml.published article.date.to_time.iso8601
      xml.updated article.date.to_time.iso8601
      xml.author { xml.name "epochwolf" }
      # xml.summary article.summary, "type" => "html"
      xml.content article.body, "type" => "html"
    end
  end
end