module Components::Registry

  Matestack::Ui::Core::Component::Registry.register_components(
    docs_footer: Components::Footer,
    docs_header: Components::Header,
    docs_sidebar: Components::Sidebar,
    docs_md: Components::Md,
    toc: Components::Toc::Toc
  )

end
