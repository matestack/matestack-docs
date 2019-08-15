class Pages::Guides::CustomStaticComponent < Matestack::Ui::Page

  def prepare
    @title = "Create a custom static component"
    @sub_title = "Use pure Ruby to define a reusable custom component"
  end

  def response
    components {
     custom_page_header title: @title, sub_title: @sub_title
     custom_row do
        custom_col desktop: 8, offset: { desktop: 2 } do
          div class: "page-content" do
           custom_md path: "markdown/guides/custom_static_component"
          end
        end
      end
    }
  end

end
