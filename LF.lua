local LF_VERSION = "0.4.2"
local worldN;
local LFGN;
local COLOR_GREY = '|caa88aa88'
local COLOR_BLACK = '|c00000000'
local COLOR_WHITE = '|cffffffff'
local COLOR_RED = '|cffff222a'
local COLOR_ORANGE = '|cffff8000'
local COLOR_YELLOW = '|cffffff00'
local COLOR_GREEN = '|cff1fba1f'
local COLOR_HUNTER = '|cffabd473'
local COLOR_GREEN2 = '|cff00ff00'
local COLOR_BLUE = '|cff0070de'
local COLOR_PINK = '|c00FF23CC'
local COLOR_TURQUOISE = '|cff00ff99'
local COLOR_DISABLED = '|cffaaaaaa'
local COLOR_DISABLED2 = '|cff666666'
local COLOR_TANK = COLOR_BLUE
local COLOR_HEALER = COLOR_GREEN
local COLOR_DAMAGE = COLOR_RED

function LF_OnLoad() 
	
    if not LF_CONFIG then
        LF_CONFIG = {}
        LF_CONFIG['spamChat'] = true
        LF_CONFIG['FilterLFG'] = true
        LF_CONFIG['FilterName'] = "";
    end
	
	local ix;
	for ix=1,10 do 
		id,name = GetChannelName(ix);
		if name == "world" then 
			worldN=id; 
			-- DEFAULT_CHAT_FRAME:AddMessage("LF loaded. Number world="..id);
			break;
		end;
	end;
	for ix=1,10 do 
		id,name = GetChannelName(ix);
		if name == "LookingForGroup" then 
			LFGN=id; 
			-- DEFAULT_CHAT_FRAME:AddMessage("LF loaded. Number LookingForGroup="..id);
			break;
		end;
	end;
	DEFAULT_CHAT_FRAME:AddMessage("LF "..LF_VERSION.."loaded.");
end;

SLASH_LF1 = "/LF"
SlashCmdList["LF"] = function(cmd)
    -- if cmd then 
        if string.len(cmd) == 0 then 
            LF_CONFIG['spamChat'] = not LF_CONFIG['spamChat']
            if LF_CONFIG['spamChat'] then 
                DEFAULT_CHAT_FRAME:AddMessage(COLOR_HUNTER .. "[LF spam is on]")
            else 
                DEFAULT_CHAT_FRAME:AddMessage(COLOR_HUNTER .. "[LF spam is off]")
            end;
        else 
			if string.sub(string.lower(cmd), 1, 4) == "lfg" then 
				LF_CONFIG['FilterLFG'] = not LF_CONFIG['FilterLFG']
				if LF_CONFIG['FilterLFG'] then 
					DEFAULT_CHAT_FRAME:AddMessage(COLOR_HUNTER .. "[LFG spam is on]")
				else 
					DEFAULT_CHAT_FRAME:AddMessage(COLOR_HUNTER .. "[LFG spam is off]")
				end;
			else 
				if string.find(cmd,"nil") then 
					LF_CONFIG['FilterName'] = false;
					DEFAULT_CHAT_FRAME:AddMessage(COLOR_HUNTER .. "Filter set: nil");
				else 
					LF_CONFIG['FilterName'] = cmd;
					DEFAULT_CHAT_FRAME:AddMessage(COLOR_HUNTER .. "Filter set: "..LF_CONFIG['FilterName']);
				end;
			end;
		end;
    -- end;
end;

function LF_OnEvent(event, arg1)
	
	if event == "CHAT_MSG_CHANNEL" and LF_CONFIG['spamChat']then 
		local role0,role1,role2,role3,comma1,comma2,HC,man,sum="","","","","","","","","";local inst;local str=string.lower(arg1);
		-- if arg8 == worldN or arg8==LFGN then 
		if arg9 == "LookingForGroup" or arg9 == "world" then 
			if (strfind(str,"lfm",1,true) or strfind(str,"lf.m",1,true) or strfind(str," lf ",1,true) or strfind(str,"looking for",1,true) or strfind(string.sub(str, 1, 2),"lf",1,true)) then 
			-- DEFAULT_CHAT_FRAME:AddMessage("\124cff00ff99"..arg2.."\124r".." - ".."\124cFFC2C050"..arg1.."\124r")
				-- arg1=string.lower(arg1);
				if strfind(str,"ragefire chasm") or strfind(str," rfc") then inst="Ragefire Chasm";end;
				if strfind(str,"wailing caverns") or strfind(arg1," WC") then inst="Wailing Caverns";end;
				if strfind(str,"deadmines") or strfind(arg1," DM") then inst="The Deadmines";end;
				if strfind(str,"stockade") or strfind(str," stock") then inst="The Stockade";end;
				if strfind(str,"shadowfang keep") or strfind(str," sfk") then inst="Shadowfang Keep";end;
				if strfind(str,"blackfathom deep") or strfind(str," bfd") then inst="Blackfathom Deep";end;
				if strfind(str,"scarlet monastery graveyard") or strfind(str," smg") or (strfind(arg1," SM") and (strfind(str,"grav") or strfind(str,"gy"))) then inst="Scarlet Monastery Graveyard";end;
				if strfind(str,"scarlet monastery library") or strfind(str," sml ") or (strfind(arg1," SM") and strfind(str,"lib")) then inst="Scarlet Monastery Library";end;
				if strfind(str,"gnomeregan") or strfind(str,"gnomer") then inst="Gnomeregan";end;
				if strfind(str,"razorfen kraul") or strfind(str,"rfk") then inst="Razorfen Kraul";end;
				if strfind(str,"crescent grove") or strfind(arg1," CG") or strfind(str," TCG") or strfind(str,"crescent") then inst="The Crescent Grove";end;
				if strfind(str,"scarlet monastery armory") or strfind(str," sma") or (strfind(arg1," SM") and strfind(str,"arm")) then inst="Scarlet Monastery Armory";end;
				if strfind(str,"scarlet monastery cathedral") or strfind(str," smc") or (strfind(arg1," SM") and strfind(str,"cath")) then inst="Scarlet Monastery Cathedral";end;
				if strfind(str,"razorfen downs") or strfind(str," rfd") then inst="Razorfen Downs";end;
				if strfind(str,"uldaman") or strfind(arg1," Uld") then inst="Uldaman";end;
				if strfind(str,"zul'farrak") or strfind(str,"zulfarrak") or strfind(arg1," ZF") then inst="Zul'farrak";end;
				if strfind(str,"maraudon orange") or (strfind(str," mara") and strfind(str,"orange")) then inst="Maraudon Orange";end;
				if strfind(str,"maraudon purple") or (strfind(str," mara") and strfind(str,"purple")) then inst="Maraudon Purple";end;
				if strfind(str,"maraudon princess") or (strfind(str,"mara") and strfind(str,"princess")) then inst="Maraudon Princess";end;
				if strfind(str,"maraudon full") or (strfind(str," mara") and strfind(str,"full")) then inst="Maraudon Full";end;
				if strfind(str,"temple of atal'hakkar") or strfind(arg1,"Sunken Temple") or strfind(arg1," ST") then inst="Temple of Atal'hakkar";end;
				if strfind(str,"blackrock depths") or strfind(str," brd")then inst="Blackrock Depths";end;
				if strfind(str,"blackrock depths arena") or (strfind(str," brd") and strfind(str,"arena")) then inst="Blackrock Depths Arena";end;
				if strfind(str,"blackrock depths emperor") or (strfind(str," brd") and strfind(str," emp")) then inst="Blackrock Depths Emperor";end;
				if strfind(str,"marshal escort") or (strfind(str," brd") and (strfind(str,"escort") or strfind(str,"marshal"))) or strfind(str,"jailbreak") or strfind(str,"jail break") then inst="Jail Break (Marshal escort quest)";end;
				if strfind(str,"lava run") then inst="LAVA RUN!!!!";end;
				if strfind(str,"lower blackrock spire") or strfind(str," lbrs") then inst="Lower Blackrock Spire";end;
				if strfind(str,"up blackrock spire") or strfind(str," ubrs") then inst="Up Blackrock Spire";end;
				if strfind(str,"dire maul east") or strfind(str," dme") or (strfind(str," dm") and strfind(str,"east")) then inst="Dire Maul East";end;
				if strfind(str,"dire maul west") or strfind(str," dmw") or (strfind(str," dm") and strfind(str,"west")) then inst="Dire maul West";end;
				if strfind(str,"dire maul north") or strfind(str," dmn") or (strfind(str," dm") and strfind(str,"north")) then inst="Dire Maul North";end;
				if strfind(str,"dire maul tribute") or strfind(str," dmt") or (strfind(str," dm") and strfind(str,"tribute")) then inst="Dire Maul Tribute";end;
				if strfind(str,"scholomance") or strfind(str," scholo") then inst="Scholomance";end;
				if strfind(str,"stratholme: undead district") or (strfind(str,"strat") and (strfind(str,"undead") or strfind(str,"ud"))) then inst="Stratholme: Undead district";end;
				if strfind(str,"stratholme: scarlet bastion") or (strfind(str,"strat") and (strfind(str,"scarlet") or strfind(str,"bastion") or strfind(str,"liv"))) then inst="Stratholme: Scarlet bastion";end;
				if strfind(str,"hateforge quarry") or strfind(arg1," HFQ") or strfind(str,"quarry") or (strfind(str,"hate") and strfind(str,"forge")) then inst="Hateforge Quarry";end;
				if strfind(str,"karazhan") and strfind(str,"crypt") then inst="Karazhan crypt";end;
				if strfind(str,"caverns of time") or strfind(str," cot") or strfind(str,"black morass") then inst="Caverns of time: Black Morass";end;
				if strfind(str,"stormwind vault") or strfind(str," swv") or (strfind(str," sw") and strfind(str,"vault")) then inst="Stormwind Vault";end;
				if strfind(str,"gilneas") or strfind(arg1," GS") then inst="Gilneas City";end;
				
				if strfind(str,"backwing lair") or strfind(arg1," BWL") then inst="Backwing Lair";end;
				if strfind(str,"onyxia") or strfind(arg1," Ony") or strfind(arg1," ONY") then inst="Onyxia's Lair";end;
				if strfind(str,"molten core") or strfind(arg1," MC") then inst="Molten Core";end;
				if strfind(str,"zul'gurub") or strfind(str,"zul gurub") or strfind(arg1," ZG ") then inst="Zul'Gurub";end;
				if not strfind(str,"ahn'qiraj") and (strfind(str,"ahn'qiraj") or strfind(str,"ahn qiraj") or strfind(arg1,"AQ")) then inst="Ahn'Qiraj";end;
				if strfind(str,"ruins") and (strfind(str,"ahn qiraj") or strfind(arg1,"AQ")) then inst="Ruins of Ahn'Qiraj";end;
				if strfind(str,"naxxramas") or strfind(str," naxx") then inst="Naxxramas";end;
				
				if inst and not strfind(str,"lfg") and not strfind(str,"lfr") then 
					
					inst=COLOR_HUNTER.." for "..COLOR_TURQUOISE..inst;
					if strfind(str,"hc") then 
						HC=COLOR_GREY.."HC ";
					end;
					if strfind(str,"tank") then 
						role1=COLOR_TANK.."Tank";
					end;
					if strfind(str,"heal") then 
						if strfind(str,"tank") then comma1=", ";end;
						role2=COLOR_HEALER.."Healer";
					end;
					if strfind(str,"dps") or strfind(str,"dd") then 
						if strfind(str,"tank") or strfind(str,"heal") then comma2=", ";end;
						-- role3=COLOR_DAMAGE.."Damage Dealer";
						role3=COLOR_DAMAGE.."Damage";
					end;
					if role1=="" and role2=="" and role3=="" then 
						role0=COLOR_YELLOW.."anyone";
					end;
					if strfind(str,"10m") or strfind(str,"10man") or strfind(str,"10 man") then 
						if strfind(str,"tank") or strfind(str,"heal") then comma2=", ";end;
						man=COLOR_ORANGE.." '10 man' ";
					end;
					if (strfind(str,"have") or strfind(str,"can")) and (strfind(str,"summ") or strfind(str,"summon")) then 
						sum=COLOR_ORANGE.." 'Can Summon' ";
					end;
					
					-- DEFAULT_CHAT_FRAME:AddMessage("\124cff00ff99"..arg2.."\124r"
					-- print("\124cff00ff99"..arg2.."\124r"
					
					local PrStr=COLOR_WHITE.."|Hplayer:"..arg2.."|h["..arg2.."]|h|r"
					..COLOR_HUNTER.." is looking for a "
					..HC..role0..role1..comma1..role2..comma2..role3..inst..man..sum;
					if LF_CONFIG['FilterName'] then 
						if string.find(PrStr,LF_CONFIG['FilterName']) or string.find(arg1,LF_CONFIG['FilterName']) then 
							print(PrStr);
						end;
					else
						print(PrStr);
					end;
					
					-- print(COLOR_WHITE.."|Hplayer:"..arg2.."|h["..arg2.."]|h|r"
					-- ..COLOR_HUNTER.." is looking for a "
					-- ..HC..role0..role1..comma1..role2..comma2..role3..inst..man..sum
					-- )
				end;
				
				if LF_CONFIG['FilterLFG'] and ( strfind(str,"lfg") or strfind(str,"lfr") ) then 
					-- DEFAULT_CHAT_FRAME:AddMessage("\124cffffffff"..arg2.."\124r".." - ".."\124cFFC2C050"..arg1.."\124r")
					-- print("\124cff00ff99"..arg2.."\124r".." - ".."\124cFFC2C050"..arg1.."\124r")
					print(COLOR_WHITE.."|Hplayer:"..arg2.."|h["..arg2.."]|h|r".." - "..COLOR_HUNTER..arg1.."|r")
				end;
			end;
		end;
	end;
end;
