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
                  heading size: 2, text: "Why Basemate?"
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
