defmodule SurfaceBulma.Modal.Card do
  use Surface.Component

  prop title, :string

  slot header
  slot footer
  slot default, required: true

  def render(assigns) do
    ~F"""
     <div class="modal-card">
        <header :if={slot_assigned?(:header)} class="modal-card-head">
          <p class="modal-card-title">
            <#slot name="header" />
          </p>
        </header>
      <section class="modal-card-body">
          <#slot />
      </section>
      <footer :if={slot_assigned?(:footer)} class="modal-card-foot" style="justify-content: flex-end">
        <#slot name="footer" />
      </footer>
      </div>
    """
  end
end
