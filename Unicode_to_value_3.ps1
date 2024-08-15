cls

Remove-Variable x,n,unicode_znak,CodePoint,a -ErrorAction SilentlyContinue

$n = 256 # 0 1 0 0 (255 1 0 0) 
echo $n
$x = [char]$n
echo $x
echo $x.Length
echo "----------------------------"

$unicode_znak = "Ā" 
#$unicode_znak = $n
$a = [system.Text.Encoding]::UTF32.GetBytes($unicode_znak)
echo $a.GetType()
echo "$a" # 4x8 bit=32bit  takze funkce UTF32.GetBytes(); ToUInt32() 
echo $a.Length

echo $a[0] #0 
echo $a[1] #1 do bruhyho uz bajtu vlozil 1 ( tzn. 255+1)
echo $a[2] #0
echo $a[3] #0 

$CodePoint = [System.BitConverter]::ToUInt32($a,0) # For NET framework 4.x, you need 
echo $CodePoint"<<<"

sleep 10

