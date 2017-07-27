defmodule ExPhaxio.Mixfile do
  use Mix.Project

  def project do
    [
      app: :ex_phaxio,
      name: "ExPhaxio",
      source_url: "https://github.com/bnns/ex_phaxio",
      description: "A simple Phaxio client.",
      version: "0.1.0",
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
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/bnns/ex_phaxio"}
    ]
  end
end