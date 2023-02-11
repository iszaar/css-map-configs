BossHpBar <- 20;

ticking <- false;

TickRate <- 0.05;

BossHealth <- 0.00;

ChangeHealth <- 0.00;


function AddHealth(add_amount)
{
	local p = null;
	local added_health = 0;
	while(null != (p = Entities.FindByClassname(p, "player")))
	{
	    if(p.GetTeam() == 3 && p.GetHealth() > 0 && p.IsValid())
		{
			added_health += add_amount;
			if (added_health >= 400) break;
		}
	}
	BossHealth += added_health;
	ChangeHealth += added_health
	Start();
}

// function HpBarFrame(Frame){if(BossHpBar==0)BossHpBar = Frame;}

function ChangeHp()
{
	if(BossHealth <= 0){HpBar();BossHpBar--;BossHealth += ChangeHealth;}
	else if(BossHpBar<=0){BossKill();ticking=false;}
}

function HpBar()
{
	if(self.GetName() == "AutismHitbox"){EntFire("AutismHPBarToggle", "IncrementTextureIndex", "", 0.00, null);}
	if(self.GetName() == "DodgeChargerHitbox"){EntFire("DodgeChargerHPBarToggle", "IncrementTextureIndex", "", 0.00, null);}
	else{EntFire("Boss_HealthTexture", "IncrementTextureIndex", "", 0.00, null);}
	return;
}


function Start(){ticking = true;Tick();}

function Tick()
{
	if(ticking)
	{
		EntFireByHandle(self, "RunScriptCode", "Tick()", TickRate, null, null);
		EntFireByHandle(self, "RunScriptCode", "ChangeHp()", 0.00, null, null);
	}
}

function SubtractHealth(){BossHealth--;}

function GrenadeDamage(he){BossHealth -= he;}

function SubHpIt(i){BossHealth -= i;}

function BossKill()
{
	local bosskill = Entities.FindByName(null,"BossEnds_Case");
	if(self.GetName() == "AutismHitbox")
	{
		local relay_autism = Entities.FindByName(null,"QwerpifloomCounter3");
		EntFireByHandle(relay_autism, "Trigger", "", 0.00, null, null);
	}
	if(self.GetName() == "DodgeChargerHitbox")
	{
		local relay_charger = Entities.FindByName(null,"ChargerCounter3");
		EntFireByHandle(relay_charger, "Trigger", "", 0.00, null, null);
	}
	if(self.GetName() == "DevilHitbox"){EntFireByHandle(bosskill, "InValue", "1", 0.00, null, null);}
	if(self.GetName() == "isisHitbox"){EntFireByHandle(bosskill, "InValue", "2", 0.00, null, null);}
	if(self.GetName() == "GrapeSoda_HitBox"){EntFireByHandle(bosskill, "InValue", "3", 0.00, null, null);}
    if(self.GetName() == "GarbageDisposal_Hitbox"){EntFireByHandle(bosskill, "InValue", "4", 0.00, null, null);}
	if(self.GetName() == "KingPoncherHitbox"){EntFireByHandle(bosskill, "InValue", "6", 0.00, null, null);}
	if(self.GetName() == "SSJPoncherHitbox"){EntFireByHandle(bosskill, "InValue", "7", 0.00, null, null);}
	if(self.GetName() == "Vacuum_HitBox"){EntFireByHandle(bosskill, "InValue", "8", 0.00, null, null);}
	if(self.GetName() == "Rko_HitBox"){EntFireByHandle(bosskill, "InValue", "9", 0.00, null, null);}
}
