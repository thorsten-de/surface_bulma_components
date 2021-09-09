defmodule SurfaceBulmaComponents.MixProject do
  use Mix.Project

  def project do
    [
      app: :surface_bulma_components,
      description: "More Surface components based on Bulma",
      version: "0.1.0",
      elixir: "~> 1.12",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix] ++ Mix.compilers(),
      aliases: aliases(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp aliases do
    [
      dev: "run --no-halt dev.exs"
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:dev), do: ["lib"] ++ catalogues()
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  def catalogues do
    [
      "deps/surface_bulma/priv/catalogue",
      "deps/surface/priv/catalogue",
      "priv/catalogue"
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:floki, "~> 0.25.0", only: :test},
      {:jason, "~> 1.0"},
      # {:surface_catalogue, "~> 0.1.0", only: [:dev, :test]},
      # {:mime, "~> 1.6"},
      {:surface, github: "surface-ui/surface", override: true},
      {:surface_bulma, github: "surface-ui/surface_bulma"},
      {:surface_font_awesome, "~> 0.2.0"},
      {:surface_formatter, "~> 0.5.1"}
    ]
  end
end
