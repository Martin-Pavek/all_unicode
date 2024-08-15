cls

Remove-Variable x,n,unicode_znak,CodePoint,a -ErrorAction SilentlyContinue

#$n = 9999
$n = 255 # takze i 255 ktery by se dalo vyjadrit 8 bitama je vyjadreny 32 bitama viz. radek 20
echo $n
$x = [char]$n
echo $x
echo $x.Length # = 1 tzn 8 bit
echo "----------------------------"

#$unicode_znak = "✏" #9992
$unicode_znak = "ÿ" #255 (8bit)
#$unicode_znak = $n # takto nefunfuje, misto 4 bitu nakopiruje pouze jeden viz radek 11
$a = [system.Text.Encoding]::UTF32.GetBytes($unicode_znak)
echo $a.GetType()
echo "$a" # 4x8 bit=32bit  takze funkce UTF32.GetBytes(); ToUInt32() 
echo $a.Length

echo $a[0] #255
echo $a[1] #0
echo $a[2] #0
echo $a[3] #0 delka pole $a = 4 (4 x 8) pozn. at je znak jakej chce tak jsou vzdy 4 prvky pole 0-3
#echo $a[4]

$CodePoint = [System.BitConverter]::ToUInt32($a,0) # For NET framework 4.x, you need 
echo $CodePoint"<<<"

sleep 10

