#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main()
{
    int numAleatorio() {
        int n = rand() % 255;

        return n;
    }

    char inicio[80];
    char circulo1[137];
    char circulo2[137];
    char circulo3[137];
    char circulo4[137];
    char fim[7];
    char stringTotal[5000];
    /*char stringAux[5000];
    int cx = 88;
    int cy = 99;*/

    sprintf(inicio, "<svg width='1366' height='598' xmlns='http://www.w3.org/2000/svg'>\n");
    sprintf(fim, "</svg>");

    srand(time(NULL));
    /*for(int i = 0; i < 2; i++) {
        for(int j = 0; j < 2; j++) {
            int red = numAleatorio();
            int green = numAleatorio();
            int blue = numAleatorio();
            sprintf(circulos + strlen(circulos) + 1, "<circle cx='%d' cy='%d'  r='25' width='5' height='1' style='fill:rgb(%d,%d,%d); mix-blend-mode: screen;'/>\n\0", cx,cy,red,green,blue);
            printf("%d %d, ", cx, cy);
            cx+= 55;
        }
        cy+= 55;
    }*/

    int red = numAleatorio();
    int green = numAleatorio();
    int blue = numAleatorio();
    sprintf(circulo1, "<circle cx='200' cy='299' r='100' width='5' height='1' style='fill:rgb(%d,%d,%d); mix-blend-mode: screen;'/>\n", red,green,blue);

    red = numAleatorio();
    green = numAleatorio();
    blue = numAleatorio();
    sprintf(circulo2, "<circle cx='550' cy='299' r='100' width='5' height='1' style='fill:rgb(%d,%d,%d); mix-blend-mode: screen;'/>\n", red,green,blue);

    red = numAleatorio();
    green = numAleatorio();
    blue = numAleatorio();
    sprintf(circulo3, "<circle cx='850' cy='299' r='100' width='5' height='1' style='fill:rgb(%d,%d,%d); mix-blend-mode: screen;'/>\n", red,green,blue);

    red = numAleatorio();
    green = numAleatorio();
    blue = numAleatorio();
    sprintf(circulo4, "<circle cx='1200' cy='299' r='100' width='5' height='1' style='fill:rgb(%d,%d,%d); mix-blend-mode: screen;'/>\n", red,green,blue);

    sprintf(stringTotal, "%s %s %s %s %s %s", inicio, circulo1, circulo2, circulo3, circulo4, fim);

    FILE *pont_arq;
    int r;

    pont_arq = fopen("output.svg", "w");

    if (pont_arq == NULL) {
        printf("Erro ao tentar abrir a imagem!");
        exit(1);
    }

    r = fputs(stringTotal, pont_arq);

    if(r == EOF) {
        printf("Erro ao tentar criar os desenhos! \n");
    }
    else {
        printf("Desenho criado/atualizado. \n");
    }

    fclose(pont_arq);
    return 0;
}
