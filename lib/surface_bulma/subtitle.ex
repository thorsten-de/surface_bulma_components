defmodule SurfaceBulma.Subtitle do
  @moduledoc """
  A subtitle heading
  """
  use Surface.Component

  @doc """
  The Label of the subtitle, if no slot is used
  """
  prop label, :string

  prop size, :integer

  slot default

  def render(assigns) do
    ~F"""
    <p class={"subtitle", "is-#{@size}": @size}>
      <#slot>
        {@label}
      </#slot>
    </p>
    """
  end
end
