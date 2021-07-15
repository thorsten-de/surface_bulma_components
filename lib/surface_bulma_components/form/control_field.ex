defmodule SurfaceBulmaComponents.Form.ControlField do
  @moduledoc """
  combines a bulma field with  label, control and error tag into
  a form
  """
  use Surface.Component
  alias Surface.Components.Form
  alias Form.{Field, Label, ErrorTag}

  @doc "The field name"
  prop name, :atom, required: true

  @doc "The text of the label. Generated from name, if omitted"
  prop label, :string

  @doc "The CSS class for the generated `<div>` element"
  prop field_class, :css_class

  @doc "The CSS class for the internal control element"
  prop control_class, :css_class

  @doc """
  The content for the field
  """
  slot default, required: true

  def render(assigns) do
    ~F"""
      <Field {=@name} class={"field", @field_class}>
        <Label text={@label}/>
        <div class={"control", @control_class}>
          <#slot />
        </div>
        <ErrorTag />
      </Field>
    """
  end
end
