defmodule SurfaceBulmaComponents.Panel.Block do
  use Surface.Component

  alias SurfaceFontAwesome.Icon, as: FA

  prop label, :string

  prop icon, :string

  prop link_to, :any

  prop active, :boolean, default: false

  slot default

  def render(%{link_to: link} = assigns) when is_binary(link) do
    ~F"""
      <a class={"panel-block", "is-active": @active} href={@link_to}>
        <#slot>
          <div :if={@icon} class="panel-icon">
            <FA icon={@icon}/>
          </div>
          {@label}
        </#slot>
      </a>
    """
  end

  def render(assigns) do
    ~F"""
      <div class={"panel-block", "is-active": @active}>
        <#slot>
          <div :if={@icon} class="panel-icon">
            <FA icon={@icon}/>
          </div>
          {@label}
        </#slot>
      </div>
    """
  end
end
