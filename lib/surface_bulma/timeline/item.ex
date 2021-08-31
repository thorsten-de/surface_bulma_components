defmodule SurfaceBulma.Timeline.Item do
  use Surface.Component

  prop heading, :string

  slot default

  slot marker

  prop marker_text, :string

  def render(assigns) do
    ~F"""
      <div class="timeline-item">
        <#slot name="marker">
          <div class="timeline-marker">{@marker_text}</div>
        </#slot>
        <div class="timeline-content">
          <p :if={@heading} class="heading">{@heading}</p>
          <#slot />
        </div>
      </div>
    """
  end
end
