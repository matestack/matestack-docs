class Pages::Guides::CreateAPwa < Matestack::Ui::Page

  def prepare
    @title = "Create a Progressiv Web App"
    @sub_title = ""
  end

  def response
    components {
     custom_page_header title: @title, sub_title: @sub_title
     custom_row do
        custom_col desktop: 8, offset: { desktop: 2 } do
          div class: "page-content" do
           custom_md path: "markdown/guides/create_a_pwa"
          end
        end
      end
    }
  end

end
