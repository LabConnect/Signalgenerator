float mclk = 25000000, register_size = 268435456;
float teiler = mclk / register_size;
int f_regwert = frequenz / teiler;

unsigned char block1, block2, block3, block4;

block1 = f_regwert;
f_regwert = f_regwert >> 8;
block2 = f_regwert;
block2 = (block2 | 0x40) & (~0x80);
f_regwert = f_regwert >> 6;
block3 = f_regwert;
f_regwert = f_regwert >> 8;
block4 = f_regwert;
block4 = (block4 | 0x40) & (~0x80);

int umax = 12000, bits = 512, register1, register2;
int ergebnis = u_amplitude_mv / (umax / bits);

if (510 < ergebnis)
{
  ergebnis = 510;
}

if (ergebnis%2==0)
{
  register1 = 255 - ergebnis / 2;
  register2 = 255 - ergebnis / 2;
}
else
{
  ergebnis = ergebnis- 1;
  register1 = 255-((ergebnis / 2) + 1);
  register2 = 255 - ergebnis / 2;
}