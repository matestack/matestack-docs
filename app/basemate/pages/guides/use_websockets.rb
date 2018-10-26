class Pages::Guides::UseWebsockets < Page::Cell::Page

  def prepare
    @title = "Use Websockets"
    @sub_title = ""
  end

  def response
    components {
      page_header title: @title, sub_title: @sub_title
      row do
        col desktop: 8, offset: { desktop: 2 } do
          div class: "page-content" do
            md path: "markdown/guides/use_websockets"
          end
        end
      end
    }
  end

end
