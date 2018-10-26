class Pages::Guides::CustomDynamicComponent < Page::Cell::Page

  def prepare
    @title = "Create a custom dynamic component"
    @sub_title = "Add some Vue.js to create a reusable custom dynamic component"
  end

  def response
    components {
      page_header title: @title, sub_title: @sub_title
      row do
        col desktop: 8, offset: { desktop: 2 } do
          div class: "page-content" do
            md path: "markdown/guides/custom_dynamic_component"
          end
        end
      end
    }
  end

end
