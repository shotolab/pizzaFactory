Write-Output "`r`nWelcome to The Pizza Factory`r`n"

# Initialization

$totalOptions = 4

$crust = @(
    [pscustomobject]@{Number=1; Name='Thin'}
    [pscustomobject]@{Number=2; Name='Hand Tossed'}
    [pscustomobject]@{Number=3; Name='Deep Dish'}
)

$sauce = @(
    [pscustomobject]@{Number=1; Name='Red'}
    [pscustomobject]@{Number=2; Name='Spicy Red'}
    [pscustomobject]@{Number=3; Name='Pesto'}
)

$meat = @(
    [pscustomobject]@{Number=1; Name='Pepperoni'}
    [pscustomobject]@{Number=2; Name='Sausage'}
    [pscustomobject]@{Number=3; Name='Ham'}
)

$produce = @(
    [pscustomobject]@{Number=1; Name='Green Pepper'}
    [pscustomobject]@{Number=2; Name='Onion'}
    [pscustomobject]@{Number=3; Name='Pineapple'}
)

$crustMasterIndex = Get-Random -Maximum 3 -Minimum 0
$sauceMasterIndex = Get-Random -Maximum 3 -Minimum 0
$meatMasterIndex = Get-Random -Maximum 3 -Minimum 0
$produceMasterIndex = Get-Random -Maximum 3 -Minimum 0

$crustMaster = $crust[$crustMasterIndex]
$sauceMaster = $sauce[$sauceMasterIndex]
$meatMaster = $meat[$meatMasterIndex]
$produceMaster = $produce[$produceMasterIndex]
#debug
#Write-Output $crustMaster
#Write-Output $sauceMaster
#Write-Output $meatMaster
#Write-Output $produceMaster
#debug

$guessHistory = @()

# Initialization

$ready = Read-Host 'Shall we play a game (y/n)?'
Write-Host @"
`r`n
Your job is to guess the pizza ingredients the customer has selected. Each 
time, the customer will provide feedback on how many ingredients you got correct.
It's your job to determine which ones are correct.
Try to guess as few times as possible to figure out the customer's order.
"@ 

if ($ready.ToUpper() -eq 'N') { exit }

$guessIteration = 0
$correctGuesses = 0

while ($correctGuesses -lt $totalOptions) {
    $guess = $null
    $correctGuesses = 0
    $guessIteration = $guessIteration + 1
    Write-Output "`r`nGuess $guessIteration"

    # Select Crust
    $crust | Format-Table
    
    $crustSelectionIndex = -1
    $crustSelectionObject = $null

    while (!$crustSelectionObject) {
        $crustSelectionIndex = Read-Host "Choose a number representing the crust type: (1-$($crust.count))"
        $crustSelectionIndex = $($crustSelectionIndex -as [int]) - 1
        $crustSelectionObject = $crust[$crustSelectionIndex]
    
        if (!$crustSelectionObject) {
            Write-Output 'Invalid entry, please try again'
        }
    }
    
    Write-Output "You selected $($crustSelectionObject.Name) crust."
    
    if ($crustSelectionIndex -eq $crustMasterIndex) {
        $correctGuesses = $correctGuesses + 1        
    }
    # Select Crust

    # Select Sauce
    $sauce | Format-Table
    
    $sauceSelectionIndex = -1
    $sauceSelectionObject = $null

    while (!$sauceSelectionObject) {
        $sauceSelectionIndex = Read-Host "Choose a number representing the sauce type: (1-$($sauce.count))"
        $sauceSelectionIndex = $($sauceSelectionIndex -as [int]) - 1
        #Write-Output "** $sauceSelectionIndex **"
        $sauceSelectionObject = $sauce[$sauceSelectionIndex]
    
        if (!$sauceSelectionObject) {
            Write-Output 'Invalid entry, please try again'
        }
    }
    
    Write-Output "You selected $($sauceSelectionObject.Name) sauce."
    
    if ($sauceSelectionIndex -eq $sauceMasterIndex) {
        $correctGuesses = $correctGuesses + 1        
    }
    # Select Sauce

    # Select Meat
    $meat | Format-Table
    
    $meatSelectionIndex = -1
    $meatSelectionObject = $null

    while (!$meatSelectionObject) {
        $meatSelectionIndex = Read-Host "Choose a number representing the meat type: (1-$($meat.count))"
        $meatSelectionIndex = $($meatSelectionIndex -as [int]) - 1
        #Write-Output "** $meatSelectionIndex **"
        $meatSelectionObject = $meat[$meatSelectionIndex]
    
        if (!$meatSelectionObject) {
            Write-Output 'Invalid entry, please try again'
        }
    }
    
    Write-Output "You selected $($meatSelectionObject.Name) meat."
    
    if ($meatSelectionIndex -eq $meatMasterIndex) {
        $correctGuesses = $correctGuesses + 1        
    }
    # Select Meat

    # Select Produce
    $produce | Format-Table
    
    $produceSelectionIndex = -1
    $produceSelectionObject = $null

    while (!$produceSelectionObject) {
        $produceSelectionIndex = Read-Host "Choose a number representing the produce type: (1-$($produce.count))"
        $produceSelectionIndex = $($produceSelectionIndex -as [int]) - 1
        #Write-Output "** $produceSelectionIndex **"
        $produceSelectionObject = $produce[$produceSelectionIndex]
    
        if (!$produceSelectionObject) {
            Write-Output 'Invalid entry, please try again'
        }
    }
    
    Write-Output "You selected $($produceSelectionObject.Name) produce."
    
    if ($produceSelectionIndex -eq $produceMasterIndex) {
        $correctGuesses = $correctGuesses + 1        
    }
    # Select Produce

    $guess = [pscustomobject]@{
        iteration = $guessIteration
        crust = $crustSelectionObject.Name
        sauce = $sauceSelectionObject.Name
        meat = $meatSelectionObject.Name
        produce = $produceSelectionObject.Name
        correct = $correctGuesses
    }
    $guessHistory += $guess

    Write-Output "`r`nYou got $correctGuesses correct.`r`n"
    Write-Output 'Previous guesses:'
    Write-Output $guessHistory | Format-Table

}

Write-Output 'You WIN!'
if ($guessIteration -eq 1) {
    Write-Output "Perfect Game! It only took you 1 guess!."
} else {
    Write-Output "It took you $guessIteration guesses.`r`nTry to do it again in fewer guesses."
}