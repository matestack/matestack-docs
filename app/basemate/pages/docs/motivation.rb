module Pages
  module Docs
    class Motivation < Page::Cell::Page

      def prepare

      end

      def response
        components {
          div class: "page-heading" do
            row do
              col desktop: 8, offset: { desktop: 2 } do
                div class: "page-content" do
                  heading size: 2, text: "Why basemate?"
                  heading size: 5, text: "Escape the frontend hustle. Create beautiful software easily. Use basemate."
                end
              end
            end
          end
          row do
            col desktop: 8, offset: { desktop: 2 } do
              div class: "page-content" do
                md path: "docs/motivation"
              end
            end
          end
        }
      end

    end
  end
end
