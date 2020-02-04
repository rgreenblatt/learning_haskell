module Sort
  ( quickSort
  , mergeSort
  )
where

-- type TupList k v = [(k, v)]
type Sorter a = (Ord a) => [a] -> [a]

quickSort :: Sorter a
quickSort [] = []
quickSort (x : l) =
  quickSort (filter (<= x) l) ++ [x] ++ quickSort (filter (> x) l)

merge :: (Ord a) => ([a], [a]) -> [a]
merge ([], l ) = l
merge (l , []) = l
merge (x : first, y : second) =
  if x < y then x : merge (first, y : second) else y : merge (x : first, second)

mergeSort :: Sorter a
mergeSort l = if len < 10
  then quickSort l
  else
    let (first, second) = splitAt (div len 2) l
    in  merge (mergeSort first, mergeSort second)
  where len = length l

