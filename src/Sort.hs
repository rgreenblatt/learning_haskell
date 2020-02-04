module Sort
  ( quickSort
  )
where

quickSort :: (Ord a) => [a] -> [a]
quickSort []  = []
quickSort [a] = [a]
quickSort (x : l) =
  quickSort (filter (<= x) l) ++ [x] ++ quickSort (filter (> x) l)
