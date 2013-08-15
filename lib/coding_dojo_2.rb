require "coding_dojo_2/version"

module CodingDojo2
  class Potter
    DISCOUNTS = [0, 1, 0.95, 0.90, 0.80, 0.75]

    def calculate(books)
      return 0 if books.empty?
      uniques, rest = pick_uniques(books)
      split(uniques).map { |head, tail|
        price(head.length) + calculate(tail.concat(rest))
      }.min
    end

    def price(nb_uniq_books)
      nb_uniq_books * 8 * DISCOUNTS[nb_uniq_books]
    end

    def pick_uniques(books)
      uniques = []
      rest = []
      books.each { |book|
        (uniques.include?(book) ? rest : uniques) << book
      }
      [uniques, rest]
    end

    def split(uniques)
      (1..uniques.length).map { |pos|
        [uniques.take(pos), uniques.drop(pos)]
      }
    end
  end
end
