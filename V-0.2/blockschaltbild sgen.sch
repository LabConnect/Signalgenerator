<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="7.1.0">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="Blockschaltbild">
<packages>
</packages>
<symbols>
<symbol name="BLOCK">
<wire x1="-17.78" y1="17.78" x2="17.78" y2="17.78" width="0.254" layer="94"/>
<wire x1="17.78" y1="17.78" x2="17.78" y2="-17.78" width="0.254" layer="94"/>
<wire x1="17.78" y1="-17.78" x2="-17.78" y2="-17.78" width="0.254" layer="94"/>
<wire x1="-17.78" y1="-17.78" x2="-17.78" y2="17.78" width="0.254" layer="94"/>
</symbol>
<symbol name="ARROW-DOUBLE">
<wire x1="7.62" y1="2.54" x2="7.62" y2="5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="5.08" x2="12.7" y2="0" width="0.254" layer="94"/>
<wire x1="12.7" y1="0" x2="7.62" y2="-5.08" width="0.254" layer="94"/>
<wire x1="7.62" y1="-5.08" x2="7.62" y2="-2.54" width="0.254" layer="94"/>
<wire x1="7.62" y1="-2.54" x2="-5.08" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-2.54" x2="-5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-5.08" y1="-5.08" x2="-10.16" y2="0" width="0.254" layer="94"/>
<wire x1="-10.16" y1="0" x2="-5.08" y2="5.08" width="0.254" layer="94"/>
<wire x1="-5.08" y1="5.08" x2="-5.08" y2="2.54" width="0.254" layer="94"/>
<wire x1="-5.08" y1="2.54" x2="7.62" y2="2.54" width="0.254" layer="94"/>
</symbol>
<symbol name="ARROW">
<wire x1="-10.16" y1="2.54" x2="2.54" y2="2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="2.54" x2="2.54" y2="5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="5.08" x2="7.62" y2="0" width="0.254" layer="94"/>
<wire x1="7.62" y1="0" x2="2.54" y2="-5.08" width="0.254" layer="94"/>
<wire x1="2.54" y1="-5.08" x2="2.54" y2="-2.54" width="0.254" layer="94"/>
<wire x1="2.54" y1="-2.54" x2="-10.16" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-10.16" y1="-2.54" x2="-10.16" y2="2.54" width="0.254" layer="94"/>
</symbol>
<symbol name="MUX">
<wire x1="-5.08" y1="-10.16" x2="-5.08" y2="0" width="0.254" layer="94"/>
<wire x1="-5.08" y1="0" x2="-5.08" y2="10.16" width="0.254" layer="94"/>
<wire x1="-5.08" y1="10.16" x2="5.08" y2="20.32" width="0.254" layer="94"/>
<wire x1="5.08" y1="-20.32" x2="-5.08" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-5.08" y1="0" x2="-10.16" y2="0" width="0.254" layer="94"/>
<wire x1="5.08" y1="20.32" x2="5.08" y2="15.24" width="0.254" layer="94"/>
<wire x1="5.08" y1="15.24" x2="5.08" y2="5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="5.08" x2="5.08" y2="-5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="-5.08" x2="5.08" y2="-15.24" width="0.254" layer="94"/>
<wire x1="5.08" y1="-15.24" x2="5.08" y2="-20.32" width="0.254" layer="94"/>
<wire x1="5.08" y1="5.08" x2="10.16" y2="5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="-5.08" x2="10.16" y2="-5.08" width="0.254" layer="94"/>
<wire x1="5.08" y1="-15.24" x2="10.16" y2="-15.24" width="0.254" layer="94"/>
<wire x1="5.08" y1="15.24" x2="10.16" y2="15.24" width="0.254" layer="94"/>
</symbol>
<symbol name="AMP">
<wire x1="-17.78" y1="17.78" x2="17.78" y2="17.78" width="0.254" layer="94"/>
<wire x1="17.78" y1="17.78" x2="17.78" y2="-17.78" width="0.254" layer="94"/>
<wire x1="17.78" y1="-17.78" x2="-17.78" y2="-17.78" width="0.254" layer="94"/>
<wire x1="-17.78" y1="-17.78" x2="-17.78" y2="17.78" width="0.254" layer="94"/>
<wire x1="10.16" y1="0" x2="-7.62" y2="12.7" width="0.254" layer="94"/>
<wire x1="-7.62" y1="12.7" x2="-7.62" y2="-12.7" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-12.7" x2="10.16" y2="0" width="0.254" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="BLOCK">
<gates>
<gate name="G$1" symbol="BLOCK" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="ARROW-DOUBLE">
<gates>
<gate name="G$1" symbol="ARROW-DOUBLE" x="-2.54" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="ARROW">
<gates>
<gate name="G$1" symbol="ARROW" x="2.54" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="MUX">
<gates>
<gate name="G$1" symbol="MUX" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="AMP">
<gates>
<gate name="G$1" symbol="AMP" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="U$1" library="Blockschaltbild" deviceset="BLOCK" device=""/>
<part name="U$2" library="Blockschaltbild" deviceset="ARROW-DOUBLE" device=""/>
<part name="U$3" library="Blockschaltbild" deviceset="BLOCK" device=""/>
<part name="U$4" library="Blockschaltbild" deviceset="BLOCK" device=""/>
<part name="U$5" library="Blockschaltbild" deviceset="ARROW" device=""/>
<part name="U$6" library="Blockschaltbild" deviceset="MUX" device=""/>
<part name="U$7" library="Blockschaltbild" deviceset="BLOCK" device=""/>
<part name="U$8" library="Blockschaltbild" deviceset="ARROW" device=""/>
<part name="U$9" library="Blockschaltbild" deviceset="AMP" device=""/>
<part name="U$10" library="Blockschaltbild" deviceset="BLOCK" device=""/>
<part name="U$11" library="Blockschaltbild" deviceset="ARROW" device=""/>
<part name="U$12" library="Blockschaltbild" deviceset="BLOCK" device=""/>
<part name="U$13" library="Blockschaltbild" deviceset="ARROW" device=""/>
<part name="U$14" library="Blockschaltbild" deviceset="BLOCK" device=""/>
<part name="U$15" library="Blockschaltbild" deviceset="ARROW" device=""/>
<part name="U$16" library="Blockschaltbild" deviceset="BLOCK" device=""/>
<part name="U$17" library="Blockschaltbild" deviceset="ARROW" device=""/>
<part name="U$18" library="Blockschaltbild" deviceset="BLOCK" device=""/>
<part name="U$19" library="Blockschaltbild" deviceset="BLOCK" device=""/>
<part name="U$20" library="Blockschaltbild" deviceset="ARROW" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="25.4" y="50.8" size="5.08" layer="94">Computer</text>
<text x="66.04" y="60.96" size="5.08" layer="94">USB</text>
<text x="88.9" y="50.8" size="5.08" layer="94">ATxMega</text>
<text x="91.44" y="-7.62" size="5.08" layer="94">DDS-IC</text>
<text x="88.9" y="25.4" size="5.08" layer="94">SPI</text>
<wire x1="132.08" y1="-5.08" x2="121.92" y2="-5.08" width="0.254" layer="94"/>
<text x="134.62" y="17.78" size="5.08" layer="94">MUX</text>
<text x="170.18" y="-5.08" size="3.556" layer="94" align="center">Koppel-
Kondensatoren</text>
<wire x1="149.86" y1="10.16" x2="152.4" y2="10.16" width="0.254" layer="94"/>
<wire x1="149.86" y1="0" x2="152.4" y2="0" width="0.254" layer="94"/>
<wire x1="149.86" y1="-10.16" x2="152.4" y2="-10.16" width="0.254" layer="94"/>
<wire x1="149.86" y1="-20.32" x2="152.4" y2="-20.32" width="0.254" layer="94"/>
<wire x1="208.28" y1="53.34" x2="203.2" y2="58.42" width="0.3048" layer="94"/>
<wire x1="203.2" y1="58.42" x2="203.2" y2="55.88" width="0.3048" layer="94"/>
<wire x1="203.2" y1="55.88" x2="124.46" y2="55.88" width="0.3048" layer="94"/>
<wire x1="124.46" y1="55.88" x2="124.46" y2="50.8" width="0.3048" layer="94"/>
<wire x1="124.46" y1="50.8" x2="203.2" y2="50.8" width="0.3048" layer="94"/>
<wire x1="203.2" y1="50.8" x2="203.2" y2="48.26" width="0.3048" layer="94"/>
<wire x1="203.2" y1="48.26" x2="208.28" y2="53.34" width="0.3048" layer="94"/>
<text x="162.56" y="60.96" size="3.81" layer="94" align="center">I²C-Bus</text>
<text x="228.6" y="53.34" size="5.08" layer="94" align="center">DigiPoti</text>
<text x="287.02" y="-5.08" size="5.08" layer="94" align="center">Offset
Addierer</text>
<wire x1="287.02" y1="15.24" x2="292.1" y2="20.32" width="0.3048" layer="94"/>
<wire x1="292.1" y1="20.32" x2="289.56" y2="20.32" width="0.3048" layer="94"/>
<wire x1="284.48" y1="20.32" x2="281.94" y2="20.32" width="0.3048" layer="94"/>
<wire x1="281.94" y1="20.32" x2="287.02" y2="15.24" width="0.3048" layer="94"/>
<wire x1="284.48" y1="20.32" x2="284.48" y2="50.8" width="0.3048" layer="94"/>
<wire x1="284.48" y1="50.8" x2="248.92" y2="50.8" width="0.3048" layer="94"/>
<wire x1="248.92" y1="50.8" x2="248.92" y2="55.88" width="0.3048" layer="94"/>
<wire x1="248.92" y1="55.88" x2="289.56" y2="55.88" width="0.3048" layer="94"/>
<wire x1="289.56" y1="55.88" x2="289.56" y2="20.32" width="0.3048" layer="94"/>
<text x="345.44" y="-5.08" size="5.08" layer="94" align="center">SMB
Buchse</text>
<wire x1="101.6" y1="73.66" x2="106.68" y2="73.66" width="0.254" layer="94"/>
<wire x1="106.68" y1="73.66" x2="106.68" y2="86.36" width="0.254" layer="94"/>
<wire x1="106.68" y1="86.36" x2="132.08" y2="86.36" width="0.254" layer="94"/>
<wire x1="101.6" y1="73.66" x2="101.6" y2="91.44" width="0.254" layer="94"/>
<wire x1="101.6" y1="91.44" x2="132.08" y2="91.44" width="0.254" layer="94"/>
<wire x1="137.16" y1="88.9" x2="132.08" y2="93.98" width="0.254" layer="94"/>
<wire x1="132.08" y1="93.98" x2="132.08" y2="91.44" width="0.254" layer="94"/>
<wire x1="132.08" y1="86.36" x2="132.08" y2="83.82" width="0.254" layer="94"/>
<wire x1="132.08" y1="83.82" x2="137.16" y2="88.9" width="0.254" layer="94"/>
<text x="157.48" y="96.52" size="5.08" layer="94" align="center">Netzteil</text>
<wire x1="76.2" y1="68.58" x2="76.2" y2="101.6" width="0.254" layer="94"/>
<wire x1="76.2" y1="101.6" x2="132.08" y2="101.6" width="0.254" layer="94"/>
<wire x1="71.12" y1="68.58" x2="71.12" y2="106.68" width="0.254" layer="94"/>
<wire x1="71.12" y1="106.68" x2="132.08" y2="106.68" width="0.254" layer="94"/>
<wire x1="137.16" y1="104.14" x2="132.08" y2="109.22" width="0.254" layer="94"/>
<wire x1="132.08" y1="109.22" x2="132.08" y2="106.68" width="0.254" layer="94"/>
<wire x1="132.08" y1="101.6" x2="132.08" y2="99.06" width="0.254" layer="94"/>
<wire x1="132.08" y1="99.06" x2="137.16" y2="104.14" width="0.254" layer="94"/>
<wire x1="71.12" y1="68.58" x2="76.2" y2="68.58" width="0.254" layer="94"/>
<text x="215.9" y="96.52" size="5.08" layer="94" align="center">Filterung</text>
<text x="274.32" y="96.52" size="5.08" layer="94" align="center">Betries-
spannung</text>
<text x="195.58" y="149.86" size="10.16" layer="94" align="center">DDS-Signalgenerator ©2014 Hendrik Lüth</text>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="40.64" y="53.34"/>
<instance part="U$2" gate="G$1" x="71.12" y="53.34"/>
<instance part="U$3" gate="G$1" x="104.14" y="53.34"/>
<instance part="U$4" gate="G$1" x="104.14" y="-5.08"/>
<instance part="U$5" gate="G$1" x="104.14" y="22.86" rot="R270"/>
<instance part="U$6" gate="G$1" x="139.7" y="-5.08"/>
<instance part="U$7" gate="G$1" x="170.18" y="-5.08"/>
<instance part="U$8" gate="G$1" x="200.66" y="-5.08"/>
<instance part="U$9" gate="G$1" x="228.6" y="-5.08"/>
<instance part="U$10" gate="G$1" x="228.6" y="53.34"/>
<instance part="U$11" gate="G$1" x="228.6" y="22.86" rot="R270"/>
<instance part="U$12" gate="G$1" x="287.02" y="-5.08"/>
<instance part="U$13" gate="G$1" x="259.08" y="-5.08"/>
<instance part="U$14" gate="G$1" x="345.44" y="-5.08"/>
<instance part="U$15" gate="G$1" x="317.5" y="-5.08"/>
<instance part="U$16" gate="G$1" x="157.48" y="96.52"/>
<instance part="U$17" gate="G$1" x="187.96" y="96.52"/>
<instance part="U$18" gate="G$1" x="215.9" y="96.52"/>
<instance part="U$19" gate="G$1" x="274.32" y="96.52"/>
<instance part="U$20" gate="G$1" x="246.38" y="96.52"/>
</instances>
<busses>
</busses>
<nets>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="6.3" minversion="6.2.2" severity="warning">
Since Version 6.2.2 text objects can contain more than one line,
which will not be processed correctly with this version.
</note>
</compatibility>
</eagle>
