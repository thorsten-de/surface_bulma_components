defmodule SurfaceBulma.Dropdown.Divider do
  @moduledoc """
  a *horizontal line* to seperate dropdown items
  """
  use Surface.Component

  def render(assigns) do
    ~F"""
      <hr class="dropdown-divider">
    """
  end
end
