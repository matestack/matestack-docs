class Pages::Guides::CreateAPwa < Page::Cell::Page

  def prepare
    @title = "Create a Progressiv Web App"
    @sub_title = ""
  end

  def response
    components {
      page_header title: @title, sub_title: @sub_title
      row do
        col desktop: 8, offset: { desktop: 2 } do
          div class: "page-content" do
            md path: "markdown/guides/create_a_pwa"
          end
        end
      end
    }
  end

end
