cls
# show Unicone 16-bit

Clear-Variable out_1,min,max,file,radek,znaku_na_radku,velikost_fontu,pocitadlo_1,aa,zapsano_posledni_tr -ErrorAction SilentlyContinue

#####################################################################################
$max = 55291 # uplne posledni znak
$min = 128 # do 127 je tabulka ascii
#$max = 128+999
#$min = (55291-20)
#$max = (55291+20)
$znaku_na_radku = 40 # bude 40 znaku na jednom vodorovnem radku v html
#$velikost_fontu = 100
$velikost_fontu = 25 # velikost pismen v prohlizeci
#$file = "R:\all_unicode.txt"
$file = "R:\all_unicode.html"
#$file = "c:\work\all_unicode.html"
#####################################################################################

$out_1 = @()
# hlavicka html
$out_1 += "<!DOCTYPE html>"
$out_1 += "<html>"
$out_1 += "<body>"
$out_1 += "<table>"
$out_1 += ""

$tr = " <tr>"
$tr_end = " </tr>"

$th = "  <th>"
$th_end = "</th>"

#$span = "<span style='font-size:100px;'>"
$span = "<span style='font-size:"
$span += [string] $velikost_fontu
$span += "px;'>"

$span_end = "</span>"

$komentar = "<!-- "
$komentar_end = " -->"

$pocitadlo_1 = 1
$zapsano_posledni_tr = 0

# for ( $aa = 128; $aa -lt 15000; $aa++ ) {
for ( $aa = $min; $aa -lt $max; $aa++ ){
# 127 posledni znak ascii

if ( $pocitadlo_1 -eq 1 ){
#$out_1 += ""
$out_1 += $tr
$zapsano_posledni_tr = 0
}

[string] $radek_tabulka_html = ""
# <th><span style='font-size:100px;'>&#9998;</span></th>
$radek_tabulka_html += $th
$radek_tabulka_html += $span
$radek_tabulka_html += "&#"

[string] $cislo_znak_unicode = $aa
#echo $cislo_znak_unicode

$radek_tabulka_html += $cislo_znak_unicode
$radek_tabulka_html += ";"
$radek_tabulka_html += $span_end
$radek_tabulka_html += $th_end
# prida komentar na radek
$radek_tabulka_html += $komentar
$radek_tabulka_html += $cislo_znak_unicode
$radek_tabulka_html += $komentar_end


#echo $radek_tabulka_html
$out_1 += $radek_tabulka_html

#$radek = "Char $aa : $([char]$aa)"
#echo $radek
#$out_1 += $radek


$pocitadlo_1++
if ( $pocitadlo_1 -gt $znaku_na_radku ) {
$pocitadlo_1 = 1
$out_1 += $tr_end
$out_1 += ""
$zapsano_posledni_tr = 1
}

}

# prida do tabulky paticku html
#$out_1 += ""
if ( $zapsano_posledni_tr -eq 0 ) {
$out_1 += $tr_end
$out_1 += ""
}
$out_1 += "</table>"
$out_1 += "</body>"
$out_1 += "</html>"
#

echo $out_1
echo ""
$out_2 = "celkem zapsanich radku do html = " 
$out_2 += $out_1.Length
echo $out_2

Set-Content -Path  $file -Encoding Unicode -Value $out_1 # na ramdisk
#Set-Content -Path  $file -Encoding Unicode -Value $out_1
Clear-Variable out_1 -ErrorAction SilentlyContinue
echo "otevrit v prohlizeci soubor $file"
sleep 5


<# jak bude vypadat html tabulka
<!DOCTYPE html>
<html>
<body>
<table>

 <tr>
  <th><span style='font-size:100px;'>&#9992;</span></th><!-- comment cislo znaku v dec-->
  <th><span style='font-size:100px;'>&#9993;</span></th>
  <th><span style='font-size:100px;'>&#9994;</span></th>
 </tr>

 <tr>
    <th><span style='font-size:100px;'>&#9995;</span></th>
    <th><span style='font-size:100px;'>&#9996;</span></th>
    <th><span style='font-size:100px;'>&#9997;</span></th>
 </tr>

 <tr>
    <th><span style='font-size:100px;'>&#9998;</span></th>
    <th><span style='font-size:100px;'>&#9999;</span></th>
    <th><span style='font-size:100px;'>&#10000;</span></th>
 </tr>

</table>
</body>
</html>

#>

