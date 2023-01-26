          Comparação do programa que desenha bolinhas em SVG de Haskell VS C
          
1- Para criação de núemros "aleatorios" usamos funções e bibliotecas diferentes em Haskell usamos o "import System.Random" e em C usamos o "#include <time.h>"

2- Para criação de cores são usadas as seguintes funções em Haskell e C respectivamente:


 "randomPalette gen n = 
  let allrandoms = take (3*n) (randomRs (0, maxRGB) gen::[Int])
      rs = take n allrandoms
      gs = slice n (2*n-1) allrandoms
      bs = slice (2*n) (3*n) allrandoms
   in zipWith3 (\r g b -> (r,g,b)) rs gs bs"
   
   
   
    "int numAleatorio() {
        int n = rand() % 255;

        return n;
    }
   
    red = numAleatorio();
    green = numAleatorio();
    blue = numAleatorio();"
    
3- Em haskell foi possivel a criação de uma matriz 10 x 10 de bolinhas coloridas (algumas não aparecem) e em C não foi possivel por limitações da linguagem

4- As sintaxes e palavras reservadas de ambos são diferentes

5- Haskell tem uma forma mais simples de criar o arquivo SVG enquanto em C dependemos do uso de ponteiros para a criação do arquivo

6- Em C usamos o tempo para a criação de numeros aleatórios contando todos os segundos desde 01/01/1970 que é chamado de seed, em haskell a seed pode ser fornecida pela entrada e saida ou manipulando o próprio código

7- Em Haskell é possivel armazenar uma string dentro da função printf em uma variavel em C não é possivel

8- A concatenação no Haskell é mais simples do que em C
