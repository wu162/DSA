local countD  = GetPlayerAllUnitsValue('PlyrCivilian')
local  countA = GetPlayerAllUnitsValue('PlyrCreeps')
if countD>countA then
    local previous = SetWorldBuilderThisPlayer(1)
    ExecuteAction('PLAYER_GIVE_MONEY','Player_1',devil_money)
    ExecuteAction('PLAYER_GIVE_MONEY','Player_2',devil_money)
    ExecuteAction('PLAYER_GIVE_MONEY','Player_3',devil_money)
    exAddTextToPublicBoard('恶魔方本回合胜!',10)
    if devil_max>=1200 then
        exAddTextToPublicBoard('恶魔方终结连胜!',10)
    end
    if angel_max>=1200 then
        exAddTextToPublicBoard('恶魔方正在连胜!',10)
    end
    devil_money=0
    angel_money=0
    if angel_max<4200 then
        angel_max=angel_max+400
    end
    if devil_max >= 1800 then
        devil_max = devil_max / 2;
    else
        devil_max=400
    end
elseif countD<countA then
    local previous = SetWorldBuilderThisPlayer(1)
    ExecuteAction('PLAYER_GIVE_MONEY','Player_4',angel_money)
    ExecuteAction('PLAYER_GIVE_MONEY','Player_5',angel_money)
    ExecuteAction('PLAYER_GIVE_MONEY','Player_6',angel_money)
    exAddTextToPublicBoard('天使方本回合胜!',10)
    if devil_max>=1200 then
        exAddTextToPublicBoard('天使方正在连胜!',10)
    end
    if angel_max>=1200 then
        exAddTextToPublicBoard('天使方终结连胜!',10)
    end
    devil_money=0
    angel_money=0
    if angel_max >= 1800 then
        angel_max = angel_max / 2;
    else
        angel_max=400
    end
    if devil_max<4200 then
        devil_max=devil_max+400
    end
else
    devil_money=0
    angel_money=0
    exAddTextToPublicBoard('本回合暂无胜者',10)
end