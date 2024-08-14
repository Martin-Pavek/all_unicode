cls
# show Unicone 16-bit

Clear-Variable out_1, uni_1, radek, aa -ErrorAction SilentlyContinue

$out_1 = @()

for ( $aa = 128; $aa -lt 55291; $aa++ ) {

<#
echo $aa
$uni_1 = $([char]$aa) # type char
echo $uni_1
#>

$radek = "Char $aa : $([char]$aa)"
#$radek = "$([char]$aa)" # type string 
echo $radek

$out_1 += $radek
#"Char $aa : $([char]$aa)"

}

echo $out_1.Length

Set-Content -Path  R:\all_unicode.txt -Encoding Unicode -Value $out_1
echo "hotovo"
sleep 5

