function onUserLongTextDialogEvent(playerName, btnIndex, dialogId)
  for i=1,6,1 do
  if playerName=="Player_"..i and i<=3 and dialogId==200+i then
    if btnIndex==1 then
      exAddTextToPublicBoard('鎭堕瓟$p'..i..'Name閫夋嫨鎶曢檷',30)
      devil_surrender=devil_surrender+1
    elseif btnIndex==3 then
      exAddTextToPublicBoard('鎭堕瓟$p'..i..'Name閫夋嫨鎴樻枟',30)
      devil_surrender=devil_surrender-1
      else
      exAddTextToPublicBoard('鎭堕瓟$p'..i..'Name閫夋嫨寮冩潈',30)
    end
  end
  if playerName=="Player_"..i and i>3 and dialogId==200+i then
    if btnIndex==1 then
    exAddTextToPublicBoard('澶╀娇$p'..i..'Name閫夋嫨鎶曢檷',30)
      angel_surrender=angel_surrender+1
    elseif btnIndex==3 then
    exAddTextToPublicBoard('澶╀娇$p'..i..'Name閫夋嫨鎴樻枟',30)
      angel_surrender=angel_surrender-1
      else
    exAddTextToPublicBoard('澶╀娇$p'..i..'Name閫夋嫨寮冩潈',30)
    end
  end
end
end