defmodule SurfaceBulma.Form.ControlField do
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

  @doc """
  The content for the field
  """
  slot default, required: true

  def render(assigns) do
    form = assigns[:form] || assigns.__context__[{Form, :form}]
    has_errors = Keyword.has_key?(form.errors, assigns.name)

    ~F"""
    <Field {=@name} class={"field", "has-errors": has_errors}>
      <ErrorTag class="help is-pulled-right" />
      <Label text={@label} />
      <div>
        <#slot />
      </div>
    </Field>
    """
  end
end
