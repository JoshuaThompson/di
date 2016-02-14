defmodule Di.Mixfile do
  use Mix.Project

  def project do
    [app: :di,
     version: "0.1.0",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :httpoison]]
  end

  defp deps do
    [{:httpoison, "~> 0.8.0"},
     {:poison, "~> 2.0"}]
  end

  defp description do
   """
   Elixir wrapper for DI.FM
   """
  end

  defp package do
    [
      files: ["lib", "priv", "mix.exs", "README*", "readme", "LICENSE*", "license*"],
      maintainers: ["Joshua Thompson"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/JoshuaThompson/di"}
    ]
  end
end
