defmodule SurfaceBulma.Dropdown do
  @moduledoc """
  An interactive *dropdown menu* for discoverable content
  """
  use Surface.Component
  alias SurfaceBulma.Button
  alias SurfaceBulma.Icon.FontAwesome, as: FA

  @doc "the dropdown will be shown all the time, managed by parent"
  prop active, :boolean, default: false

  @doc "the dropdown will shop up when *hovering* the trigger"
  prop hoverable, :boolean, default: false

  @doc "the label shown on the trigger button"
  prop label, :string

  @doc "triggered is fired when the default trigger button is clicked"
  prop triggered, :event

  @doc "override the default trigger button"
  slot trigger

  @doc "the content of the dropdown menu"
  slot default

  def render(assigns) do
    ~F"""
    <div class={"dropdown", "is-active": @active, "is-hoverable": @hoverable}>
      <div class="dropdown-trigger">
        <#slot name="trigger">
          <Button opts={"aria-haspopup": true} click={@triggered}>
            <span>{@label}</span>
            <FA icon="angle-down" />
          </Button>
        </#slot>
      </div>
      <div class="dropdown-menu" role="menu">
        <div class="dropdown-content">
          <#slot />
        </div>
      </div>
    </div>
    """
  end
end
