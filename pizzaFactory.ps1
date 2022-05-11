Write-Output 'Welcome to Pizza Factory'

# Initialization

$totalOptions = 4

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

$meat = [ordered]@{
    0 = 'Pepperoni'
    1 = 'Sausage'
    2 = 'Ham'
}

$produce = [ordered]@{
    0 = 'Green Pepper'
    1 = 'Onion'
    2 = 'Pineapple'
}

$crustMasterIndex = Get-Random -Maximum 3
$sauceMasterIndex = Get-Random -Maximum 3
$meatMasterIndex = Get-Random -Maximum 3
$produceMasterIndex = Get-Random -Maximum 3

$crustMaster = $crust[$crustMasterIndex]
$sauceMaster = $sauce[$sauceMasterIndex]
$meatMaster = $meat[$meatMasterIndex]
$produceMaster = $produce[$produceMasterIndex]
#debug
Write-Output $crustMaster
Write-Output $sauceMaster
Write-Output $meatMaster
Write-Output $produceMaster
#debug

# Initialization

$ready = Read-Host 'Would you like to play a game (y/n)?'

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

    # Select Meat
    $meat | Format-Table
    
    $meatSelectionIndex = -1
    $meatSelectionObject = $null

    while (!$meatSelectionObject) {
        $meatSelectionIndex = Read-Host "Choose a number representing the meat type: (0-$($meat.count - 1))"
        $meatSelectionIndex = $meatSelectionIndex -as [int]
        #Write-Output "** $meatSelectionIndex **"
        $meatSelectionObject = $meat[$meatSelectionIndex]
    
        if (!$meatSelectionObject) {
            Write-Output 'Invalid entry, please try again'
        }
    }
    
    Write-Output "You selected $($meatSelectionObject) meat."
    
    if ($meatSelectionIndex -eq $meatMasterIndex) {
        $correctGuesses = $correctGuesses + 1        
    }
    # Select Meat

    # Select Produce
    $produce | Format-Table
    
    $produceSelectionIndex = -1
    $produceSelectionObject = $null

    while (!$produceSelectionObject) {
        $produceSelectionIndex = Read-Host "Choose a number representing the produce type: (0-$($produce.count - 1))"
        $produceSelectionIndex = $produceSelectionIndex -as [int]
        #Write-Output "** $produceSelectionIndex **"
        $produceSelectionObject = $produce[$produceSelectionIndex]
    
        if (!$produceSelectionObject) {
            Write-Output 'Invalid entry, please try again'
        }
    }
    
    Write-Output "You selected $($produceSelectionObject) produce."
    
    if ($produceSelectionIndex -eq $produceMasterIndex) {
        $correctGuesses = $correctGuesses + 1        
    }
    # Select Produce

    Write-Output "You got $correctGuesses correct."
}

Write-Output 'You WIN!'
if ($guessIteration -eq 1) {
    Write-Output "Perfect Game! It only took you 1 guess!."
} else {
    Write-Output "It took you $guessIteration guesses.`r`nSee if you can do it again in fewer guesses."
}