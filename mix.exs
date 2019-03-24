defmodule ExPhaxio.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex_phaxio,
      name: "ExPhaxio",
      source_url: "https://github.com/bnns/ex_phaxio",
      description: "A simple Phaxio client.",
      version: "0.2.4",
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
      {:httpoison, "~> 1.5.0"},
      {:poison, ">= 3.0.0"},
      {:credo, "~> 1.0.3", only: [:dev, :test]},
      {:ex_doc, ">= 0.19.3", only: [:dev, :test]},
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
