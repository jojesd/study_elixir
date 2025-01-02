defmodule StudyElixir do
  @moduledoc """
  Funcionalidades de saudações, loops e informações do sistema, incluindo geolocalização.
  """

  # Função de saudação simples
  def hello, do: "Bem-vindo ao mundo Elixir!"

  # Função de saudação personalizada
  def greet(name), do: "Olá, #{name}! Tudo bem?"

  # Função para imprimir se os números são pares ou ímpares
  def loop_par_impar do
    Enum.each(1..10, &IO.puts(if rem(&1, 2) == 0, do: "par", else: &1))
  end

  # Função para coletar informações do sistema e localização
  def system_info do
    location = get_location()
    %{
      location: location,
      time: DateTime.utc_now() |> DateTime.to_string(),
      os: :os.type() |> Tuple.to_list() |> Enum.join(" ")
    }
  end

  # Função privada para obter a localização usando a API externa
  defp get_location do
    url = "http://ip-api.com/json"

    case HTTPoison.get(url) do
      {:ok, response} ->
        case Jason.decode(response.body) do
          {:ok, %{"city" => city, "regionName" => region, "country" => country}} ->
            "#{city}, #{region}, #{country}"

          {:error, _reason} ->
            "Não foi possível obter a localização (erro ao decodificar JSON)"
        end

      {:error, _reason} ->
        "Não foi possível obter a localização (erro na requisição HTTP)"
    end
  end
end
