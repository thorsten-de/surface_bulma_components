defmodule SurfaceBulma.Title do
  @moduledoc """
  A simple Heading
  """
  use Surface.Component

  @doc """
  The Label of the title, if no slot is used
  """
  prop label, :string

  prop size, :integer

  slot default

  def render(assigns) do
    ~F"""
    <p class={"title", "is-#{@size}": @size}>
      <#slot>
        {@label}
      </#slot>
    </p>
    """
  end
end
