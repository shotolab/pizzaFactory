Write-Output 'Welcome to Pizza Factory'

# Initialization

$totalOptions = 2

$crust = [ordered]@{
    0 = 'Thin'
    1 = 'Hand tossed'
    2 = 'Deep dish'
}

$sauce = [ordered]@{
    0 = 'Red'
    1 = 'Spicy Red'
    2 = 'Pesto'
}

$crustMasterIndex = Get-Random -Maximum 3
$sauceMasterIndex = Get-Random -Maximum 3


$crustMaster = $crust[$crustMasterIndex]
$sauceMaster = $sauce[$sauceMasterIndex]
#debug
#Write-Output $crustMaster
#Write-Output $sauceMaster
#debug

# Initialization

$ready = Read-Host 'Ready to play (y/n)?'

if ($ready.ToUpper() -eq 'N') { exit }
$ready

$guessIteration = 0
$correctGuesses = 0

while ($correctGuesses -lt $totalOptions) {
    $correctGuesses = 0
    $guessIteration = $guessIteration + 1
    Write-Output "`r`nGuess $guessIteration"

    # Select Crust
    $crust | Format-Table
    
    $crustSelectionIndex = -1
    $crustSelectionObject = $null

    while (!$crustSelectionObject) {
        $crustSelectionIndex = Read-Host "Choose a number representing the crust type: (0-$($crust.count - 1))"
        $crustSelectionIndex = $crustSelectionIndex -as [int]
        $crustSelectionObject = $crust[$crustSelectionIndex]
    
        if (!$crustSelectionObject) {
            Write-Output 'Invalid entry, please try again'
        }
    }
    
    Write-Output "You selected $($crustSelectionObject) crust."
    
    if ($crustSelectionIndex -eq $crustMasterIndex) {
        $correctGuesses = $correctGuesses + 1        
    }
    # Select Crust

    # Select Sauce
    $sauce | Format-Table
    
    $sauceSelectionIndex = -1
    $sauceSelectionObject = $null

    while (!$sauceSelectionObject) {
        $sauceSelectionIndex = Read-Host "Choose a number representing the sauce type: (0-$($sauce.count - 1))"
        $sauceSelectionIndex = $sauceSelectionIndex -as [int]
        #Write-Output "** $sauceSelectionIndex **"
        $sauceSelectionObject = $sauce[$sauceSelectionIndex]
    
        if (!$sauceSelectionObject) {
            Write-Output 'Invalid entry, please try again'
        }
    }
    
    Write-Output "You selected $($sauceSelectionObject) sauce."
    
    if ($sauceSelectionIndex -eq $sauceMasterIndex) {
        $correctGuesses = $correctGuesses + 1        
    }
    # Select Sauce

    Write-Output "You got $correctGuesses correct."
}

Write-Output 'You WIN!'

