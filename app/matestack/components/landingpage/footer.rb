class Components::Landingpage::Footer < Matestack::Ui::StaticComponent

  def response
    components {
      footer id: '', class: 'bs-footer' do
        div class: "container" do
          div class: "row" do
            div class: "col-md-8" do
              custom_landingpage_home
            end
            div class: "col-md-4" do
              paragraph do
                link path: :imprint_path, text: t('footer.imprint')
                plain '&nbsp;|&nbsp;'
                link path: :privacy_path, text: t('footer.privacy')
              end
            end
          end
        end
      end
    }
  end

end
