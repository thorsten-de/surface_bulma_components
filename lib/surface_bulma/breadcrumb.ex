defmodule SurfaceBulma.Breadcrumb do
  @moduledoc """
  Simple navigation component
  """
  use Surface.Component
  alias Surface.Components.LiveRedirect

  @doc """
  List of breadcrumbs to display. Can be a list of labels or a list of maps
  """
  prop breadcrumbs, :list, required: true

  @doc """
  CSS classes that are appended to standard "breadcrumb" class
  """
  prop class, :css_class

  @doc """
  Template to be rendered inside the li for each breadcrumb defined in breadcrumbs
  """
  slot default, args: [:item]

  def render(assigns) do
    breadcrumbs =
      assigns.breadcrumbs
      |> Enum.map(fn
        crumb when is_map(crumb) -> Map.put_new(crumb, :to, "#")
        label when is_binary(label) -> %{label: label, to: "#"}
      end)

    ~F"""
    <nav class={"breadcrumb", @class} aria-label="breadcrumbs">
      <ul>
        {#for b <- breadcrumbs}
          <li class={"is-active": b[:is_active]} title={b[:title]}>
            <#slot :args={item: b}>
              <LiveRedirect to={b[:to]} label={b[:label]} opts={[]}/>
            </#slot>
          </li>
        {/for}
      </ul>
    </nav>
    """
  end
end
