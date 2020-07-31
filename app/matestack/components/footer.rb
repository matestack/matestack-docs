class  Components::Footer < Matestack::Ui::StaticComponent

  def response
    footer class: 'footer' do
      div class: 'container' do
        div class: 'row' do
          div class: 'col-md-12 text-center' do
            paragraph do
              plain 'Released under the '
              link path: 'https://opensource.org/licenses/MIT', text: 'MIT License'
            end
            paragraph text: "© #{Time.now.year} Matestack GmbH"
            paragraph do
              link path: 'https://matestack.io/imprint', text: 'Privacy & Legal'
              plain ' | '
              link path: 'https://matestack.io#sponsor', text: 'Support'
            end
          end
        end
      end
    end
  end

end
