module Apps
  class Docs < App::Cell::App

    def prepare
      @title = "Basemate Ui Core"
      @github_link = "https://github.com/basemate"
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
        header class: "mdl-layout__header" do
          div class: "mdl-layout__header-row" do
            span class: "mdl-layout-title header__logo" do
              link path: :root_path, class: "mobile-header__logo" do
                img class: "header__logo", path: "basemate-logo-black.png", alt: "Basemate"
              end
            end
            div class: "mdl-layout-spacer"
            nav class: "mdl-navigation mdl-layout--large-screen-only" do
              span class: "header__slogan" do
                plain "Docs proudly built with basemate:"
              end
              link path: @github_link, text: "Source Code", target: "_blank", class: "header__link"
            end
          end
        end
      }
    end

    def side_navigation
      partial {
        div class: "mdl-layout__drawer" do
          span class: "mdl-layout-title header__logo" do
            link path: :root_path do
              img class: "header__logo", path: "basemate-logo-black.png", alt: "Basemate"
            end
          end
          nav class: "mdl-navigation" do
            transition path: :start_path, text: "Start", class: "mdl-navigation__link"
            transition path: :motivation_path, text: "Why basemate?", class: "mdl-navigation__link"
            transition path: :setup_sprockets_path, text: "Setup with Sprockets", class: "mdl-navigation__link"
            transition path: :setup_webpacker_path, text: "Setup with Webpacker", class: "mdl-navigation__link"
            transition path: :page_usage_path, text: "Page Usage", class: "mdl-navigation__link"
            transition path: :app_usage_path, text: "App Usage", class: "mdl-navigation__link"
            transition path: :component_usage_path, text: "Component Usage", class: "mdl-navigation__link"
          end
        end
      }
    end

    def main_content
      partial {
        main class: "mdl-layout__content" do
          div do
            row no_spacing: true do
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
