# PowerShell script to efficiently transform all remaining HTML files
# From Staten Island HVAC to Wheatland, WY Ductless Mini Splits

$basePath = "c:\Users\alooma\Desktop\staten-island-ductless-mini-splits-main\ductless mini splits wheatland"

# Define replacement mappings
$replacements = @{
    "Staten Island" = "Wheatland, WY"
    "Staten Island's" = "Wheatland's"
    "Staten Island," = "Wheatland,"
    "Staten Island." = "Wheatland."
    "Staten Island zip codes" = "Wheatland and surrounding areas"
    "Staten Island neighborhoods" = "Wheatland region"
    "Staten Island residents" = "Wheatland residents"
    "Staten Island businesses" = "Wheatland businesses"
    "Staten Island properties" = "Wheatland properties"
    "Staten Island homes" = "Wheatland homes"
    "Staten Island community" = "Wheatland community"
    "Staten Island area" = "Wheatland area"
    
    # Geographic references
    "New York" = "Wyoming"
    "New York's" = "Wyoming's"
    "NY" = "WY"
    "10301" = "82201"
    "10302" = "82201"
    "10303" = "82201"
    "10304" = "82201"
    "10305" = "82201"
    "10306" = "82201"
    "10307" = "82201"
    "10308" = "82201"
    "10309" = "82201"
    "10310" = "82201"
    "10311" = "82201"
    "10312" = "82201"
    "10313" = "82201"
    "10314" = "82201"
    
    # Company name updates
    "SI Ductless Pro" = "Wheatland Ductless Pro"
    "Staten Island Ductless Mini Splits" = "Wheatland WY Ductless Mini Splits"
    
    # Address updates
    "123 Victory Blvd" = "123 16th Street"
    "Victory Blvd" = "16th Street"
    
    # Location-specific updates
    "St. George" = "Wheatland"
    "Stapleton" = "Chugwater"
    "Port Richmond" = "Guernsey"
    "Tottenville" = "Hartville"
    "Great Kills" = "Glendo"
    "New Brighton" = "Fort Laramie"
    "West Brighton" = "Lingle"
    "South Beach" = "Yoder"
    
    # Climate and geographic references
    "waterfront" = "high plains"
    "harbor" = "prairie"
    "island" = "region"
    "humid summers" = "warm summers"
    "winter storm" = "Wyoming blizzard"
    "brownstones" = "ranch homes"
    "condominiums" = "rural properties"
    "ferry terminal" = "downtown area"
    
    # Service focus updates
    "HVAC services" = "ductless mini split services"
    "heating and cooling" = "ductless mini split heating and cooling"
    "HVAC systems" = "ductless mini split systems"
    "HVAC repair" = "ductless mini split repair"
    "HVAC installation" = "ductless mini split installation"
    "HVAC maintenance" = "ductless mini split maintenance"
    "HVAC technicians" = "ductless mini split technicians"
    "HVAC equipment" = "ductless mini split equipment"
    "HVAC emergency" = "ductless mini split emergency"
    
    # Email and web updates
    "info@statenislandductless.com" = "info@wheatlandwyductless.com"
    "statenislandductless.com" = "wheatlandwyductless.com"
    "facebook.com/statenislandductless" = "facebook.com/wheatlandwyductless"
    "instagram.com/statenislandductless" = "instagram.com/wheatlandwyductless"
}

# Get all HTML files
$htmlFiles = Get-ChildItem -Path $basePath -Recurse -Filter "*.html"

Write-Host "Starting transformation of $($htmlFiles.Count) HTML files..."

foreach ($file in $htmlFiles) {
    Write-Host "Processing: $($file.Name)"
    
    try {
        $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
        $originalContent = $content
        
        # Apply all replacements
        foreach ($key in $replacements.Keys) {
            $content = $content -replace [regex]::Escape($key), $replacements[$key]
        }
        
        # Only write if content changed
        if ($content -ne $originalContent) {
            Set-Content -Path $file.FullName -Value $content -Encoding UTF8
            Write-Host "  ✓ Updated: $($file.Name)"
        } else {
            Write-Host "  - No changes needed: $($file.Name)"
        }
    }
    catch {
        Write-Host "  ✗ Error processing $($file.Name): $($_.Exception.Message)"
    }
}

Write-Host "`nTransformation complete!"
Write-Host "All files have been updated for Wheatland, WY Ductless Mini Split services."
