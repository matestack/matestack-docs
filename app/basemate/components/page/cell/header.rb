class Components::Page::Cell::Header < Component::Cell::Static

  def prepare
    @github_link = "https://github.com/basemate"
  end

  def response
    components {
      div class: "page-heading" do
        row do
          col desktop: 8, offset: { desktop: 2 } do
            div class: "page-content" do
              heading size: 2, text: options[:title]
              heading size: 5, text: options[:sub_title]
            end
          end
        end
      end
    }
  end

end
