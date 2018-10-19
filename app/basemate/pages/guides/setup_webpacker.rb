module Pages
  module Guides
    class SetupWebpacker < Page::Cell::Page

      def prepare
      end

      def response
        components {
          div class: "page-heading" do
            row do
              col desktop: 6, offset: { desktop: 2 } do
                div class: "page-content" do
                  heading size: 2, text: "Setup with Webpacker"
                  # heading size: 5, text: "Welcome to our documentation"
                end
              end
            end
          end
          row do
            col desktop: 6, offset: { desktop: 2 } do
              div class: "page-content" do
                md path: "markdown/guides/setup_webpacker"
              end
            end
          end
        }
      end

    end
  end
end
