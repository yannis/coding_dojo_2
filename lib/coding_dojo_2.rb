require "coding_dojo_2/version"

module CodingDojo2
  class Potter
    def calculate(books)

      return 0 if books.empty?

      discount_factors = {0 => 0, 1 => 1, 2 => 0.95, 3 => 0.9, 4 => 0.8, 5 => 0.75}

      series = []
      rest = []
      for book in books
        series.include?(book) ? rest << book : series << book
      end

      if series.count > 4 && rest.uniq.count == 3
        rest << series.slice!(-1)
      end

      price = series.count * 8 * discount_factors[series.count]
      rest_price = calculate(rest)

      return price+rest_price
    end
  end
end
