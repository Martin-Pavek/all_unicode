cls
Clear-Variable out_1, uni_1, radek, aa -ErrorAction SilentlyContinue
$out_1 = @()

for ( $aa = 128; $aa -lt 55291; $aa++ ) {
$radek = "Char $aa : $([char]$aa)"
echo $radek
$out_1 += $radek
}

echo $out_1.Length

Set-Content -Path  R:\all_unicode.txt -Encoding Unicode -Value $out_1
echo "hotovo"
sleep 5

