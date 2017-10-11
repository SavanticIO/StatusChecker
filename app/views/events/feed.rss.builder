#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Check Status"
    xml.author "Mark Ferguson"
    xml.description "All Active and Scheduled Events"
    xml.language "en"

    for event in @events
      xml.item do
        if event.title
          xml.title event.title
        else
          xml.title ""
        end
        date = event.created_at+3600
        xml.pubDate date.to_s(:rfc822)
        xml.link "http://localhost:3000/events/" + event.id.to_s
        xml.guid event.id

        text = event.text     
        xml.description text 

      end
    end
  end
end