int[] kolonne = new int[3]; //<>//
int[][] bankoPlade = new int[9][3];

void setup() {
  size(600,600);
  
  // lav en kolonne og sorter den
  kolonne = tilfaeldigeTal(kolonne.length);
  kolonne = sorter(kolonne);
  // Bil ved med at lave en ny hvis der var to ens og sorter den nye. 
  while (findEns(kolonne)) {
    kolonne=tilfaeldigeTal(kolonne.length);
    kolonne = sorter(kolonne);
  }
  printArray(kolonne);
  
  // 1) lav en hel plade
  
  // 2) bloker felter
  
  // 3) udskriv til skærm
  
  // 4) exporter til String
  
  // Log på server og send navn plus bingoplade som string
  
}

void draw() {
  
  // lyt på netværket efter nye tal
  
  // gem nyt tal? 
  
  // søg efter tal på vores plade og gør noget hvis det findes.
  
}

// generer bingoplade her!


int[] tilfaeldigeTal(int antal) {
  int[] col = new int[antal];  
  for (int i =0; i<antal; i++) {
    col[i] = (int)random(1, 11);
  }
  return col;
}

// kopier og tilpas tilfaeldigeTal, så den kan lave 3 tal og lav en ny som kan lave 4 tal


int[] sorter(int[] tal) {
  int i=0;
  //for (int i =0; i <tal.length-1; i++) {
  while (i<tal.length-1) {
    if (tal[i]>tal[i+1]) {
      int temp = tal[i];
      tal[i]=tal[i+1];
      tal[i+1]=temp;
      i=0;
    } else {
      i++;
    }
  }
  return tal;
}

// lav her en funktion som kan fjerne 4 tilfældige tal i en række


boolean findEns(int[] tal) {
  boolean notAlike = false;
  // find og ret dubletter 
  for (int i =0; i<tal.length-1; i++) {
    if (tal[i] == tal[i+1]) {
      notAlike = true;
    }
  }
  return notAlike;
}


// lav en funktion som kan udskrive bingopladen til skærm

// lav en funktion som kan exportere bingopladen til en String

// når du modtager et tal fra serveren skal det lave om til tal fra int. lav en funktion som kan det..
// try catch(Exception e)


// lav en funktion som kan finde et tal på vores plade som serveren har trukket.
