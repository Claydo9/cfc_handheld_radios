AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include( "shared.lua" )

handheld_active = false
handheld_vgui_exists = false
function SWEP:PrimaryAttack()
    self:SetNextPrimaryFire( CurTime() + self.Primary.Delay )

    if not self:CanPrimaryAttack() then return end

    handheld_active = not handheld_active or false
end 

function SWEP:SecondaryAttack()
    if handheld_vgui_exists then return end 

        
end

function SWEP:TakePrimaryAmmo()
    return
end