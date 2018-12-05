module Apps
  class Guides < App::Cell::App

    def prepare
      @title = "Basemate Ui Core Guides"
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
        layout_header title: @title
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
            span class: "navigation-header" do
              plain "Essentials"
            end
            partial :transition_link, :guides_path, { key: "introduction" }, "Introduction"
            partial :transition_link, :guides_path, { key: "concepts" }, "Concepts"
            partial :transition_link, :guides_path, { key: "installation" }, "Installation"
            span class: "navigation-header" do
              plain "Getting Started"
            end
            partial :transition_link, :guides_path, { key: "create_a_dynamic_ui" }, "Create a dynamic UI"
            partial :transition_link, :guides_path, { key: "create_a_dynamic_spa" }, "Create a dynamic SPA"
            partial :transition_link, :guides_path, { key: "add_ui_sugar" }, "Add UI Sugar"
            span class: "navigation-header" do
              plain "Diving Deeper"
            end
            partial :transition_link, :guides_path, { key: "custom_static_component" }, "Custom static component"
            partial :transition_link, :guides_path, { key: "custom_dynamic_component" }, "Custom dynamic component"
            partial :transition_link, :guides_path, { key: "use_websockets" }, "Use websockets"
            partial :transition_link, :guides_path, { key: "create_a_pwa" }, "Create a PWA"
            # partial :transition_link, :motivation_path, "Why basemate?"
            # partial :transition_link, :installation_path, "Installation"
            # partial :transition_link, :basic_concepts_path, "Basic Concepts"
            # partial :transition_link, :quick_start_path, "Quick Start"
            # partial :transition_link, :components_in_depth_path, "In-depth: Components"
            # partial :transition_link, :pages_in_depth_path, "In-depth: Pages"
            # partial :transition_link, :apps_in_depth_path, "In-depth: Apps"
            # partial :transition_link, :extend_path, "Extend basemate"
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
