defmodule FredClient.MixProject do
  use Mix.Project

  @version "0.1.0"
  @description "An Elixir-based HTTP Client for FRED (Federal Reserve Economic Data) API"

  def project do
    [
      app: :fred_client,
      version: @version,
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      description: @description,
      deps: deps(),
      package: package()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :req]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:req, "~> 0.3.11"},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false}
    ]
  end

  defp package do
    [
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/joeychilson/fred_client"},
      maintainers: ["Joey Chilson"]
    ]
  end
end
