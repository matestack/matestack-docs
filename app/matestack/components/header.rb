class  Components::Header < Matestack::Ui::DynamicComponent

  def response
    header do
      nav id: 'custom-shared-navbar', class: 'navbar navbar-expand-xl fixed-top navbar-light bg-white my-0 pb-0' do
        button class: 'navbar-toggler', type: 'button', attributes: {"v-bind:class": "{ \"expanded-toggler\": sidebarOpen }", "@click": "sidebarToggle"} do
          img path: 'menu/arrow.svg', class: 'left-closed'
        end
        link class: 'navbar-brand my-0 p-0', path: "https://matestack.io" do
          img alt: 'matestack high quality software, simply delivered', path: 'logo/matestack_logo_orange.png', class: 'd-none d-sm-block'
          img alt: 'matestack high quality software, simply delivered', path: 'logo/matestack_logo_symbol.png', class: 'symbol d-block d-sm-none'
        end
        button class: 'navbar-toggler', type: 'button', attributes: {"v-bind:class": "{ \"expanded-toggler\": expanded }", "@click": "expanded = !expanded"} do
          img path: 'menu/burger.svg', class: 'right-closed'
          img path: 'menu/close.svg', class: 'right-open'
        end
        div id: 'navbarSupportedContent', class: 'collapse navbar-collapse', attributes: {"v-bind:class": "{ \"show\": expanded }"} do
          ul class: 'navbar-nav nav-pills ml-auto align-items-center' do
            li class: 'nav-item hide-below-xxl' do
              span class: "nav-link intro",
              text: 'matestack-ui-core | UI in pure Ruby:'.upcase
            end
            li class: 'nav-item' do
              link class: "nav-link #{active_class(:start)}",
              path: :core_start_path,
              params: { key: 'README.md' },
              text: 'Start'.upcase
            end
            li class: 'nav-item' do
              link class: "nav-link #{active_class(:ui_components)}",
              path: :core_ui_components_path,
              params: { key: 'README.md' },
              text: 'UI components'.upcase
            end
            li class: 'nav-item' do
              link class: "nav-link #{active_class(:reactive_components)}",
              path: :core_reactive_components_path,
              params: { key: 'README.md' },
              text: 'Reactive components'.upcase
            end
            li class: 'nav-item' do
              link class: "nav-link #{active_class(:reactive_apps)}",
              path: :core_reactive_apps_path,
              params: { key: 'README.md' },
              text: 'Reactive Apps'.upcase
            end
            li class: 'nav-item' do
              link class: "nav-link #{active_class(:api)}",
              path: :core_api_path,
              params: { key: 'README.md' },
              text: 'API'.upcase
            end
            li class: 'nav-item' do
              link class: "nav-link highlight px-2 my-4 #{active_class(:components)}",
              path: "https://matestack.io/addons",
              target: "_blank",
              text: 'Bootstrap Admin Addon'.upcase
            end

            # TODO: Add button links for "sponsor"/"book us"
          end
        end
      end
    end
  end

  private

  def active_class(param)
    current_path = context[:request].fullpath
    case param
    when :start
      return 'active' if current_path.starts_with?('/docs/start')
    when :ui_components
      return 'active' if current_path.starts_with?('/docs/ui_components')
    when :reactive_components
      return 'active' if current_path.starts_with?('/docs/reactive_components')
    when :reactive_apps
      return 'active' if current_path.starts_with?('/docs/reactive_apps')
    when :api
      return 'active' if current_path.starts_with?('/docs/api')
    else
      return nil
    end
  end

end
