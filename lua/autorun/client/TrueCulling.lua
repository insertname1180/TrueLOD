jit.on()
jit.opt.start(3)

CULLFRONT = math.sin(0.64278761) -- 150 Degrees forward

num = 1

function init()
    hook.Remove("InitPostEntity", "runonce")
    ply = LocalPlayer()
	tAllEnts = ents.GetAll()
	if engine.TickCount()%3 == 0 then
		for a, e in pairs(tAllEnts) do
	 		e:SetNoDraw(true)
			if engine.TickCount()%11 == 0 then
				if util.IsPointInCone(e:GetPos(), ply:GetPos(), ply:GetAimVector(), CULLFRONT, 100000) then         
					if ply:IsLineOfSightClear(e:GetPos() + Vector(-25,-25,35)) or ply:IsLineOfSightClear(e:GetPos() + Vector(100,100,-10)) then                    
						e:SetNoDraw(false)
					end
				end
			else
				return
			end
			if engine.TickCount()%22 == 0 then
				if e:GetPos():Distance(ply:GetPos()) < 100 then
					e:SetNoDraw(false)
				end
			else
				return
			end
			if engine.TickCount()%33 == 0 then
				if e:IsPlayer() then                    
					e:SetNoDraw(false)
				end
			else
				return
			end
			if engine.TickCount()%45 == 0 then
				if e:GetClass() == "viewmodel" then
					e:SetNoDraw(false)
				end
			else
				return
			end
		end
	else
		return
	end
	return
end

hook.Add("Think", "tick", init)
hook.Add("InitPostEntity", "runonce", init)
