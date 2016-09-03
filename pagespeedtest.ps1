# Page speed test
# Tests how long it takes for a web page to load
#
# (c) 2016 Jeremy Morgan
# GNU General Public License (GPL) 3.0

param (
    [string]$url = $( Read-Host "Please enter a URL to test: " )
 )

if ((!$string -contains 'http://') -Or (!$string -contains 'https://')) { 

    $url = "http://" + $url
}

$timeTaken = Measure-Command -Expression {
  $site = Invoke-WebRequest -Uri $url
}

$seconds = [Math]::Round($timeTaken.TotalSeconds, 4)

"The page took $seconds seconds to load"