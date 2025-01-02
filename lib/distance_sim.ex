defmodule SimilarityCalculator do

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

  def calculate_similarity_score(list_a, list_b) do
    Enum.reduce(list_a, 0, fn number, score ->
      occurrences = Enum.count(list_b, fn x -> x == number end)
      score + (number * occurrences)
    end)
  end
end

defmodule SimilarityExample do
  def calculate_similarity_example(file_path) do
    {list_a, list_b} = SimilarityCalculator.read_numbers_from_file(file_path)

    IO.puts("Lista A: #{inspect(list_a)}")
    IO.puts("Lista B: #{inspect(list_b)}")

    similarity_score = SimilarityCalculator.calculate_similarity_score(list_a, list_b)
    IO.puts("Pontuação de similaridade total: #{similarity_score}")
  end
end
