--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest weapon_quest_lv10 begin
	state start begin
	end
	state run begin
		when login or levelup or enter with pc.level >= 10 begin
			set_state(information)
		end
	end
	state information begin
		when letter begin
			send_letter("~Gen� Kahramanlar ��in Silahlar")
		end
		
		when button or info begin
			say_title("Gen� kahramanlar i�in silahlar")
			say("")
			say("Gen� kahraman en cesur sava��� olarak nam sald�n")
			say("ama hala tecr�be ve g�ce ihtiyac�n var. Ejderha")
			say("Tanr�s� bu krall���n umudu olarak seni koruyup")
			say("kollayacak ve sana maceralar�nda belli bir s�re")
			say("kullanabilece�in bir silah sunacak.")
			wait()
			say_title("Silah�n� Se�: ")
			if pc.job == 0 then
				say_item_vnum_ex(get_changing_weapon(0, 3), 0, 2)
				say_item_vnum_ex(get_changing_weapon(0, 4), 1, 2)
				local s = select(item_name(get_changing_weapon(0, 3)), item_name(get_changing_weapon(0, 4)), "Hen�z De�il.")
				if s == 1 then
					pc.give_item2_select(get_changing_weapon(0, 3), 1)
					item.set_basic(true)
					say_title("Gen� Kahramanlar ��in Silahlar")
					say("")
					say("Silah�n m�h�rlenerek karakterine eklendi.")
					say_item_vnum(get_changing_weapon(0, 3))
					clear_letter()
					set_quest_state("weapon_quest_lv20","run")
					set_state(__COMPLETE__)
				elseif s == 2 then
					pc.give_item2_select(get_changing_weapon(0, 4), 1)
					item.set_basic(true)
					say_title("Gen� Kahramanlar ��in Silahlar")
					say("")
					say("Silah�n m�h�rlenerek karakterine eklendi.")
					say_item_vnum(get_changing_weapon(0, 4))
					clear_letter()
					set_quest_state("weapon_quest_lv20","run")
					set_state(__COMPLETE__)			
				else
					send_letter("~Gen� Kahramanlar ��in Silahlar")
				end
			elseif pc.job == 1 then
				say_size(300, 450)
				say_item_vnum_ex(get_changing_weapon(1, 4), 0, 3)
				say_item_vnum_ex(get_changing_weapon(1, 5), 1, 3)
				say_item_vnum_ex(get_changing_weapon(1, 6), 22, 30)
				local s = select(item_name(get_changing_weapon(1, 4)), item_name(get_changing_weapon(1, 5)), item_name(get_changing_weapon(1, 6)), "Hen�z De�il.")		
				if s == 1 then
					pc.give_item2_select(get_changing_weapon(1, 4), 1)
					item.set_basic(true)
					say_title("Gen� Kahramanlar ��in Silahlar")
					say("")
					say("Silah�n m�h�rlenerek karakterine eklendi.")
					say_item_vnum(get_changing_weapon(1, 4))
					clear_letter()
					set_quest_state("weapon_quest_lv20","run")
					set_state(__COMPLETE__)
				elseif s == 2 then
					pc.give_item2_select(get_changing_weapon(1, 5), 1)
					item.set_basic(true)
					say_title("Gen� Kahramanlar ��in Silahlar")
					say("")
					say("Silah�n m�h�rlenerek karakterine eklendi.")
					say_item_vnum(get_changing_weapon(1, 5))
					clear_letter()
					set_quest_state("weapon_quest_lv20","run")
					set_state(__COMPLETE__)
				elseif s == 3 then
					pc.give_item2_select(get_changing_weapon(1, 6), 1)
					item.set_basic(true)
					say_title("Gen� Kahramanlar ��in Silahlar")
					say("")
					say("Silah�n m�h�rlenerek karakterine eklendi.")
					say_item_vnum(get_changing_weapon(1, 6))
					clear_letter()
					set_quest_state("weapon_quest_lv20","run")
					set_state(__COMPLETE__)					
				else
					send_letter("~Gen� Kahramanlar ��in Silahlar")
				end
			elseif pc.job == 2 then
				say_item_vnum(get_changing_weapon(2, 2))
				say("")
				say("")
				say("")
				local s = select(item_name(get_changing_weapon(2, 2)), "Hen�z De�il.")						
				if s == 1 then
					pc.give_item2_select(get_changing_weapon(2, 2), 1)
					item.set_basic(true)
					say_title("Gen� Kahramanlar ��in Silahlar")
					say("")
					say("Silah�n m�h�rlenerek karakterine eklendi.")
					say_item_vnum(get_changing_weapon(2, 2))
					clear_letter()
					set_quest_state("weapon_quest_lv20","run")
					set_state(__COMPLETE__)
				else
					send_letter("~Gen� Kahramanlar ��in Silahlar")
				end
			elseif pc.job == 3 then
				say_item_vnum_ex(get_changing_weapon(3, 3), 0, 2)
				say_item_vnum_ex(get_changing_weapon(3, 4), 1, 2)
				local s = select(item_name(get_changing_weapon(3, 3)), item_name(get_changing_weapon(3, 4)), "Hen�z De�il.")
				if s == 1 then
					pc.give_item2_select(get_changing_weapon(3, 3), 1)
					item.set_basic(true)
					say_title("Gen� Kahramanlar ��in Silahlar")
					say("")
					say("Silah�n m�h�rlenerek karakterine eklendi.")
					say_item_vnum(get_changing_weapon(3, 3))
					clear_letter()
					set_quest_state("weapon_quest_lv20","run")
					set_state(__COMPLETE__)
				elseif s == 2 then
					pc.give_item2_select(get_changing_weapon(3, 4), 1)
					item.set_basic(true)
					say_title("Gen� Kahramanlar ��in Silahlar")
					say("")
					say("Silah�n m�h�rlenerek karakterine eklendi.")
					say_item_vnum(get_changing_weapon(3, 4))
					clear_letter()
					set_quest_state("weapon_quest_lv20","run")
					set_state(__COMPLETE__)			
				else
					send_letter("~Gen� Kahramanlar ��in Silahlar")
				end
			elseif pc.job == 4 then
				say_item_vnum(get_changing_weapon(4, 2))
				say("")
				say("")
				say("")
				local s = select(item_name(get_changing_weapon(4, 2)), "Hen�z De�il.")						
				if s == 1 then
					pc.give_item2_select(get_changing_weapon(4, 2), 1)
					item.set_basic(true)
					say_title("Gen� Kahramanlar ��in Silahlar")
					say("")
					say("Silah�n m�h�rlenerek karakterine eklendi.")
					say_item_vnum(get_changing_weapon(4, 2))
					clear_letter()
					set_quest_state("weapon_quest_lv20","run")
					set_state(__COMPLETE__)
				else
					send_letter("~Gen� Kahramanlar ��in Silahlar")
				end
			end
		end
	end
	state __COMPLETE__ begin
	end
end
			