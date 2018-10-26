class Pages::Guides::CustomStaticComponent < Page::Cell::Page

  def prepare
    @title = "Create a custom static component"
    @sub_title = "Use pure Ruby to define a reusable custom component"
  end

  def response
    components {
      page_header title: @title, sub_title: @sub_title
      row do
        col desktop: 8, offset: { desktop: 2 } do
          div class: "page-content" do
            md path: "markdown/guides/custom_static_component"
          end
        end
      end
    }
  end

end
