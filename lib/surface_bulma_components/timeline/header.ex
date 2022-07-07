defmodule SurfaceBulmaComponents.Timeline.Header do
  use Surface.Component

  slot default

  def render(assigns) do
    ~F"""
    <div class="timeline-header">
      <#slot />
    </div>
    """
  end
end
