module Pages
  module ApiDocs
    class ListDoc < Matestack::Ui::Page

      def prepare
        @title = "Core Components API"
        @sub_title = "How to use basemate core components"
      end

      def response
        components {
         custom_page_header title: @title, sub_title: @sub_title
         custom_row do
            custom_col desktop: 8, offset: { desktop: 2} do
             custom_md path: "markdown/api_docs/list"
            end
          end
        }
      end

    end
  end
end
