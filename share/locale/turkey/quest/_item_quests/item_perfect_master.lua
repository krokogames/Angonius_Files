--[[
	Myte2 Server Files
	PACHI | Tunga
	https://forum.turkmmo.com/uye/2127751-pachi/
--]]
quest yg begin 
    state start begin 
        when 50512.use begin 
            x = {} 
            y = {} 
            z = 1 
            g = 50512 
            yg.BeceriKontrol(pc.get_skill_group()) 
        end     
         
        function BeceriKontrol(beceriDurumu) 
            if beceriDurumu == 0 then 
                syschat("Sistem: Hen�z beceriye sahip de�ilsiniz.") 
            else 
                yg.SinifBelirleme(pc.get_job()) 
            end 
        end 
        function SinifBelirleme(sinifi) 
            if sinifi == 0 then 
                yg.SavasciSinifi(pc.get_skill_group()) 
            elseif sinifi == 1 then 
                yg.NinjaSinifi(pc.get_skill_group()) 
            elseif sinifi == 2 then 
                yg.SuraSinifi(pc.get_skill_group()) 
            elseif sinifi == 3 then 
                yg.SamanSinifi(pc.get_skill_group())
			elseif sinifi == 4 then
				yg.LycanSinifi(pc.get_skill_group())
            end 
        end 
        function SavasciSinifi(savasciBeceri) 
            if savasciBeceri == 1 then -- Bedensel 
                yg.YetenekDenetim(1,6) 
            elseif savasciBeceri == 2 then -- Zihinsel 
                yg.YetenekDenetim(16,21)  
            end 
        end 
        function NinjaSinifi(ninjaBeceri) 
            if ninjaBeceri == 1 then -- Yak�n d�v�� 
                yg.YetenekDenetim(31,36)  
            elseif ninjaBeceri == 2 then -- Uzak D�v�� 
                yg.YetenekDenetim(46,51) 
            end 
        end 
        function SuraSinifi(suraBeceri) 
            if suraBeceri == 1 then -- B�y�l� Keskinlik 
                yg.YetenekDenetim(61,66)  
            elseif suraBeceri == 2 then -- Karab�y�  
                yg.YetenekDenetim(76,81)  
            end 
        end 
        function SamanSinifi(samanBeceri) 
            if samanBeceri == 1 then -- Ejderha Yard�m� 
                yg.YetenekDenetim(91,96)  
            elseif samanBeceri == 2 then -- �yile�tirme 
                yg.YetenekDenetim(106,111) 
            end 
        end
		function LycanSinifi(lycanBeceri)
			if lycanBeceri == 1 then
				yg.YetenekDenetim(170,175)
			end
		end
        function BeceriAdlari(beceriDegeri) 
            beceriDizi = { 
                -- Bedensel 
                [1] = {"�� Y�nl� Kesme"}, 
                [2] = {"K�l�� �evirme"}, 
                [3] = {"�fke"}, 
                [4] = {"Hava K�l�c� "}, 
                [5] = {"Hamle"}, 
				[6] = {"Ya�ama �ste�i"},
                -- Zihinsel 
                [16] = {"Ruh Vuru�u"}, 
                [17] = {"�iddetli Vuru� "}, 
                [18] = {"G��l� Vuru� "}, 
                [19] = {"G��l� Beden"}, 
                [20] = {"K�l�� Darbesi"}, 
				[21] = {"K�l�� �emberi"},
                -- Yak�n d�v�� 
                [31] = {"Suikast"}, 
                [32] = {"Hizli Saldiri"}, 
                [33] = {"B��ak �evirme"}, 
                [34] = {"Kamuflaj"}, 
                [35] = {"Zehirli Bulut"},
				[36] = {"Sinsi Zehir"},
                -- Uzak d�v�� 
                [46] = {"Tekrarlanan At�� "}, 
                [47] = {"Ok Ya�muru"}, 
                [48] = {"Ate�li Ok"}, 
                [49] = {"Hafif Ad�m"}, 
                [50] = {"Zehirli Ok"}, 
				[51] = {"K�v�lc�m Vuru�u"},
                -- B�y�l� Keskinlik 
                [61] = {"Parmak Darbesi"}, 
                [62] = {"Ejderha D�n��u"}, 
                [63] = {"B�y�l� Keskinlik"}, 
                [64] = {"Deh�et"}, 
                [65] = {"B�y�l� Z�rh"}, 
                [66] = {"B�y� ��zme"}, 
                -- Karab�y� 
                [76] = {"Karanl�k Vurus"}, 
                [77] = {"Ate� Vuru� "}, 
                [78] = {"Ate� Hayaleti"}, 
                [79] = {"Karanl�k Koruma"}, 
                [80] = {"Hayalet Vuru� "}, 
                [81] = {"Karanl�k K�re"}, 
                -- Ejderha yard�m� 
                [91] = {"U�an T�ls�m"}, 
                [92] = {"Ejderha At��� "}, 
                [93] = {"Kutsama"}, 
                [94] = {"Ejderha K�kremesi"}, 
                [95] = {"Yans�tma"}, 
                [96] = {"Ejderha Yard�m� "}, 
                -- �yile�tirme 
                [106] = {"�im�ek Atma"}, 
                [107] = {"�im�ek �a��rma"}, 
                [108] = {"�im�ek Pen�esi"}, 
                [109] = {"�yile�tirme"}, 
                [110] = {"H�z"}, 
                [111] = {"Y�ksek Saldir� "},
				-- Lycan
				[170] = {"Y�rtma "},
				[171] = {"Kurt Nefesi "},
				[172] = {"Kurt Atlay��� "},
				[173] = {"Kurt Pen�esi "},
				[174] = {"K�rm�z� Kurt Ruhu "},
				[175] = {"�ivit Kurt Ruhu "}
            } 
            return beceriDizi[beceriDegeri][1] 
        end 
        function YetenekDenetim(m,k) 
			if pc.getf("skill_reset2","skill_bind") - get_time() > 0 then
				yg.BeceriMuhurlu()
				return
			end
            for i=m,k,1 do 
                if pc.get_skill_level(i) < 40 and pc.get_skill_level(i) >= 20 then 
                    x[z] = i 
                    y[z] = tostring(yg.BeceriAdlari(i)) 
                    z = z + 1 
                end 
            end 
            if z != 1 then 
				yg.Aciklama() 
                p = tonumber(table.getn(y)) 
                y[p+1] = "Kapat" 
                u = select_table(y)
                if u != p+1 then 
                    pc.set_skill_level(x[u],40) 
					item.remove(g,1)
                    yg.IslemBasarili() 
                end 
            else 
                yg.YetenekTam()
				z = 0
            end 
        end 
        function Aciklama() 
            say_title("[WINDOW_SIZE width;350|height;375]Bilgilendirme:") 
            say("") 
            say("Merhaba oyuncu, "..pc.get_name()) 
            say("M1 ve �st� yetene�ini P seviyesine geli�tirebilirsin.") 
            say("") 
            say_reward("L�tfen yetene�i se�: ") 
            say("") 
        end 
        function IslemBasarili() 
            say_title("Bilgilendirme: ") 
            say("") 
            say("Yetene�iniz ba�ar� ile y�kseltilmi�tir.") 
            say("") 
            say_reward("Yetenek y�kseltme y�z��� silinmi�tir.") 
            say("")
        end 
        function YetenekTam() 
            syschat("Sistem: Perfect master yap�labilecek bir beceri yok.") 
        end 
		function BeceriMuhurlu()
			syschat("Sistem: Becerilerin m�h�rl� iken bunu ger�ekle�tiremezsin.")
		end
    end 
end  