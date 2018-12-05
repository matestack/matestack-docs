class Pages::Paper < Page::Cell::Page

  def response
    components {
      row do
        col desktop: 8, offset: { desktop: 2 } do
          div class: "page-content" do
            md path: "markdown/paper"
          end
        end
      end
    }
  end

end
