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
              img class: "header__logo", path: "matestack_logo.png", alt: "Matestack"
            end
          end
          div class: "mdl-layout-spacer"
          nav class: "mdl-navigation mdl-layout--large-screen-only" do
            link path: :root_path, class: "header__link #{active_class(:docs)}" do
              button class: "mdl-button mdl-js-button mdl-button--basemate-header", text: "docs"
            end
            link path: :components_path, params: { key: "README.md" }, class: "header__link #{active_class(:components)}" do
              button class: "mdl-button mdl-js-button mdl-button--basemate-header", text: "components"
            end
            link path: :guides_path, params: { key: "README.md" }, class: "header__link #{active_class(:guides)}" do
              button class: "mdl-button mdl-js-button mdl-button--basemate-header", text: "guides"
            end
            link path: :spec_path, params: { key: "usage/README.md" }, class: "header__link #{active_class(:spec)}" do
              button class: "mdl-button mdl-js-button mdl-button--basemate-header", text: "specs"
            end
          end
        end
      end
    }
  end

  def active_class(app)
    current_path = context[:request].fullpath
    case app
    when :docs
      if current_path.starts_with?("/docs") && !current_path.starts_with?("/docs/components")
        return "active"
      end
    when :components
      if current_path.starts_with?("/docs/components")
        return "active"
      end
    when :guides
      if current_path.starts_with?("/guides")
        return "active"
      end
    when :spec
      if current_path.starts_with?("/spec")
        return "active"
      end
    else
      return nil
    end
  end

end
