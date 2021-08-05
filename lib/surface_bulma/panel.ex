defmodule SurfaceBulma.Panel do
  use Surface.Component

  @doc "Text inside the panel header"
  prop title, :string, default: nil

  @doc "The color of the tag"
  prop color, :string, values: ~w(black dark light white primary link info success warning danger)

  @doc "Panel content goes here."
  slot default, required: true

  slot header

  def render(assigns) do
    ~F"""
      <nav class={"panel", "is-#{@color}": @color}>
        <header class="panel-heading" :if={@title || slot_assigned?(:header) }>
          <#slot name="header">
            {@title}
          </#slot>
        </header>
        <#slot />
      </nav>
    """
  end
end
