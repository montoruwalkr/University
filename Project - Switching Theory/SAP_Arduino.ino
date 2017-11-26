int ADDC = 7;
int SUBC = 6;
int MULTC = 5;
int DIVC = 4;
int MODC = 3;
int HLT = 14;
int OUT = 15;
int ADD = 16;
int SUB = 17;
int MULT = 18;
int DIV = 19;
int MOD = 20;
int LDA = 21;
int LA = 22;
int EA = 23;
int EU = 24;
int LB = 25;
int LO = 26;
int LI = 27;
int EI = 28;
int ER = 29;
int LM = 30;
int LC = 31;
int EC = 32;
int EP = 52;
int LP = 53;
int DZ = 33;
int outPin[8] = { 42, 43, 44, 45, 46, 47, 48, 49};
int inPin[8] = { 34, 35, 36, 37, 38, 39, 40, 41};
int memory = 0;
int count = 0;
bool a = false;


void setup() {
  pinMode(ADDC, OUTPUT);
  pinMode(SUBC, OUTPUT);
  pinMode(MULTC, OUTPUT);
  pinMode(DIVC, OUTPUT);
  pinMode(MODC, OUTPUT);
  pinMode(HLT, INPUT);
  pinMode(OUT, INPUT);
  pinMode(ADD, INPUT);
  pinMode(SUB, INPUT);
  pinMode(MULT, INPUT);
  pinMode(DIV, INPUT);
  pinMode(MOD, INPUT);
  pinMode(LDA, INPUT);
  pinMode(LA, OUTPUT);
  pinMode(EA, OUTPUT);
  pinMode(EU, OUTPUT);
  pinMode(LB, OUTPUT);
  pinMode(LO, OUTPUT);
  pinMode(LI, OUTPUT);
  pinMode(EI, OUTPUT);
  pinMode(ER, OUTPUT);
  pinMode(LM, OUTPUT);
  pinMode(LC, OUTPUT);
  pinMode(EC, OUTPUT);
  pinMode(EP, OUTPUT);
  pinMode(LP, OUTPUT);
  pinMode(DZ, OUTPUT);
  for ( int i = 0; i < 8; i++) {
    pinMode(outPin[i], OUTPUT);
    pinMode(inPin[i], INPUT);
  }
  Serial.begin(9600);
}


void loop() {
  count = 0;
  int i = 0;
  while (digitalRead(HLT) == LOW && i < 16 && a == false) {
    PORTL = memory;
    digitalWrite(LP, HIGH);
    delay(1);
    digitalWrite(LP, LOW);
    delay(1);
    digitalWrite(EP, HIGH);
    digitalWrite(LM, HIGH);
    delay(1);
    digitalWrite(LM, LOW);
    digitalWrite(EP, LOW);
    digitalWrite(ER, HIGH);
    digitalWrite(LI, HIGH);
    delay(1);
    digitalWrite(LI, LOW);
    digitalWrite(ER, LOW);
    delay(1);
    if (digitalRead(LDA) == HIGH) {
      digitalWrite(EI, HIGH);
      digitalWrite(LA, HIGH);
      delay(1);
      digitalWrite(LA, LOW);
      digitalWrite(EI, LOW);
      delay(1);
    }
    if (digitalRead(OUT) == HIGH) {
      digitalWrite(EA, HIGH);
      digitalWrite(LO, HIGH);
      delay(1);
      digitalWrite(LO, LOW);
      digitalWrite(EA, LOW);
    }

    if (digitalRead(ADD) == HIGH) {
      digitalWrite(EI, HIGH);
      digitalWrite(LB, HIGH);
      digitalWrite(ADDC, HIGH);
      delay(1);
      digitalWrite(LB, LOW);
      digitalWrite(EI, LOW);
      digitalWrite(ADDC, LOW);
      delay(1);
      digitalWrite(EU, HIGH);
      digitalWrite(LA, HIGH);
      delay(1);
      digitalWrite(LA, LOW);
      delay(1);
      digitalWrite(EU, LOW);
    }
    if (digitalRead(SUB) == HIGH) {
      digitalWrite(EI, HIGH);
      digitalWrite(LB, HIGH);
      digitalWrite(SUBC, HIGH);
      delay(1);
      digitalWrite(LB, LOW);
      digitalWrite(EI, LOW);
      digitalWrite(SUBC, LOW);
      delay(1);
      digitalWrite(EU, HIGH);
      digitalWrite(LA, HIGH);
      delay(1);
      digitalWrite(LA, LOW);
      delay(1);
      digitalWrite(EU, LOW);
    }
    if (digitalRead(MULT) == HIGH) {
      digitalWrite(EI, HIGH);
      digitalWrite(LB, HIGH);
      digitalWrite(MULTC, HIGH);
      delay(1);
      digitalWrite(LB, LOW);
      digitalWrite(EI, LOW);
      digitalWrite(MULTC, LOW);
      delay(1);
      digitalWrite(EU, HIGH);
      digitalWrite(LA, HIGH);
      delay(1);
      digitalWrite(LA, LOW);
      delay(1);
      digitalWrite(EU, LOW);
    }
    if (digitalRead(DIV) == HIGH) {
      digitalWrite(EI, HIGH);
      for ( int i = 0; i < 8; i++) {
        if (digitalRead(inPin[i]) == LOW) {
          count++;
        }
      }
      if ( count == 8) {
        digitalWrite(DZ, HIGH);
        digitalWrite(EI, LOW);
        delay(1);
        a = true;
      } else {
        digitalWrite(LB, HIGH);
        digitalWrite(DIVC, HIGH);
        delay(1);
        digitalWrite(LB, LOW);
        digitalWrite(EI, LOW);
        digitalWrite(DIVC, LOW);
        delay(1);
        digitalWrite(EU, HIGH);
        digitalWrite(LA, HIGH);
        delay(1);
        digitalWrite(LA, LOW);
        delay(1);
        digitalWrite(EU, LOW);
      }
    }

    if (digitalRead(MOD) == HIGH) {
      for ( int i = 0; i < 8; i++) {
        if (digitalRead(inPin[i]) == LOW) {
          count++;
        }
      }
      if ( count == 8) {
        digitalWrite(DZ, HIGH);
        digitalWrite(EI, LOW);
        delay(1);
        a = true;
      } else {
      digitalWrite(EA, HIGH);
      digitalWrite(LC, HIGH);
      delay(1);
      digitalWrite(LC, LOW);
      digitalWrite(EA, LOW);
      digitalWrite(EI, HIGH);
      digitalWrite(LB, HIGH);
      delay(1);
      digitalWrite(LB, LOW);
      digitalWrite(EI, LOW);
      digitalWrite(DIVC, HIGH);
      digitalWrite(EU, HIGH);
      digitalWrite(DIVC, LOW);
      digitalWrite(LA, HIGH);
      delay(1);
      digitalWrite(LA, LOW);
      digitalWrite(EU, LOW);
      digitalWrite(MULTC, HIGH);
      digitalWrite(EU, HIGH);
      digitalWrite(MULTC, LOW);
      digitalWrite(LB, HIGH);
      delay(1);
      digitalWrite(LB, LOW);
      digitalWrite(EU, LOW);
      digitalWrite(EC, HIGH);
      digitalWrite(LA, HIGH);
      delay(1);
      digitalWrite(LA, LOW);
      digitalWrite(EC, LOW);
      digitalWrite(SUBC, HIGH);
      digitalWrite(EU, HIGH);
      digitalWrite(SUBC, LOW);
      digitalWrite(LA, HIGH);
      delay(1);
      digitalWrite(LA, LOW);
      digitalWrite(EU, LOW);
    }
    }
    memory++;
    i++;
  }
}
