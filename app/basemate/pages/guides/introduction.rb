module Pages
  module Guides
    class Introduction < Page::Cell::Page

      def response
        components {
          div class: "page-heading" do
            row do
              col desktop: 8, offset: { desktop: 2 } do
                div class: "page-content" do
                  heading size: 2, text: "Hey mate!"
                  heading size: 5, text: "Welcome to our documentation! Work in progess, stay tuned!"
                end
              end
            end
          end
          row do
            col desktop: 8, offset: { desktop: 2 } do
              div class: "page-content" do
                md path: "markdown/guides/introduction"
              end
            end
          end
        }
      end


    end
  end
end
