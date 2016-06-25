defmodule Exguten.PDFLib do
  def moveAndShow(pid, x, y, text) when is_binary(text) do
    :ok = :eg_pdf_lib.moveAndShow(pid, x, y, :erlang.binary_to_list(text))
    pid
  end

  def moveAndShow(pid, x, y, text) when is_binary(text) do
    :ok = :eg_pdf_lib.moveAndShow(pid, x, y, text)
    pid
  end

  def moveAndShow(pid, x, y, text, scale) when is_binary(text) do
    :ok = :eg_pdf_lib.moveAndShow(pid, x, y, :erlang.binary_to_list(text), scale)
    pid
  end

  def moveAndShow(pid, x, y, text, scale) do
    :ok = :eg_pdf_lib.moveAndShow(pid, x, y, text, scale)
    pid
  end
end
