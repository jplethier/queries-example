class Book < ApplicationRecord
  scope :ar_category, -> (category) { where(category: category) }
  scope :arel_category, -> (category) { where(arel_table[:category].eq(category)) }

  scope :ar_category_or_title, -> (category, title) { where('category = ? or title = ?', category, title) }
  scope :arel_category_or_title, -> (category, title) { where(arel_table[:category].eq(category).or(arel_table[:title].eq(title))) }

  # Book.ar_category_or_title_like_or_description_like('drama', 'Harry Potter').to_sql
  # => "SELECT \"books\".* FROM \"books\"
  #       WHERE (category = 'drama' or title like '%Harry Potter%' or description like '%Harry Potter%')"
  scope :ar_category_or_title_like_or_description_like, lambda{ |category, partial_search|
    where("category = ? or title like ? or description like ?", category, '%' + partial_search + '%', '%' + partial_search + '%')
  }
  # Book.arel_category_or_title_like_or_description_like('drama', 'Harry Potter').to_sql
  # => "SELECT \"books\".* FROM \"books\"
  #       WHERE (\"books\".\"category\" = 'drama' OR (\"books\".\"title\" LIKE 'Harry Potter' OR \"books\".\"description\" LIKE 'Harry Potter'))"
  scope :arel_category_or_title_like_or_description_like, lambda{ |category, partial_search|
    where(arel_table[:category].eq(category)
      .or(arel_table[:title].matches(partial_search)
      .or(arel_table[:description].matches(partial_search))))
  }

  # Book.ar_published_between(3.years.ago, 1.year.ago).to_sql
  # => "SELECT \"books\".* FROM \"books\"
  #       WHERE (\"books\".\"published_at\" BETWEEN '2014-07-16 23:19:13.327294' AND '2016-07-16 23:19:13.327789')"
  scope :ar_published_between, -> (bg_date, end_date) { where(published_at: bg_date..end_date) }

  # Book.ar_less_pages_than(10).to_sql
  # => "SELECT \"books\".* FROM \"books\" WHERE (pages_count < 10)"
  scope :ar_less_pages_than, -> (pg_count) { where('pages_count < ?', pg_count) }
  # Book.arel_less_pages_than(10).to_sql
  #  => "SELECT \"books\".* FROM \"books\" WHERE (\"books\".\"pages_count\" < 10)"
  scope :arel_less_pages_than, -> (pg_count) { where(arel_table[:pages_count].lt(pg_count)) }

  # Book.ar_more_pages_than(10).to_sql
  # => "SELECT \"books\".* FROM \"books\" WHERE (pages_count > 10)"
  scope :ar_more_pages_than, -> (pg_count) { where('pages_count > ?', pg_count) }
  # Book.arel_more_pages_than(10).to_sql
  #  => "SELECT \"books\".* FROM \"books\" WHERE (\"books\".\"pages_count\" > 10)"
  scope :arel_more_pages_than, -> (pg_count) { where(arel_table[:pages_count].gt(pg_count)) }

  # Book.ar_more_or_equal_pages(10).to_sql
  # => "SELECT \"books\".* FROM \"books\" WHERE (pages_count >= 10)"
  scope :ar_more_or_equal_pages, -> (pg_count) { where('pages_count >= ?', pg_count) }
  # Book.arel_more_or_equal_pages(10).to_sql
  #  => "SELECT \"books\".* FROM \"books\" WHERE (\"books\".\"pages_count\" >= 10)"
  scope :arel_more_or_equal_pages, -> (pg_count) { where(arel_table[:pages_count].gteq(pg_count)) }

  # Book.ar_less_or_equal_pages(10).to_sql
  # => "SELECT \"books\".* FROM \"books\" WHERE (pages_count <= 10)"
  scope :ar_less_or_equal_pages, -> (pg_count) { where('pages_count <= ?', pg_count) }
  # Book.arel_less_or_equal_pages(10).to_sql
  #  => "SELECT \"books\".* FROM \"books\" WHERE (\"books\".\"pages_count\" <= 10)"
  scope :arel_less_or_equal_pages, -> (pg_count) { where(arel_table[:pages_count].lteq(pg_count)) }
end
