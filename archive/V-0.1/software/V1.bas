$regfile "m8def.dat"
$crystal = 8000000
$baud = 19200

'---Ausgänge deklarieren
Config Portd.6 = Output

Config Spi = Hard , Interrupt = Off , Data Order = Msb , Master = Yes , Polarity = High , Phase = 0 , Clockrate = 4 , Noss = 0

'Funktionen deklarieren
Declare Function Identify(byval Zeit As Integer) As Word

'Variablen deklarieren
Dim Zeit As Integer
Dim Muell As Word
Dim Befehl As String * 5
Dim Sinus As Integer
Dim Dreieck As Integer
Dim Frequenz1_lsb As Integer
Dim Frequenz1_msb As Integer
Dim Frequenz2_lsb As Integer
Dim Frequenz2_msb As Integer
Dim Mitte_lsb As Integer
Dim Mitte_msb As Integer
Dim Rechteck As Integer
Dim Rechteck2 As Integer


'Anfang des Programms
Spiinit
'signalform-variablen beschreiben
Sinus = &B0000000000100000
Dreieck = &B0000001000100000
Rechteck = &B0010100000000000
Rechteck2 = &B0010000000000000

'Frequenzvariablen beschreiben

'wert:107378048 - 10MHz
Frequenz1_lsb = &B1000000001110101
Frequenz1_msb = &B1001100101011001

'wert:53687091 - 5MHz -
Frequenz2_lsb = &B0011001101110011
Frequenz2_msb = &B1100110001001100

'wert:10738 - 1khz -
Mitte_lsb = &B1111000001101001
Mitte_msb = &B0000000001000000

Wait 5

Print "DDS-Signalgenerator"
Print "bitte wähle aus folgenden Optionen:"
Print "ident - Identifiziert den Generator"
Print "Freg1 - die erste Frequenz (10MHz)"
Print "Freg2 - die zweite Frequenz (5MHz)"
Print "Sinus - Ausgangssignal ist ein Sinus"
Print "trian - Ausgangssignal ist ein Dreieck"
Print "mitte - Sinus, Audiomittenfrequenz"
Print "clk-1 - Rechtecksignal ausgeben"
Print "clk-2 _ Rechtecksignal mit 1/2*F Ausgeben"
Print "help - diese Hilfe"

Do
Print ""
Input Befehl

Select Case Befehl

   Case "clk-1"
   Spiout Rechteck , 2

   Case "clk-2"
   Spiout Rechteck2 , 2

   Case "ident"
   Muell = Identify(100)

   Case "mitte"
      Spiout Sinus , 2
      Spiout Mitte_lsb , 2
      Spiout Mitte_msb , 2

   Case "Freg1"
      Spiout Frequenz1_lsb , 2
      Spiout Frequenz1_msb , 2

   Case "Freg2"
      Spiout Frequenz2_lsb , 2
      Spiout Frequenz2_msb , 2

   Case "Sinus"
      Spiout Sinus , 2

   Case "trian"
      Spiout Dreieck , 2

   Case "help"
      Print "DDS-Signalgenerator"
      Print "bitte wähle aus folgenden Optionen:"
      Print "ident - Identifiziert den Generator"
      Print "Freg1 - die erste Frequenz (10MHz)"
      Print "Freg2 - die zweite Frequenz (5MHz)"
      Print "Sinus - Ausgangssignal ist ein Sinus"
      Print "trian - Ausgangssignal ist ein Dreieck"
      Print "mitte - Sinus, Audiomittenfrequenz"
      Print "clk-1 - Rechtecksignal ausgeben"
      Print "clk-2 _ Rechtecksignal mit 1/2*F Ausgeben"
      Print "help - diese Hilfe"

   Case Else
      Print "Error! Befehl nicht vorhanden!"


End Select

Loop

End



Function Identify(zeit As Integer) As Word
 Identify = 10
 Portd.6 = 1
 Waitms Zeit
 Portd.6 = 0
 Waitms Zeit
 Portd.6 = 1
 Waitms Zeit
 Portd.6 = 0
 Waitms Zeit
 Portd.6 = 1
 Waitms Zeit
 Portd.6 = 0
 Waitms Zeit
 Portd.6 = 1
 Waitms Zeit
 Portd.6 = 0
 Waitms Zeit
 Portd.6 = 1
 Waitms Zeit
 Portd.6 = 0
 Waitms Zeit
 Portd.6 = 1
 Waitms Zeit
 Portd.6 = 0
 Waitms Zeit
End Function