module Components
  module Row::Cell
    class Row < Component::Cell::Static

      def row_classes
        classes = []

        classes << options[:class]
        classes << "mdl-grid"
        classes << "mdl-grid--no-spacing" if options[:no_spacing]

        return classes.join(" ")
      end

    end
  end
end
