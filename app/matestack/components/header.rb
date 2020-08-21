class  Components::Header < Matestack::Ui::DynamicComponent

  def response
    header do
      nav id: 'custom-shared-navbar', class: 'navbar navbar-expand-md fixed-top navbar-light bg-white my-0 pb-0' do
        button class: 'navbar-toggler', type: 'button', attributes: {"v-bind:class": "{ \"expanded-toggler\": open }", "@click": "sidebarToggle"} do
          img path: 'menu/arrow.svg', class: 'left-closed'
        end
        link class: 'navbar-brand my-0 p-0', path: :root_path do
          img alt: 'matestack high quality software, simply delivered', path: 'logo/matestack_logo_orange.png', class: 'd-none d-sm-block'
          img alt: 'matestack high quality software, simply delivered', path: 'logo/matestack_logo_symbol.png', class: 'symbol d-block d-sm-none'
        end
        button class: 'navbar-toggler', type: 'button', attributes: {"v-bind:class": "{ \"expanded-toggler\": expanded }", "@click": "expanded = !expanded"} do
          img path: 'menu/burger.svg', class: 'right-closed'
          img path: 'menu/close.svg', class: 'right-open'
        end
        div id: 'navbarSupportedContent', class: 'collapse navbar-collapse', attributes: {"v-bind:class": "{ \"show\": expanded }"} do
          ul class: 'navbar-nav nav-pills ml-auto align-items-center' do
            li class: 'nav-item' do
              transition class: "nav-link #{active_class(:guides)}",
              path: :guides_path,
              params: { key: 'README.md' },
              text: 'Guides'.upcase
            end
            li class: 'nav-item' do
              transition class: "nav-link #{active_class(:components)}",
              path: :api_path,
              params: { key: 'README.md' },
              text: 'Api'.upcase
            end
            li class: 'nav-item' do
              transition class: "nav-link #{active_class(:spec)}",
              path: :spec_path,
              params: { key: 'usage/README.md' },
              text: 'Specs'.upcase
            end
            # TODO: Add button links for "sponsor"/"book us"
          end
        end
      end
      docs_sidebar currentPage: context[:request].fullpath
    end
  end

  private

  def active_class(param)
    current_path = context[:request].fullpath
    case param
    when :api
      return 'active' if current_path.starts_with?('/api') && !current_path.starts_with?('/api/components')
    when :guides
      return 'active' if current_path.starts_with?('/guides')
    when :spec
      return 'active' if current_path.starts_with?('/spec')
    else
      return nil
    end
  end

end
