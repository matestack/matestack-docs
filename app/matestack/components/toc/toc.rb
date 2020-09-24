class Components::Toc::Toc < Matestack::Ui::VueJsComponent

  vue_js_component_name "components-toc"

  def response
    div class: "components-toc" do
      div id: "toc"
    end
  end

end
