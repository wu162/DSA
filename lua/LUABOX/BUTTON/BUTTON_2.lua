function onUserLongTextDialogEvent(playerName, btnIndex, dialogId)
  for i=1,6,1 do
    if playerName=="Player_"..i and i<=3 and dialogId==200+i then
      if btnIndex==1 then
        exAddTextToPublicBoard('恶魔$p'..i..'Name选择投降',30)
        devil_surrender=devil_surrender+1
      elseif btnIndex==3 then
        exAddTextToPublicBoard('恶魔$p'..i..'Name选择战斗',30)
        devil_surrender=devil_surrender-1
      else
        exAddTextToPublicBoard('恶魔$p'..i..'Name选择弃权',30)
      end
    end
    if playerName=="Player_"..i and i>3 and dialogId==200+i then
      if btnIndex==1 then
        exAddTextToPublicBoard('天使$p'..i..'Name选择投降',30)
        angel_surrender=angel_surrender+1
      elseif btnIndex==3 then
        exAddTextToPublicBoard('天使$p'..i..'Name选择战斗',30)
        angel_surrender=angel_surrender-1
      else
        exAddTextToPublicBoard('天使$p'..i..'Name选择弃权',30)
      end
    end
  end
end