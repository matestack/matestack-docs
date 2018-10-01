module Apps
  class Website < App::Cell::App

    def prepare
      @title = "Basemate Ui Core"
      @github_link = "https://github.com/basemate"
    end

    def response
      components {
        div class: "mdl-layout mdl-js-layout mdl-layout--fixed-header" do
          partial :header_content
          partial :side_navigation
          partial :main_content
        end
      }
    end

    def header_content
      partial {
        header class: "mdl-layout__header" do
          div class: "mdl-layout__header-row" do
            span class: "mdl-layout-title" do
              link path: :root_path, text: @title
            end
            div class: "mdl-layout-spacer"
            nav class: "mdl-navigation mdl-layout--large-screen-only" do
              link path: @github_link, text: "Source Code", target: "_blank"
            end
          end
        end
      }
    end

    def side_navigation
      partial {
        div class: "mdl-layout__drawer" do
          span class: "mdl-layout-title" do
            link path: :root_path, text: @title
          end
          nav class: "mdl-navigation" do
            transition path: :page_1_path, text: "Page 1", class: "mdl-navigation__link"
            transition path: :page_2_path, text: "Page 2", class: "mdl-navigation__link"
          end
        end
      }
    end

    def main_content
      partial {
        main class: "mdl-layout__content" do
          div do
            row do
              div class: "loading" do
                div class: "mdl-spinner mdl-js-spinner is-active"
              end
              col desktop: 8, offset: { desktop: 2 } do
                div class: "page-content" do
                  page_content
                end
              end
            end
          end
        end
      }
    end

  end
end
