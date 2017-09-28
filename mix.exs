defmodule Kclex.Mixfile do
  use Mix.Project

  def project do
    [app: :kclex,
     version: "0.0.1",
     elixir: "~> 1.4",
     description: "An amazon kinesis KCL client for elixir.",
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    [
      {:exjsx, "~> 3.1.0"},
      {:inflex, "~> 1.0.0"},
      {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
      {:timex, "~> 3.1.0"},
    ]
  end
end
