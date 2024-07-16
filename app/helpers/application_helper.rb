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

  def route_for_hero(controller, action)
    Rails.application.routes.routes.select do 
      _1.defaults[:controller] == controller && _1.defaults[:action] == action
    end.first
  end

  def route_parts(controller, action)
    route = route_for_hero(controller, action)
    route&.parts&.reject { _1 == :format }
  end

  def hero_model
    instance_variable_get(:"@#{params[:controller].singularize}")
  end

  def hero_models 
    instance_variable_get(:"@#{params[:controller].pluralize}")
  end

  def hero_model_class
    hero_model.class
  end
  
  # let me be the first to say that this is hacky af
  def url_for_hero(params, action)
    controller = params[:controller]
    parts = route_parts(controller, action.to_s)
    obj = {
      controller: controller,
      action: action
    }
    parts&.each { obj[_1] = hero_model&.send(_1) || params[_1] }
    obj
  end
end
