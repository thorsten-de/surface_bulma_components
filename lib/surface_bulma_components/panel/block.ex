defmodule SurfaceBulmaComponents.Panel.Block do
  use Surface.Component

  alias Surface.Components.LiveRedirect
  alias SurfaceFontAwesome.Icon, as: FA

  prop label, :string

  prop icon, :string

  prop link_to, :any

  prop active, :boolean, default: false

  prop class, :css_class, default: []

  slot default

  def render(%{link_to: link} = assigns) when is_binary(link) do
    ~F"""
    <LiveRedirect class={"panel-block", @class, "is-active": @active} to={@link_to}>
      <#slot>
        <div :if={@icon} class="panel-icon">
          <FA icon={@icon} />
        </div>
        {@label}
      </#slot>
    </LiveRedirect>
    """
  end

  def render(assigns) do
    ~F"""
    <div class={"panel-block", @class, "is-active": @active}>
      <#slot>
        <div :if={@icon} class="panel-icon">
          <FA icon={@icon} />
        </div>
        {@label}
      </#slot>
    </div>
    """
  end
end
