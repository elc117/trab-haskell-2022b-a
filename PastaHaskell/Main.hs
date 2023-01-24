import Text.Printf
import System.Random

type Circle = (Int, Int, Int, Int, Int) -- cx, cy, raio, width, height

maxRGB :: Int
maxRGB = 255

svgCircle :: Circle -> String -> String
svgCircle (x, y, r, w, h) style = printf "<circle cx='%d' cy='%d' r='%d' width='%d' height='%d' style='%s'/>\n" x y r w h style

svgBegin :: Int -> Int -> String
svgBegin w h = printf "<svg width='%d' height='%d' xmlns='http://www.w3.org/2000/svg'>\n" w h

svgEnd :: String
svgEnd = "</svg>"

svgStyle :: (Int,Int,Int) -> String
svgStyle (r,g,b) = printf "fill:rgb(%d,%d,%d); mix-blend-mode: screen;" r g b

greenPalette :: Int -> [(Int,Int,Int)]
greenPalette n = [(0, 80+i*10, 0) | i <- [0..n] ]

rgbOnlyPalette :: Int -> [(Int,Int,Int)]
rgbOnlyPalette n = take n $ cycle [(maxRGB,0,0), (0,maxRGB,0), (0,0,maxRGB)]

randomPalette :: StdGen -> Int -> [(Int,Int,Int)]
randomPalette gen n = 
  let allrandoms = take (3*n) (randomRs (0, maxRGB) gen::[Int])
      rs = take n allrandoms
      gs = slice n (2*n-1) allrandoms
      bs = slice (2*n) (3*n) allrandoms
   in zipWith3 (\r g b -> (r,g,b)) rs gs bs

slice :: Int -> Int -> [a] -> [a]
slice from to xs = take (to - from + 1) (drop from xs)

genCirclesInLine :: Int -> Int -> Int -> [Circle]
genCirclesInLine n size gap = 
  [(m*(size+gap), 0, size, size, 1) | m <- [0..(n-1)]]

genCircleGrid :: Int -> Int -> Int -> [Circle]
genCircleGrid n size gap = 
  [(i*(size+gap), j*(size+gap), size, size, 1) | i <- [0..(n-1)], j <- [0..(n-1)]]

genRandomBools :: StdGen -> Int -> [Bool]
genRandomBools gen n = take n (randomRs (True,False) gen :: [Bool])

genRandomCircles :: StdGen -> Int -> Int -> Int -> [Circle]
genRandomCircles gen n size gap =
  let grid = genCircleGrid n size gap
      randombools = genRandomBools gen (n*n)
   in map (\(b,r) -> r) $ filter (\(b,r) -> b) $ zip randombools grid

main :: IO ()
main = do
  color_randgen <- newStdGen
  pos_randgen <- newStdGen
  putStrLn "Check output in output.svg"
  let nrects = 10
      radius = 20
      rsize = 5
      gap = 6
      palette = randomPalette color_randgen (nrects*nrects)
      rects = genRandomCircles pos_randgen nrects rsize gap
      svgfigs = concat $ zipWith svgCircle rects (map svgStyle palette)
      imagew = nrects*(rsize+gap)
      (w,h) = (imagew, imagew) -- width,height da imagem SVG
      svgstrings = svgBegin w h ++ svgfigs ++ svgEnd
   in writeFile "output.svg" svgstrings