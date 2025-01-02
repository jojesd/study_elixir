 # Módulo responsável pelo cálculo de distâncias
  defmodule DistanceCalculator do
    # Função para ler números de um arquivo e separar as colunas
    def read_numbers_from_file(file_path) do
      file_path
      |> File.read!()
      |> String.split("\n")
      |> Enum.reduce({[], []}, fn line, {list_a, list_b} ->
        case String.split(line, ",") do
          [col_a, col_b] ->
            { [String.to_integer(String.trim(col_a)) | list_a], [String.to_integer(String.trim(col_b)) | list_b] }
          _ -> {list_a, list_b}
        end
      end)
    end

    # Função para calcular a distância total entre duas listas de números
    def calculate_total_distance(list_a, list_b) do
      sorted_a = Enum.sort(list_a)
      sorted_b = Enum.sort(list_b)

      Enum.zip(sorted_a, sorted_b)
      |> Enum.map(&calculate_distance/1)
      |> Enum.sum()
    end

    defp calculate_distance({a, b}), do: abs(a - b)
  end

  defmodule DistanceExample do
    def calculate_distance_example(file_path) do
      {list_a, list_b} = DistanceCalculator.read_numbers_from_file(file_path)

      IO.puts("Lista A: #{inspect(list_a)}")
      IO.puts("Lista B: #{inspect(list_b)}")

      total_distance = DistanceCalculator.calculate_total_distance(list_a, list_b)
      IO.puts("Distância total: #{total_distance}")
    end
  end
