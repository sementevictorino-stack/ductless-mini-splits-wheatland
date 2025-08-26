# PowerShell script to efficiently transform all remaining HTML files
$basePath = "c:\Users\alooma\Desktop\staten-island-ductless-mini-splits-main\ductless mini splits wheatland"

# Define replacement mappings
$replacements = @{
    "Staten Island" = "Wheatland, WY"
    "Staten Island's" = "Wheatland's"
    "SI Ductless Pro" = "Wheatland Ductless Pro"
    "Staten Island Ductless Mini Splits" = "Wheatland WY Ductless Mini Splits"
    "123 Victory Blvd" = "123 16th Street"
    "St. George" = "Wheatland"
    "Stapleton" = "Chugwater"
    "Port Richmond" = "Guernsey"
    "Tottenville" = "Hartville"
    "Great Kills" = "Glendo"
    "New Brighton" = "Fort Laramie"
    "West Brighton" = "Lingle"
    "South Beach" = "Yoder"
    "New York" = "Wyoming"
    "NY" = "WY"
    "10301" = "82201"
    "10302" = "82201"
    "10303" = "82201"
    "10304" = "82201"
    "10305" = "82201"
    "waterfront" = "high plains"
    "island" = "region"
    "humid summers" = "warm summers"
    "winter storm" = "Wyoming blizzard"
    "brownstones" = "ranch homes"
    "ferry terminal" = "downtown area"
    "info@statenislandductless.com" = "info@wheatlandwyductless.com"
}

# Get all HTML files
$htmlFiles = Get-ChildItem -Path $basePath -Recurse -Filter "*.html"

Write-Host "Processing $($htmlFiles.Count) HTML files..."

foreach ($file in $htmlFiles) {
    Write-Host "Processing: $($file.Name)"
    
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    $originalContent = $content
    
    # Apply all replacements
    foreach ($key in $replacements.Keys) {
        $content = $content -replace [regex]::Escape($key), $replacements[$key]
    }
    
    # Only write if content changed
    if ($content -ne $originalContent) {
        Set-Content -Path $file.FullName -Value $content -Encoding UTF8
        Write-Host "  Updated: $($file.Name)"
    }
}

Write-Host "Transformation complete!"
