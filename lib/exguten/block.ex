defmodule Exguten.Block do
  def block(pid, sample, x, y, measure, ptsize, leading, nlines, justification, tagmap) when is_binary(sample) do
    :ok = :eg_block.block(pid, String.to_char_list(sample), x, y, measure, ptsize, leading, nlines, justification, tagmap)
    pid
  end

  def block(pid, sample, x, y, measure, ptsize, leading, nlines, justification, tagmap) do
    :ok = :eg_block.block(pid, sample, x, y, measure, ptsize, leading, nlines, justification, tagmap)
    pid

  end
end
