module Apps
  class ApiDocs < Matestack::Ui::App

    def prepare
      @title = "Matestack Ui Core API"
      @github_link = "https://github.com/basemate"
      @navigation_items_structure = [
        :div, :header,
        :main, :nav, :partial, :section,
      ]
      @navigation_items_display = [
        :heading, :plain, :pg, :span, :icon, :list, :table, :br,
      ]
      @navigation_items_media = [
        :html, :img
      ]
      @navigation_items_input = [
        :form, :input, :inline_input, :submit
      ]
      @navigation_items_navigation = [
        :link, :transition
      ]
      @navigation_items_action = [
        :action
      ]
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
              img class: "header__logo", path: "basemate-logo-black.png", alt: "Matestack"
            end
          end
          nav class: "mdl-navigation" do
            span class: "navigation-header" do
              plain "Structure"
            end
            @navigation_items_structure.each do |item|
              partial :transition_link, :api_docs_path, { key: item }, item.to_s
            end
            span class: "navigation-header" do
              plain "Display"
            end
            @navigation_items_display.each do |item|
              partial :transition_link, :api_docs_path, { key: item }, item.to_s
            end
            span class: "navigation-header" do
              plain "Media"
            end
            @navigation_items_media.each do |item|
              partial :transition_link, :api_docs_path, { key: item }, item.to_s
            end
            span class: "navigation-header" do
              plain "Input"
            end
            @navigation_items_input.each do |item|
              partial :transition_link, :api_docs_path, { key: item }, item.to_s
            end
            span class: "navigation-header" do
              plain "Navigation"
            end
            @navigation_items_navigation.each do |item|
              partial :transition_link, :api_docs_path, { key: item }, item.to_s
            end
            span class: "navigation-header" do
              plain "Action"
            end
            @navigation_items_action.each do |item|
              partial :transition_link, :api_docs_path, { key: item }, item.to_s
            end

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
