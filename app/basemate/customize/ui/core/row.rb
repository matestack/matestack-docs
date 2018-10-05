module Customize::Ui::Core
  class Row

    def row_classes(classes, options)
      classes << "mdl-grid"
      classes << "mdl-grid--no-spacing" if options[:no_spacing]
    end

  end
end
