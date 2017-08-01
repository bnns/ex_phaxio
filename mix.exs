defmodule ExPhaxio.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex_phaxio,
      name: "ExPhaxio",
      source_url: "https://github.com/bnns/ex_phaxio",
      description: "A simple Phaxio client.",
      version: "0.2.1",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger, :httpoison, :poison]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 0.12"},
      {:poison, "~> 3.1"},
      {:credo, "~> 0.8.4", only: [:dev, :test]},
      {:ex_doc, ">= 0.0.0", only: [:dev, :test]},
    ]
  end

  defp docs do
    [
      readme: "README.md",
      main: ExPhaxio
    ]
  end

  defp package do
    [
      name: :ex_phaxio,
      maintainers: ["Dennis Yao"],
      licenses: ["Apache 2.0"],
      links: %{"Github" => "https://github.com/bnns/ex_phaxio"}
    ]
  end
end
