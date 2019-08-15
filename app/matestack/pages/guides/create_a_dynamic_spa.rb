class Pages::Guides::CreateADynamicSpa < Matestack::Ui::Page

  def prepare
    @title = "Create a dynamic SPA"
    @sub_title = "Use pure Ruby to define a SPA with dynamic page transitions"
  end

  def response
    components {
     custom_page_header title: @title, sub_title: @sub_title
     custom_row do
        custom_col desktop: 8, offset: { desktop: 2 } do
          div class: "page-content" do
           custom_md path: "markdown/guides/create_a_dynamic_spa"
          end
        end
      end
    }
  end

end
