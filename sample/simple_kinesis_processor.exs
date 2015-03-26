defmodule SimpleKinesisClient do
  import Kcl.RecordProcessor

  def process_records(records) do
    Enum.each records, &(handle_record(&1))
    seq = records |> List.first |> Map.get "sequenceNumber"
    case checkpoint(seq) do
      :ok -> nil
      {:error, _} -> checkpoint(seq)
    end
  end
  def handle_record record do
    Base.decode64!(record["data"])
    |> process_record
  end
  def process_record data do
    IO.inspect data
  end
  def init_processor(_), do: nil
  def shutdown("TERMINATE"), do: checkpoint(nil)
end

Kcl.Executor.process SimpleKinesisClient