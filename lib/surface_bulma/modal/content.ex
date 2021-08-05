defmodule SurfaceBulma.Modal.Content do
  use Surface.Component

  slot default, required: true

  def render(assigns) do
    ~F"""
    <div class="modal-content">
      <#slot />
    </div>
    """
  end
end
