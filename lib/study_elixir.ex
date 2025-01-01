defmodule StudyElixir do
  @moduledoc """
  Funcionalidades de saudações, loops e informações do sistema.
  """

  def hello, do: "Bem-vindo ao mundo Elixir!"

  def greet(name), do: "Olá, #{name}! Tudo bem?"

  def loop_par_impar, do: Enum.each(1..10, &IO.puts(if rem(&1, 2) == 0, do: "par", else: &1))

  def system_info do
    %{
      location: "Desconhecido",
      time: DateTime.utc_now() |> DateTime.to_string(),
      os: :os.type() |> Tuple.to_list() |> Enum.join(" ")
    }
  end
end
