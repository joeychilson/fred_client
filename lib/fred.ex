defmodule FRED do
  @doc """
  Get a category from the FRED API

  ## Required

  - `category_id` The id for a category
  """
  def category(category_id),
    do: get("/fred/category", Keyword.put([], :category_id, category_id))

  @doc """
  Get a category's children from the FRED API

  ## Required

  - `category_id` The id for a category

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  """
  def category_children(category_id, opts \\ []),
    do: get("/fred/category/children", Keyword.put(opts, :category_id, category_id))

  @doc """
  Get a category's related from the FRED API

  ## Required

  - `category_id` The id for a category

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  """
  def category_related(category_id, opts \\ []),
    do: get("/fred/category/related", Keyword.put(opts, :category_id, category_id))

  @doc """
  Get a category's series from the FRED API

  ## Required

  - `category_id` The id for a category

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  - `limit` The maximum number of results to return.
  - `offset` The number of results to skip
  - `order_by` Order results by values of the specified attribute.
  - `sort_order` Sort results is ascending or descending order for attribute values specified by order_by.
  - `filter_variable` The attribute to filter results by.
  - `filter_value` The value of the filter_variable attribute to filter results by.
  - `tag_names` A semicolon delimited list of tag names that series match all of.
  - `exclude_tag_names` A semicolon delimited list of tag names that series match none of.
  """
  def category_series(category_id, opts \\ []),
    do: get("/fred/category/series", Keyword.put(opts, :category_id, category_id))

  @doc """
  Get a category's tags from the FRED API

  ## Required

  - `category_id` The id for a category

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  - `tag_names` A semicolon delimited list of tag names to only include in the response.
  - `tag_group_id` A tag group id to filter tags by type.
  - `search_text` The words to find matching tags with.
  - `limit` The maximum number of results to return.
  - `offset` The number of results to skip
  - `order_by` Order results by values of the specified attribute.
  - `sort_order` Sort results is ascending or descending order for attribute values specified by order_by.
  """
  def category_tags(category_id, opts \\ []),
    do: get("fred/category/tags", Keyword.put(opts, :category_id, category_id))

  @doc """
  Get a category's related tags from the FRED API

  ## Required

  - `category_id` The id for a category
  - `tag_names` A semicolon delimited list of tag names to only include in the response.

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  - `tag_group_id` A tag group id to filter tags by type.
  - `search_text` The words to find matching tags with.
  - `limit` The maximum number of results to return.
  - `offset` The number of results to skip
  - `order_by` Order results by values of the specified attribute.
  - `sort_order` Sort results is ascending or descending order for attribute values specified by order_by.
  """
  def category_related_tags(id, tag_names, opts \\ []) do
    params =
      Keyword.new([
        {:category_id, id},
        {:tag_names, tag_names}
      ])
      |> Keyword.merge(opts)

    get("/fred/category/related_tags", params)
  end

  @doc """
  Get all releases of economic data.

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  - `limit` The maximum number of results to return.
  - `offset` The number of results to skip
  - `order_by` Order results by values of the specified attribute.
  - `sort_order` Sort results is ascending or descending order for attribute values specified by order_by.
  """
  def releases(opts \\ []), do: get("/fred/releases", opts)

  @doc """
  Get release dates for all releases of economic data.

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  - `limit` The maximum number of results to return.
  - `offset` The number of results to skip
  - `order_by` Order results by values of the specified attribute.
  - `sort_order` Sort results is ascending or descending order for attribute values specified by order_by.
  - `include_release_dates_with_no_data` Determines whether release dates with no data available are returned.
  """
  def releases_dates(opts \\ []), do: get("/fred/releases/dates", opts)

  @doc """
  Get a release of economic data.

  ## Required

  - `release_id` The id for a release

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  """
  def release(release_id, opts \\ []),
    do: get("/fred/release", Keyword.put(opts, :release_id, release_id))

  @doc """
  Get release dates for a release of economic data.

  ## Required

  - `release_id` The id for a release

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  - `limit` The maximum number of results to return.
  - `offset` The number of results to skip
  - `order_by` Order results by values of the specified attribute.
  - `sort_order` Sort results is ascending or descending order for attribute values specified by order_by.
  - `include_release_dates_with_no_data` Determines whether release dates with no data available are returned.
  """
  def release_dates(release_id, opts \\ []),
    do: get("/fred/release/dates", Keyword.put(opts, :release_id, release_id))

  @doc """
  Get the series on a release of economic data.

  ## Required

  - `release_id` The id for a release

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  - `limit` The maximum number of results to return.
  - `offset` The number of results to skip
  - `order_by` Order results by values of the specified attribute.
  - `sort_order` Sort results is ascending or descending order for attribute values specified by order_by.
  - `filter_variable` The attribute to filter results by.
  - `filter_value` The value of the filter_variable attribute to filter results by.
  - `tag_names` A semicolon delimited list of tag names that series match all of.
  - `exclude_tag_names` A semicolon delimited list of tag names that series match none of.
  """
  def release_series(release_id, opts \\ []),
    do: get("/fred/release/series", Keyword.put(opts, :release_id, release_id))

  @doc """
  Get the sources for a release of economic data.

  ## Required

  - `release_id` The id for a release

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  """
  def release_sources(release_id, opts \\ []),
    do: get("/fred/release/sources", Keyword.put(opts, :release_id, release_id))

  @doc """
  Get the tags for a release of economic data.

  ## Required

  - `release_id` The id for a release

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  - `tag_group_id` A tag group id to filter tags by type.
  - `search_text` The words to find matching tags with.
  - `limit` The maximum number of results to return.
  - `offset` The number of results to skip
  - `order_by` Order results by values of the specified attribute.
  - `sort_order` Sort results is ascending or descending order for attribute values specified by order_by.
  """
  def release_tags(release_id, opts \\ []),
    do: get("/fred/release/tags", Keyword.put(opts, :release_id, release_id))

  @doc """
  Get the related tags for one or more FRED tags within a release of economic data.

  ## Required

  - `category_id` The id for a category
  - `tag_names` A semicolon delimited list of tag names to only include in the response.

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  - `tag_group_id` A tag group id to filter tags by type.
  - `search_text` The words to find matching tags with.
  - `limit` The maximum number of results to return.
  - `offset` The number of results to skip
  - `order_by` Order results by values of the specified attribute.
  - `sort_order` Sort results is ascending or descending order for attribute values specified by order_by.
  """
  def release_related_tags(release_id, tag_names, opts \\ []) do
    params =
      Keyword.new([
        {:release_id, release_id},
        {:tag_names, tag_names}
      ])
      |> Keyword.merge(opts)

    get("/fred/release/related_tags", params)
  end

  @doc """
  Get release table trees for a given release.

  ## Required

  - `release_id` The id for a release

  ## Optional

  - `element_id` The id for an element
  - `include_observation_values` A flag to indicate that observations need to be returned.
  - `observation_date` The observation date to be included with the returned release table.
  """
  def release_tables(release_id, opts \\ []),
    do: get("/fred/release/tables", Keyword.put(opts, :release_id, release_id))

  @doc """
  Get an economic data series.

  ## Required

  - `series_id` The id for a series

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  """
  def series(series_id, opts \\ []),
    do: get("/fred/series", Keyword.put(opts, :series_id, series_id))

  @doc """
  Get the categories for an economic data series.

  ## Required

  - `series_id` The id for a series

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  """
  def series_categories(series_id, opts \\ []),
    do: get("/fred/series/categories", Keyword.put(opts, :series_id, series_id))

  @doc """
  Get the observations or data values for an economic data series.

  ## Required

  - `series_id` The id for a series

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  - `limit` The maximum number of results to return.
  - `offset` The number of results to skip
  - `sort_order` Sort results is ascending or descending order for attribute values specified by order_by.
  - `observation_start` The start of the observation period. (YYYY-MM-DD)
  - `observation_end` The end of the observation period. (YYYY-MM-DD)
  - `units` A key that indicates a data value transformation.
  - `frequency` An indicator of the frequency of an observation.
  - `aggregation_method` A key that indicates the aggregation method used for frequency aggregation.
  - `output_type` An integer that indicates an output type.
  - `vintage_dates` A comma separated string of YYYY-MM-DD formatted dates in history (e.g. 2000-01-01,2005-02-24).
  """
  def series_observations(series_id, opts \\ []),
    do: get("/fred/series/observations", Keyword.put(opts, :series_id, series_id))

  @doc """
  Get the release for an economic data series.

  ## Required

  - `series_id` The id for a series

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  """
  def series_release(series_id, opts \\ []),
    do: get("/fred/series/release", Keyword.put(opts, :series_id, series_id))

  @doc """
  Get economic data series that match search text.

  ## Required

  - `search_text` The words to match against economic data series.

  ## Optional

  - `search_type` Determines the type of search to perform.
  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  - `limit` The maximum number of results to return.
  - `offset` The number of results to skip
  - `order_by` Order results by values of the specified attribute.
  - `sort_order` Sort results is ascending or descending order for attribute values specified by order_by.
  - `filter_variable` The attribute to filter results by.
  - `filter_value` The value of the filter_variable attribute to filter results by.
  - `tag_names` A semicolon delimited list of tag names to match against.
  - `exclude_tag_names` A semicolon delimited list of tag names to exclude from the returned data series.
  """
  def series_search(search_text, opts \\ []),
    do: get("/fred/series/search", Keyword.put(opts, :search_text, search_text))

  @doc """
  Get the tags for a series search.

  ## Required

  - `series_search_text` The words to match against economic data series.

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  - `tag_names` A semicolon delimited list of tag names to only include in the response.
  - `tag_group_id` A tag group id to filter tags by type.
  - `tag_search_text` The words to find matching tags with.
  - `limit` The maximum number of results to return.
  - `offset` The number of results to skip
  - `order_by` Order results by values of the specified attribute.
  - `sort_order` Sort results is ascending or descending order for attribute values specified by order_by.
  """
  def series_search_tags(series_search_text, opts \\ []),
    do:
      get("/fred/series/search/tags", Keyword.put(opts, :series_search_text, series_search_text))

  @doc """
  Get the related tags for one or more tags.

  ## Required

  - `series_search_text` The words to match against economic data series.

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  - `tag_names` A semicolon delimited list of tag names to only include in the response.
  - `exclude_tag_names` A semicolon delimited list of tag names to exclude from the response.
  - `tag_group_id` A tag group id to filter tags by type.
  - `tag_search_text` The words to find matching tags with.
  - `limit` The maximum number of results to return.
  - `offset` The number of results to skip
  - `order_by` Order results by values of the specified attribute.
  - `sort_order` Sort results is ascending or descending order for attribute values specified by order_by.
  """
  def series_search_related_tags(series_search_text, opts \\ []) do
    get(
      "/fred/series/search/related_tags",
      Keyword.put(opts, :series_search_text, series_search_text)
    )
  end

  @doc """
  Get the sources for a series search.

  ## Required

  - `series_id` The id for a series

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  - `order_by` Order results by values of the specified attribute.
  - `sort_order` Sort results is ascending or descending order for attribute values specified by order_by.
  """
  def series_tags(series_id, opts \\ []),
    do: get("/fred/series/tags", Keyword.put(opts, :series_id, series_id))

  @doc """
  Get economic data series sorted by when observations were updated on the FRED® server.

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  - `limit` The maximum number of results to return.
  - `offset` The number of results to skip
  - `filter_value` Limit results by geographic type of economic data series; namely 'macro', 'regional', and 'all'.
  - `start_time` Start time for limiting results for a time range, can filter down to minutes
  - `end_time` End time for limiting results for a time range, can filter down to minutes
  """
  def series_updates(opts \\ []),
    do: get("/fred/series/updates", opts)

  @doc """
  Get the dates in history when a series' data values were revised or new data values were released.

  ## Required

  - `series_id` The id for a series

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  - `limit` The maximum number of results to return.
  - `offset` The number of results to skip
  - `sort_order` Sort results is ascending or descending order for attribute values specified by order_by.
  """
  def series_vintagedates(series_id, opts \\ []),
    do: get("/fred/series/vintagedates", Keyword.put(opts, :series_id, series_id))

  @doc """
  Get all sources of economic data.

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  - `limit` The maximum number of results to return.
  - `offset` The number of results to skip
  - `order_by` Order results by values of the specified attribute.
  - `sort_order` Sort results is ascending or descending order for attribute values specified by order_by.
  """
  def sources(opts \\ []),
    do: get("/fred/sources", opts)

  @doc """
  Get a source of economic data.

  ## Required

  - `source_id` The id for a source

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  """
  def source(source_id, opts \\ []),
    do: get("/fred/source", Keyword.put(opts, :source_id, source_id))

  @doc """
  Get the releases for a source.

  ## Required

  - `source_id` The id for a source

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  - `limit` The maximum number of results to return.
  - `offset` The number of results to skip
  - `order_by` Order results by values of the specified attribute.
  - `sort_order` Sort results is ascending or descending order for attribute values specified by order_by.
  """
  def source_releases(source_id, opts \\ []),
    do: get("/fred/source/releases", Keyword.put(opts, :source_id, source_id))

  @doc """
  Get FRED tags.

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  - `tag_names` A semicolon delimited list of tag names to only include in the response.
  - `tag_group_id` A tag group id to filter tags by type.
  - `search_text` The words to find matching tags with.
  - `limit` The maximum number of results to return.
  - `offset` The number of results to skip
  - `order_by` Order results by values of the specified attribute.
  - `sort_order` Sort results is ascending or descending order for attribute values specified by order_by.
  """
  def tags(opts \\ []), do: get("/fred/tags", opts)

  @doc """
  Get the related FRED tags for one or more FRED tags.

  ## Required

  - `tag_names` A semicolon delimited list of tag names for which to retrieve related tags.

  ## Optional

  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  - `exclude_tag_names` A semicolon delimited list of tag names to exclude from the response.
  - `tag_group_id` A tag group id to filter tags by type.
  - `search_text` The words to find matching tags with.
  - `limit` The maximum number of results to return.
  - `offset` The number of results to skip
  - `order_by` Order results by values of the specified attribute.
  - `sort_order` Sort results is ascending or descending order for attribute values specified by order_by.
  """
  def related_tags(tag_names, opts \\ []),
    do: get("/fred/tags/related", Keyword.put(opts, :tag_names, tag_names))

  @doc """
  Get the series matching all tags.

  ## Required

  - `tag_names` A semicolon delimited list of tag names for series to match.

  ## Optional

  - `exclude_tag_names` A semicolon delimited list of tag names to exclude from the response.
  - `realtime_start` The start of the real-time period. (YYYY-MM-DD)
  - `realtime_end` The end of the real-time period. (YYYY-MM-DD)
  - `limit` The maximum number of results to return.
  - `offset` The number of results to skip
  - `order_by` Order results by values of the specified attribute.
  - `sort_order` Sort results is ascending or descending order for attribute values specified by order_by.
  """
  def tags_series(tag_names, opts \\ []),
    do: get("/fred/tags/series", Keyword.put(opts, :tag_names, tag_names))

  defp get(url, params) do
    api_key = Application.get_env(:fred_client, :api_key)

    params =
      Keyword.new([
        {:file_type, "json"},
        {:api_key, api_key}
      ])
      |> Keyword.merge(params)

    req =
      Req.new(
        base_url: "https://api.stlouisfed.org",
        decode_json: [keys: :atoms]
      )

    case Req.get(req, url: url, params: params) do
      {:ok, %Req.Response{status: 200, body: body}} ->
        {:ok, body}

      {:ok, %Req.Response{body: body}} ->
        {:error, body}

      {:error, reason} ->
        {:error, reason}
    end
  end
end
