defmodule Exguten.PDF do
  def new do
    :eg_pdf.new
  end

  def set_pagesize(pid, size) do
    :ok = :eg_pdf.set_pagesize(pid, size)
    pid
  end

  def set_page(pid, page_no) do
    :ok = :eg_pdf.set_page(pid, page_no)
    pid
  end

  def set_dash(pid, options) do
    :ok = :eg_pdf.set_dash(pid, options)
    pid
  end

  def set_stroke_gray(pid, width) do
    :ok = :eg_pdf.set_stroke_gray(pid, width)
    pid
  end

  def set_stroke_color(pid, color) do
    :ok = :eg_pdf.set_stroke_color(pid, color)
    pid
  end

  def set_line_width(pid, width) do
    :ok = :eg_pdf.set_line_width(pid, width)
    pid
  end

  def round_rect(pid, x, y, width) do
    :ok = :eg_pdf.round_rect(pid, x, y, width)
    pid
  end

  def round_top_rect(pid, x, y, width) do
    :ok = :eg_pdf.round_top_rect(pid, x, y, width)
    pid
  end

  def rectangle(pid, x, y) do
    :ok = :eg_pdf.rectangle(pid, x, y)
    pid
  end

  def rectangle(pid, x, y, stroke_type) do
    :ok = :eg_pdf.rectangle(pid, x, y, stroke_type)
    pid
  end

  def rectangle(pid, x1, y1, x2, y2) do
    :ok = :eg_pdf.rectangle(pid, x1, y1, x2, y2)
    pid
  end

  def rectangle(pid, x1, y1, x2, y2, stroke_type) do
    :ok = :eg_pdf.rectangle(pid, x1, y1, x2, y2, stroke_type)
    pid
  end

  def path(pid, type) do
    :ok = :eg_pdf.path(pid, type)
    pid
  end

  def set_font(pid, font, size) when is_binary(font) do
    :ok = :eg_pdf.set_font(pid, String.to_char_list(font), size)
    pid
  end

  def set_font(pid, font, size) do
    :ok = :eg_pdf.set_font(pid, font, size)
    pid
  end

  def line(pid, x1, y1, x2, y2) do
    :ok = :eg_pdf.line(pid, x1, y1, x2, y2)
    pid
  end

  def image(pid, image, xy, options \\ {}) do
    :ok = :eg_pdf.image(pid, image, xy, options)
    pid
  end

  def set_fill_gray(pid, gray) do
    :ok = :eg_pdf.set_fill_gray(pid, gray)
    pid
  end

  def set_fill_color(pid, color) do
    :ok = :eg_pdf.set_fill_color(pid, color)
    pid
  end

  def get_string_width(pid, fontname, ptsize, text) when is_binary fontname do
    get_string_width(pid, String.to_char_list(fontname), ptsize, text)
  end

  def get_string_width(pid, fontname, ptsize, text) when is_binary text do
    get_string_width(pid, fontname, ptsize, String.to_char_list(text))
  end

  def get_string_width(pid, fontname, ptsize, text)  do
    :eg_pdf.get_string_width(pid, fontname, ptsize, text)
  end

  def save_state(pid) do
    :ok = :eg_pdf.save_state(pid)
    pid
  end

  def restore_state(pid) do
    :ok = :eg_pdf.restore_state(pid)
    pid
  end

  def new_page(pid) do
    :eg_pdf.new_page(pid)
    pid
  end

  def export(pid) do
    :eg_pdf.export(pid)
  end

  def export(pid, filename) do
    { serialized, _pageno } = export(pid)
    File.write(filename, serialized, [:binary])
    pid
  end

  def stop(pid) do
    :eg_pdf.delete(pid)
  end

end
