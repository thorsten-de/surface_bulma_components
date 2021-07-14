defmodule Surface.Components.Dynamic do
  @moduledoc """
  A Component for rendering a dynamically defined component
  """
  use Surface.Component

  @doc """
  The component to be rendered
  """
  prop component, :module, required: true

  @doc """
  Properties passed to the rendered component
  """
  prop props, :map, default: %{}

  def render(assigns) do
    props =
      assigns
      |> Map.get(:props)
      |> Map.merge(%{__surface__: %{groups: %{__default__: %{binding: false, size: 0}}}})

    ~F"""
    { live_component(@component, props) }
    """
  end
end
