module ApplicationHelper
  def render_category_tree(tree)
    content_tag(:ul, class: "menu-list") do
      tree.map do |c, h|
        concat(
          content_tag(:li) do
            content_tag(:a, c.name, href: category_path(c))
          end
        )

        if h.present?
          concat(
            content_tag(:li) do
              render_category_tree(h)
            end
          ) 
        end
      end
    end
  end
end
