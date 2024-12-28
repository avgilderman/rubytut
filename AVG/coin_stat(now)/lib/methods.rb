# frozen_string_literal: true

def coin_toss_stat(toss)
  even = 0
  odd = 0
  rib = 0

  toss.times do # подбросить количество раз
    result = rand(toss)
    even, odd, rib = update_counts(result, even, odd, rib) # присваиваем новые значения возвращаемые update_counts
  end

  { even: even, odd: odd, rib: rib }
end

# Метод для обновления счетчиков в зависимости от значения item
def update_counts(item, even, odd, rib)
  if item == 1
    rib += 1
  elsif item.even?
    even += 1
  elsif item.odd?
    odd += 1
  end
  [even, odd, rib]
end
