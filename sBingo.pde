import processing.net.*; //<>// //<>//

Client myClient;
int dataIn;


int[] kolonne = new int[3];
int[][] bingoPlade = new int[9][3];

void setup() {
  size(850, 600);
  textSize(60);
  textAlign(RIGHT);
  // 1) lav en hel plade
  for (int i =0; i<bingoPlade.length; i++) {
    kolonne = genererKolonne(i);
    bingoPlade[i]=kolonne;
    println(kolonne);
  }

  // 2) bloker felter

  for (int g=0; g<3; g++) {
    int[] b = new int[4];
    b= tilfaeldige4Tal();
    b = sorter(b);
    while (findEns(b)) {
      b=tilfaeldige4Tal();

      b = sorter(b);
    }
    //printArray(b);
    for (int i=0; i<b.length; i++) {
      bingoPlade[b[i]][g]=0;
    }
  }



  // 3) udskriv til skærm
  bpViser(bingoPlade);  
  // 4) exporter til String
  println("Christian"+textConvert(bingoPlade));

  // Log på server og send navn plus bingoplade som string
  myClient = new Client(this,"127.0.0.1", 5204);
  myClient.write("Christian"+textConvert(bingoPlade));
  
  
  
}

void draw() {

  // lyt på netværket efter nye tal

  // gem nyt tal? 

  // søg efter tal på vores plade og gør noget hvis det findes.
}

int[] genererKolonne(int i) {
  int[] k = new int[3];
  // lav en kolonne og sorter den
  k = tilfaeldige3Tal(i);
  k = sorter(k);
  // Bil ved med at lave en ny hvis der var to ens og sorter den nye. 
  while (findEns(k)) {
    k=tilfaeldige3Tal(i);
    k = sorter(k);
  }
  return k;
}


// generer bingoplade her!


int[] tilfaeldige3Tal(int t) {
  int[] col = new int[3];  
  for (int i =0; i<col.length; i++) {
    col[i] = (int)random(1, 11)+t*10;
  }
  return col;
}

int[] tilfaeldige4Tal() {
  int[] col = new int[4];  
  for (int i =0; i<col.length; i++) {
    col[i] = (int)random(0, 9);
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
void bpViser(int[][] bp) {
  for (int i =0; i<bp.length; i++) {
    for (int j=0; j<bp[i].length; j++) {
      if (bp[i][j] !=0) {
        text(bp[i][j], 80+i*90, 60+j*60 );
      }
    }
  }
}

// lav en funktion som kan exportere bingopladen til en String
String textConvert(int[][] bp){
  String s = "";
  for (int i =0; i<bp.length; i++) {
    for (int j=0; j<bp[i].length; j++) {
        s = s + ","+Integer.valueOf(bp[i][j]);
      }
    }
return s;
}



// når du modtager et tal fra serveren skal det lave om til tal fra int. lav en funktion som kan det..
// try catch(Exception e)


// lav en funktion som kan finde et tal på vores plade som serveren har trukket.
