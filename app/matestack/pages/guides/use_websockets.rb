class Pages::Guides::UseWebsockets < Matestack::Ui::Page

  def prepare
    @title = "Use Websockets"
    @sub_title = ""
  end

  def response
    components {
     custom_page_header title: @title, sub_title: @sub_title
     custom_row do
        custom_col desktop: 8, offset: { desktop: 2 } do
          div class: "page-content" do
           custom_md path: "markdown/guides/use_websockets"
          end
        end
      end
    }
  end

end
