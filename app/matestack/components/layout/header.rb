class Components::Layout::Header < Matestack::Ui::StaticComponent

  def prepare
    @github_link = "https://github.com/basemate"
  end

  def response
    components {
      header class: "mdl-layout__header" do
        div class: "mdl-layout__header-row" do
          span class: "mdl-layout-title header__logo" do
            link path: :root_path, class: "mobile-header__logo" do
              img class: "header__logo", path: "basemate-logo-black.png", alt: "Matestack"
            end
          end
          div class: "mdl-layout-spacer"
          nav class: "mdl-navigation mdl-layout--large-screen-only" do
            link path: :root_path, class: "header__link" do
              button class: "mdl-button mdl-js-button mdl-button--basemate-header", text: "docs"
            end
            link path: :api_docs_path, params: { key: "start" }, class: "header__link" do
              button class: "mdl-button mdl-js-button mdl-button--basemate-header", text: "api"
            end
            # link path: :demos_start_path, class: "header__link" do
            #   button class: "mdl-button mdl-js-button mdl-button--basemate-header", text: "demos"
            # end
            # link path: :templates_start_path, class: "header__link" do
            #   button class: "mdl-button mdl-js-button mdl-button--basemate-header", text: "templates"
            # end
            # link path: :plugins_start_path, class: "header__link" do
            #   button class: "mdl-button mdl-js-button mdl-button--basemate-header", text: "plugins"
            # end
          end
        end
      end
    }
  end

end
