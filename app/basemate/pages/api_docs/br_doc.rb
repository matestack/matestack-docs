module Pages
  module ApiDocs
    class BrDoc < Page::Cell::Page

      def prepare
        @title = "Core Components API"
        @sub_title = "How to use basemate core components"
      end

      def response
        components {
          page_header title: @title, sub_title: @sub_title
          row do
            col desktop: 8, offset: { desktop: 2} do
              md path: "markdown/api_docs/br"
            end
          end
        }
      end

    end
  end
end
