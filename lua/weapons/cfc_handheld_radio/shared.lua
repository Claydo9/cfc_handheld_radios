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
    SWEP.PrintName                        = "Walkie Talkie" 
    SWEP.Category                         = "CFC"

    SWEP.Slot                             = 1
    SWEP.SlotPos                          = 1

    SWEP.DrawCrosshair                    = false
    SWEP.DrawAmmo                         = false

    local resX, resY                      = ScrW(), ScrH()
    local scale                           = 2.7
    local talkieScale, talkieScaleY       = 8, 2.4
    local padding                         = 10
    local handheldImage

    function SWEP:Deploy( )
        if handheldImage ~= nil then return end
        handheldImage          = vgui.Create( "DImage" )
        handheldImage:SetImage( handheldActive and "materials/cfc_handheld_images/baofeng_on.png" or "materials/cfc_handheld_images/baofeng_off.png" )
        handheldImage:SetSize( ( resX / talkieScale ) - padding, ( resY / talkieScaleY ) - padding )
        handheldImage:SetPos( ( resX - handheldImage:GetWide( ) ) - padding, ( resY - handheldImage:GetTall( ) ) - padding )
        handheldImage:SetVisible( true )

        return true
    end

    function SWEP:Holster( )
        if not handheldImage then return end
        handheldImage:Remove()
        handheldImage = nil
        return true
    end 
    function SWEP:PrimaryAttack( )
        handheldActive = not handheldActive

        if not handheldImage then return end

        handheldImage:SetImage( handheldActive and "materials/cfc_handheld_images/baofeng_on.vtf" or "materials/cfc_handheld_images/baofeng_off.vtf" )
    end

    function SWEP:SecondaryAttack( )
        if not handheldActive or handheldVguiExists then return end

        local tunerBase        = vgui.Create( "DFrame" )
        tunerBase:SetSize( ( resX / scale ) - padding, ( resY / scale ) - padding )
        tunerBase:SetPos( ( resX - tunerBase:GetWide( ) ) - padding, ( resY - tunerBase:GetTall( ) ) - padding )
        tunerBase:SetVisible( true ) 
        tunerBase:SetDraggable( true )
        tunerBase:MakePopup( )
    end

    function SWEP:TakePrimaryAmmo( )
        return 
    end 
end

if SERVER then
    function SWEP:PrimaryAttack( )
        return
    end 

    function SWEP:SecondaryAttack( )
        return
    end 

    function SWEP:TakePrimaryAmmo( )
        return
    end
end