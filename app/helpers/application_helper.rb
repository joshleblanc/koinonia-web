module ApplicationHelper
  def themes
    [
          "light",
          "dark",
          "cupcake",
          "bumblebee",
          "emerald",
          "corporate",
          "synthwave",
          "retro",
          "cyberpunk",
          "valentine",
          "halloween",
          "garden",
          "forest",
          "aqua",
          "lofi",
          "pastel",
          "fantasy",
          "wireframe",
          "black",
          "luxury",
          "dracula",
          "cmyk",
          "autumn",
          "business",
          "acid",
          "lemonade",
          "night",
          "coffee",
          "winter",
          "dim",
          "nord",
          "sunset",
        ]
  end

  def link_to(name = nil, options = nil, html_options = nil, &block)
    super(name, options, { class: "btn btn-accent" }.merge(html_options || {}), &block)
  end

  def route_parts(options)
    # Check if the resource's class has a shallow route defined
    shallow_routes = Rails.application.routes.routes.select do |route|
      route.defaults[:controller] == resource.class.name.underscore.pluralize
    end

    shallow_routes.any? do |route|
      route.path.spec.to_s.exclude?(":#{resource.class.name.foreign_key}")
    end
  end
end
