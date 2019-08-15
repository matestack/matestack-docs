class Pages::Paper < Matestack::Ui::Page

  def response
    components {
     custom_row do
        custom_col desktop: 8, offset: { desktop: 2 } do
          div class: "page-content" do
           custom_md path: "markdown/paper"
          end
        end
      end
    }
  end

end
