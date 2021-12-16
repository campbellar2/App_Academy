def all_words_capitalized?(array)
    array.all? {|word| word[0] == word[0].upcase && word[1..-1] == word[1..-1].downcase}
end


def no_valid_url?(urls)
    urls.none? { |url| url.include?('.com') || url.include?('.net') || url.include?('.io') || url.include?('.org')}
end


def any_passing_students?(students)
    students.any? { |student| (student[:grades].sum / student[:grades].length) > 75.0}
end
