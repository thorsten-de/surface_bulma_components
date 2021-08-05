defmodule SurfaceBulma.Modal do
  use Surface.LiveComponent

  prop visible, :boolean, default: false

  prop show_close, :boolean, default: false

  prop close, :event, default: "hide"

  slot default

  def render(assigns) do
    ~F"""
    <div class={"modal", "is-active": @visible}  :on-window-keydown={@close} phx-key="escape">
      <div class="modal-background" :on-capture-click={@close}></div>
      <#slot />
      <button :if={@show_close} class="modal-close is-large" aria-label="close" :on-click={@close}></button>
    </div>
    """
  end

  def handle_event("hide", _params, socket) do
    {:noreply, assign(socket, :visible, false)}
  end

  # Public API
  def show(id) do
    send_update(__MODULE__, id: id, visible: true)
  end

  def hide(id) do
    send_update(__MODULE__, id: id, visible: false)
  end
end
