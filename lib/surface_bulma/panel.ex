defmodule SurfaceBulma.Panel do
  use Surface.Component

  @doc "Text inside the panel header"
  prop heading, :string, default: nil

  @doc "The color of the tag"
  prop color, :string, values: ~w(black dark light white primary link info success warning danger)

  @doc "Panel content goes here."
  slot default, required: true

  def render(assigns) do
    ~F"""
      <nav class={"panel", "is-#{@color}": @color}>
        <p class="panel-heading" :if={@heading}>
          {@heading}
        </p>
        <#slot />
      </nav>
    """
  end
end
