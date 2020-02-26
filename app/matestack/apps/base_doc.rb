module Apps
  class BaseDoc < Matestack::Ui::App

    def prepare
      @title = "Matestack Ui Core Docs"
      @github_link = "https://github.com/basemate"

      @menu_links = []
    end

    def response
      components {
        div class: "mdl-layout mdl-js-layout mdl-layout--fixed-header mdl-layout--fixed-drawer" do
          partial :header_content
          partial :side_navigation
          partial :main_content
          partial :notice_bar
          partial :alert_bar
        end
      }
    end

    def header_content
      partial {
       custom_layout_header title: @title
      }
    end

    def side_navigation
      partial {
        div class: "mdl-layout__drawer" do
          span class: "mdl-layout-title header__logo" do
            link path: :root_path do
              img class: "header__logo", path: "matestack_logo.png", alt: "Matestack"
            end
          end
          nav class: "mdl-navigation" do
            partial :side_navigation_content
          end
        end
      }
    end

    def transition_link path, params, text
      partial {
        transition path: path, params: params, text: text, class: "mdl-navigation__link"
      }
    end

    def main_content
      partial {
        main class: "mdl-layout__content" do
          div do
           custom_row no_spacing: true do
              div class: "loading" do
                div class: "mdl-spinner mdl-js-spinner is-active"
              end
              div id: "page_content" do
                page_content
              end
            end
          end
        end
      }
    end

    def notice_bar
      partial {
        partial :snackbar, "notice_bar", "mdl-snackbar--notice"
      }
    end

    def alert_bar
      partial {
        partial :snackbar, "alert_bar", "mdl-snackbar--alert"
      }
    end

    def snackbar id, custom_class
      partial {
        div id: id, class: "mdl-js-snackbar mdl-snackbar #{custom_class}" do
          div class: "mdl-snackbar__text"
          div class: "mdl-snackbar__action"
        end
      }
    end

  end
end
