defmodule StudyElixir do
  @moduledoc """
  Funcionalidades de saudações, loops e informações do sistema, incluindo geolocalização.
  """

  def hello, do: "Bem-vindo ao mundo Elixir!"

  def greet(name), do: "Olá, #{name}! Tudo bem?"

  def loop_par_impar do
    Enum.each(1..10, &IO.puts(if rem(&1, 2) == 0, do: "par", else: &1))
  end

  def system_info do
    location = get_location()
    %{
      location: location,
      time: DateTime.utc_now() |> DateTime.to_string(),
      os: :os.type() |> Tuple.to_list() |> Enum.join(" ")
    }
  end

  defp get_location do
    url = "http://ip-api.com/json"

    case HTTPoison.get(url) do
      {:ok, response} ->
        case Jason.decode(response.body) do
          {:ok, data} ->
            "#{data["city"]}, #{data["regionName"]}, #{data["country"]}"

          {:error, _reason} -> "Não foi possível obter a localização"
        end

      {:error, _reason} -> "Não foi possível obter a localização"
    end
  end
end
