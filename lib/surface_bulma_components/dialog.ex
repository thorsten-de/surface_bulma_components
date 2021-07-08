defmodule SurfaceBulmaComponents.Dialog do
  @moduledoc """
  A modal dialog component with working close button
  """

  use Surface.LiveComponent
  alias SurfaceBulma.Button

  @doc "visibility of modal dialog"
  data visible, :boolean, default: false

  @doc "title of this dialog"
  prop title, :string

  @doc "handler for ok button clicked"
  prop ok, :event

  @doc "handler for closing the dialog, defaults to hiding"
  prop close, :event, default: "hide"

  slot default, required: true

  def render(assigns) do
    ~F"""
    <div class={"modal", "is-active": @visible} :on-window-keydown={@close} phx-key="Escape">
      <div class="modal-background" />
      <div class="modal-card">
        <header class="modal-card-head">
          <p class="modal-card-title">{@title}</p>
        </header>
        <section class="modal-card-body">
          <#slot />
        </section>
        <footer class="modal-card-foot" style="justify-content: flex-end">
          <Button click={@ok} color="primary">Ok</Button>
          <Button click={@close} color="danger">Close</Button>
        </footer>
      </div>
    </div>
    """
  end

  def handle_event("show", _params, socket) do
    {:noreply, assign(socket, :visible, true)}
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
