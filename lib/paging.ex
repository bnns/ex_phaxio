defmodule ExPhaxio.Resources.Paging do

  @max_per_page 1000
  @min_page 1

  def append_per_page(url, per_page) when per_page <= @max_per_page do
    url <> "?per_page=#{per_page}"
  end

  def append_page(url, page) when page >= @min_page do
    url <> "?page=#{page}"
  end
end
