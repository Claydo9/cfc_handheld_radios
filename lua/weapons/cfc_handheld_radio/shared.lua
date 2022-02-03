SWEP.Author              = "Claydo9"
SWEP.Contact             = "CFC Servers"
SWEP.Instructions        = "Left click to toggle radio on/off, Right click to display tuning menu"

SWEP.Spawnable           = true 

SWEP.ViewModel           = ""
SWEP.WorldModel          = ""

SWEP.Primary.ClipSize    = 1
SWEP.Primary.Delay       = 0.5
SWEP.Primary.DefaultClip = 1
SWEP.Primary.Automatic   = false
SWEP.Primary.Ammo        = "none"

handheldActive = false
handheldVguiExists = false

if CLIENT then
    SWEP.PrintName          = "Walkie Talkie" 
    SWEP.Category           = "CFC"

    SWEP.Slot               = 1
    SWEP.SlotPos            = 1

    SWEP.DrawCrosshair      = false
    SWEP.DrawAmmo           = false

    function SWEP:PrimaryAttack()
        handheldActive = not handheldActive
        print( handheldActive )
    end

    function SWEP:SecondaryAttack()
        if not handheldActive or handheldVguiExists then return end

        local resX, resY    = ScrW(), ScrH()
        local scale         = 2.7
        local padding       = 10

        local tunerBase     = vgui.Create( "DFrame" )
        tunerBase:SetSize( ( resX / scale ) - padding, ( resY / scale ) - padding )
        tunerBase:SetPos( ( resX - tunerBase:GetWide( ) ) - padding, ( resY - tunerBase:GetTall( ) ) - padding )
        tunerBase:SetVisible( true ) 
        tunerBase:SetDraggable( true )
        tunerBase:MakePopup( )
        
    end

    function SWEP:TakePrimaryAmmo()
        return 
    end 
end

if SERVER then
    function SWEP:PrimaryAttack() 
        return
    end 

    function SWEP:SecondaryAttack() 
        return
    end 

    function SWEP:TakePrimaryAmmo()
        return
    end
end