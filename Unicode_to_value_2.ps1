cls

Remove-Variable Utf32Bytes, CodePoint -ErrorAction SilentlyContinue

$n = 9992
echo $n
$x = [char]$n
echo $x

$unicode_znak = "✈" #9992

$Utf32Bytes = [System.Text.Encoding]::UTF32.GetBytes($unicode_znak)
echo "$Utf32bytes"
echo $Utf32Bytes.GetType()
#$CodePoint = [System.BitConverter]::ToUInt32($Utf32Bytes)
$CodePoint = [System.BitConverter]::ToUInt32($Utf32Bytes,0) # For NET framework 4.x, you need 
echo $CodePoint"<<<"

sleep 10
