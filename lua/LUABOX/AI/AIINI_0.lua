AIFAKEMONEY = {}
for playindex = 1 , 6 , 1 do
    AIFAKEMONEY[playindex] = -500 ;
    end

function FAKEMONEYGET ()
    local moneyCOUNT = LIMITPOWERC + 1 ;
    for playindex = 1 , 6 , 1 do
    if AI[playindex] == 1 then
    AIFAKEMONEY[playindex] = AIFAKEMONEY[playindex] + 15 * moneyCOUNT ;
    end
    end
end

function floor100(num)
    -- 婢跺嫮鎮婂锝嗘殶
    if num >= 0 then
        local integer = 0
        while integer*100 + 100 <= num do
            integer = integer + 1
        end
        return integer
    -- 婢跺嫮鎮婄拹鐔告殶
    else
        local integer = 0
        while integer*100 - 100 >= num do
            integer = integer - 1
        end
        return integer
    end
  end

function AIUNITBUILDRADOM ()
    for playindex = 1 , 6 , 1 do   
        if AI[playindex] == 1 then
           -- exMessageAppendToMessageArea("AI閫犲叺")
    --local actindex = floor100(AIFAKEMONEY[playindex])
    --exMessageAppendToMessageArea("actindex"..actindex)
    ---------------------------------------------------------------
    for i = 1 , 4 , 1 do
    if  AIFAKEMONEY[playindex] >= 100 then
       -- exMessageAppendToMessageArea("actindex"..actindex)
        local unitindex = RANDOMGENERATE(step1, 4)
        exMessageAppendToMessageArea("unitindex:"..unitindex)
        UNITCOUNT[playindex][unitindex] =   UNITCOUNT[playindex][unitindex] + 1 ;
        AIFAKEMONEY[playindex] = AIFAKEMONEY[playindex] - 150 ;
        exMessageAppendToMessageArea("AI姝ュ叺寤洪€犲畬姣?)
        exMessageAppendToMessageArea("AIFAKEMONEY[playindex]:"..AIFAKEMONEY[playindex])
    end
end
    -------------------------------------------------------------------
    if AIFAKEMONEY[playindex] >= 2500 then
       -- exMessageAppendToMessageArea("AI閲嶅潶")
    local unitindex = RANDOMGENERATE(step3, 101)
    --exMessageAppendToMessageArea("unitindex:"..unitindex)
    UNITCOUNT[playindex][unitindex] =   UNITCOUNT[playindex][unitindex] + 1 ;
    AIFAKEMONEY[playindex] = AIFAKEMONEY[playindex] - 2000 ;
    end
    ------------------------------------------------------------------
    if AIFAKEMONEY[playindex] >= 1000 then
     local  AIRORNOT =  RANDOMGENERATE(2, 1)
       if AIRORNOT == 2 then
       -- exMessageAppendToMessageArea("AI椋炴満")
        local unitindex = RANDOMGENERATE(step4, 152)
        exMessageAppendToMessageArea("unitindex:"..unitindex)
        UNITCOUNT[playindex][unitindex] =   UNITCOUNT[playindex][unitindex] + 1 ;
        AIFAKEMONEY[playindex] = AIFAKEMONEY[playindex] - 1000 ;
       else
       -- exMessageAppendToMessageArea("AI杞藉叿")
        local unitindex = RANDOMGENERATE(step2, 51)
        exMessageAppendToMessageArea("unitindex:"..unitindex)
        UNITCOUNT[playindex][unitindex] =   UNITCOUNT[playindex][unitindex] + 1 ;
        AIFAKEMONEY[playindex] = AIFAKEMONEY[playindex] - 1000 ;
    end
end 
    --------------------------------------------------------------
end
end
------------------------------------------------
end
