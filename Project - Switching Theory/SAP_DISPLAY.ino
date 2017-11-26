int  decenas[7] = { 43, 44, 45, 46, 47, 48, 49};
int  unidades[7] = {22, 23, 24, 25, 26, 27, 28};
int  num[8] = { 30, 31, 32, 33, 34, 35, 36, 37};
byte display[10] = { 63, 06, 91, 79, 102, 109, 125, 07, 127, 103};
int valores[8] = { 128, 64, 32, 16, 8, 4, 2, 1};
int DZ = 52;
int acum = 0;
int dec;
int uni;
int bits[8];

void setup() {
  for ( int i = 0; i < 7; i++) {
    pinMode(DZ, INPUT);
    pinMode(decenas[i], OUTPUT);
    pinMode(unidades[i], OUTPUT);
    pinMode(num[i], INPUT);
    if ( i == 6) {

      pinMode(num[i + 1], INPUT);
    }
  }


}

void loop() {
  if (digitalRead(DZ) == HIGH) {
    PORTL = 121;
    PORTA = 121;
  }
  else {
    acum = 0;
    for (int i = 0; i < 8; i ++) {

      bits[i] = digitalRead(num[i]);

      if ( bits[i] == 1) {
        acum = acum + valores[i];

      }

    }
    dec = acum / 10;
    uni = acum % 10;



    PORTL = display[dec];
    PORTA = display[uni];
  }

}
