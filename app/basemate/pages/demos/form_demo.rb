module Pages
  module Demos
    class FormDemo < Page::Cell::Page

      def prepare
        @users = DemoUser.all
      end

      def response
        components {
          div class: "page-heading" do
            row do
              col desktop: 8, offset: { desktop: 2} do
                div class: "page-content" do
                  heading size: 2, text: "Form Demo"
                  heading size: 5, text: "Handle user input dynamically without JavaScript"
                end
              end
            end
          end
          row do
            col desktop: 8, offset: { desktop: 2} do
              div class: "demo" do
                partial :demo_part
              end
            end
          end
          row do
            col desktop: 8, offset: { desktop: 2} do
              md path: "markdown/demos/form_demo"
            end
          end
        }
      end

      def demo_part
        partial {
          row do
            col do
              heading size: 4, text: "Demo"
            end
          end
          row do
            col desktop: 6 do
              form for: :user, path: :create_demo_user_path, method: :post, success: { users: :rerender } do
                input type: :text, key: :name
                input type: :text, key: :age
                submit type: :button, text: "create"
              end
            end
            col desktop: 6, dynamic: true, id: "users" do
              @users.each do |user|
                partial :user_row, user
              end
            end
          end
        }
      end

      def user_row user
        partial {
          div class: "mdl-grid" do
            div class: "mdl-cell" do
              plain user.name
            end
            div class: "mdl-cell" do
              action action_config(user)
            end
          end
        }
      end

      def action_config(user_id)
        {
          type: "link",
          text: "delete",
          path: "delete_demo_user_path",
          params: { id: user_id },
          method: "delete",
          success: { users: "rerender" }
        }
      end

    end

  end
end
