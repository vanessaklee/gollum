defmodule Gollum.Mixfile do
  use Mix.Project

  def project do
    [
      app: :gollum,
      version: "0.3.3",
      elixir: "~> 1.5",
      elixirc_paths: elixirc_paths(Mix.env),
      start_permanent: Mix.env == :prod,
      deps: deps(),
      package: package(),
    ]
  end

  def application do
    [
      mod: {Gollum.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Specifies which files to compile per environment
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  defp deps do
    [
      {:httpoison, "~> 1.0", [env: :prod, hex: "httpoison", repo: "hexpm", optional: false]}
    ]
  end

  defp package do
    [
      description: "Robots.txt parser with caching. Modelled after Kryten.",
      maintainers: ["Ravern Koh"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/ravernkoh/gollum"},
    ]
  end
end
