defmodule SurfaceBulma.Timeline do
  use Surface.Component

  prop centered, :boolean, default: false

  prop marker_text, :string
  slot default

  def render(assigns) do
    ~F"""
      <div class={"timeline", "is-centered": @centered}>
        <#slot />
      </div>
    """
  end
end
