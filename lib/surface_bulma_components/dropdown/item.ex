defmodule SurfaceBulmaComponents.Dropdown.Item do
  @moduledoc """
  A single item in the dropdown, either a _div_ (default) or an _a_-element,
  if *to* is given
  """
  use Surface.Component
  alias Surface.Components.LiveRedirect

  @doc "the label of the item, if default slot is not used"
  prop label, :string

  @doc "the reference this item is linked to. If present, the div turns into an a."
  prop to, :string

  @doc "the css class of the item, defaults to 'dropdown-item'"
  prop class, :css_class, default: "dropdown-item"

  @doc "is this item active?"
  prop active, :boolean, default: false

  slot default

  # render a div, when no href is given
  def render(%{to: to} = assigns) when is_binary(to) do
    ~F"""
    <LiveRedirect to={@to} class={@class, "is-active": @active}>
      <#slot>{@label}</#slot>
    </LiveRedirect>
    """
  end

  # render a link, when a href is given
  def render(assigns) do
    ~F"""
    <div class={@class, "is-active": @active}>
      <#slot>{@label}</#slot>
    </div>
    """
  end
end
