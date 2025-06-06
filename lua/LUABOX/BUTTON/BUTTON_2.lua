devil_max=200
angel_max=200
function onUserBtnChoiceDialogEvent(playerName, btnIndex, dialogId)
 local round = exCounterGetByName("lvc")
 local start = exCounterGetByName("start")
 if playerName == "Player_1" and btnIndex == 1 and dialogId == 101 then
  local money = exPlayerGetCurrentMoney(playerName)
  if money>=1000 then
   local previous = SetWorldBuilderThisPlayer(1)
   ExecuteAction('PLAYER_GIVE_MONEY','Player_2','1000')
   ExecuteAction('PLAYER_GIVE_MONEY','Player_1','-1000')
   exAddTextToPublicBoardForPlayer(playerName,'转移成功',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,101,'欢迎进入交易市场\n投资金额(上限'.. devil_max..'):'..devil_money,'向恶魔时空管理员转移1000资金','向恶魔空军司令转移1000资金','回到战场','购买100恶魔投资','','','')
  else
   exAddTextToPublicBoardForPlayer(playerName,'您的余额不足',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,101,'欢迎进入交易市场\n投资金额(上限'.. devil_max..'):'..devil_money,'向恶魔时空管理员转移1000资金','向恶魔空军司令转移1000资金','回到战场','购买100恶魔投资','','','')
  end
 end
 if playerName == "Player_1" and btnIndex == 2 and dialogId == 101 then
  local money = exPlayerGetCurrentMoney(playerName)
  if money>=1000 then
   local previous = SetWorldBuilderThisPlayer(1)
   ExecuteAction('PLAYER_GIVE_MONEY','Player_3','1000')
   ExecuteAction('PLAYER_GIVE_MONEY','Player_1','-1000')
   exAddTextToPublicBoardForPlayer(playerName,'转移成功',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,101,'欢迎进入交易市场\n投资金额(上限'.. devil_max..'):'..devil_money,'向恶魔时空管理员转移1000资金','向恶魔空军司令转移1000资金','回到战场','购买100恶魔投资','','','')
  else
   exAddTextToPublicBoardForPlayer(playerName,'您的余额不足',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,101,'欢迎进入交易市场\n投资金额(上限'.. devil_max..'):'..devil_money,'向恶魔时空管理员转移1000资金','向恶魔空军司令转移1000资金','回到战场','购买100恶魔投资','','','')
  end
 end
 if playerName == "Player_2" and btnIndex == 1 and dialogId == 102 then
  local money = exPlayerGetCurrentMoney(playerName)
  if money>=1000 then
   local previous = SetWorldBuilderThisPlayer(1)
   ExecuteAction('PLAYER_GIVE_MONEY','Player_1','1000')
   ExecuteAction('PLAYER_GIVE_MONEY','Player_2','-1000')
   exAddTextToPublicBoardForPlayer(playerName,'转移成功',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,102,'欢迎进入交易市场\n投资金额(上限'.. devil_max..'):'..devil_money,'向恶魔攻击单元转移1000资金','向恶魔空军司令转移1000资金','回到战场','购买100恶魔投资','','','')
  else
   exAddTextToPublicBoardForPlayer(playerName,'您的余额不足',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,102,'欢迎进入交易市场\n投资金额(上限'.. devil_max..'):'..devil_money,'向恶魔攻击单元转移1000资金','向恶魔空军司令转移1000资金','回到战场','购买100恶魔投资','','','')
  end
 end
 if playerName == "Player_2" and btnIndex == 2 and dialogId == 102 then
  local money = exPlayerGetCurrentMoney(playerName)
  if money>=1000 then
   local previous = SetWorldBuilderThisPlayer(1)
   ExecuteAction('PLAYER_GIVE_MONEY','Player_3','1000')
   ExecuteAction('PLAYER_GIVE_MONEY','Player_2','-1000')
   exAddTextToPublicBoardForPlayer(playerName,'转移成功',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,102,'欢迎进入交易市场\n投资金额(上限'.. devil_max..'):'..devil_money,'向恶魔攻击单元转移1000资金','向恶魔空军司令转移1000资金','回到战场','购买100恶魔投资','','','')
  else
   exAddTextToPublicBoardForPlayer(playerName,'您的余额不足',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,102,'欢迎进入交易市场\n投资金额(上限'.. devil_max..'):'..devil_money,'向恶魔攻击单元转移1000资金','向恶魔空军司令转移1000资金','回到战场','购买100恶魔投资','','','')
  end
 end
 if playerName == "Player_3" and btnIndex == 1 and dialogId == 103 then
  local money = exPlayerGetCurrentMoney(playerName)
  if money>=1000 then
   local previous = SetWorldBuilderThisPlayer(1)
   ExecuteAction('PLAYER_GIVE_MONEY','Player_1','1000')
   ExecuteAction('PLAYER_GIVE_MONEY','Player_3','-1000')
   exShowCustomBtnChoiceDialogForPlayer(playerName,103,'欢迎进入交易市场\n投资金额(上限'.. devil_max..'):'..devil_money,'向恶魔攻击单元转移1000资金','向恶魔时空管理员转移1000资金','回到战场','购买100恶魔投资','','','')
   exAddTextToPublicBoardForPlayer(playerName,'转移成功',5)
  else
   exAddTextToPublicBoardForPlayer(playerName,'您的余额不足',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,103,'欢迎进入交易市场\n投资金额(上限'.. devil_max..'):'..devil_money,'向恶魔攻击单元转移1000资金','向恶魔时空管理员转移1000资金','回到战场','购买100恶魔投资','','','')
  end
 end
 if playerName == "Player_3" and btnIndex == 2 and dialogId == 103 then
  local money = exPlayerGetCurrentMoney(playerName)
  if money>=1000 then
   local previous = SetWorldBuilderThisPlayer(1)
   ExecuteAction('PLAYER_GIVE_MONEY','Player_2','1000')
   ExecuteAction('PLAYER_GIVE_MONEY','Player_3','-1000')
   exShowCustomBtnChoiceDialogForPlayer(playerName,103,'欢迎进入交易市场\n投资金额(上限'.. devil_max..'):'..devil_money,'向恶魔攻击单元转移1000资金','向恶魔时空管理员转移1000资金','回到战场','购买100恶魔投资','','','')
   exAddTextToPublicBoardForPlayer(playerName,'转移成功',5)
  else
   exAddTextToPublicBoardForPlayer(playerName,'您的余额不足',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,103,'欢迎进入交易市场\n投资金额(上限'.. devil_max..'):'..devil_money,'向恶魔攻击单元转移1000资金','向恶魔时空管理员转移1000资金','回到战场','购买100恶魔投资','','','')
  end
 end
 if playerName == "Player_4" and btnIndex == 1 and dialogId == 104 then
  local money = exPlayerGetCurrentMoney(playerName)
  if money>=1000 then
   local previous = SetWorldBuilderThisPlayer(1)
   ExecuteAction('PLAYER_GIVE_MONEY','Player_5','1000')
   ExecuteAction('PLAYER_GIVE_MONEY','Player_4','-1000')
   exShowCustomBtnChoiceDialogForPlayer(playerName,104,'欢迎进入交易市场\n投资金额(上限'.. angel_max..'):'..angel_money,'向天使时空管理员转移1000资金','向天使空军司令转移1000资金','回到战场','购买100天使投资','','','')
   exAddTextToPublicBoardForPlayer(playerName,'转移成功',5)
  else
   exAddTextToPublicBoardForPlayer(playerName,'您的余额不足',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,104,'欢迎进入交易市场\n投资金额(上限'.. angel_max..'):'..angel_money,'向天使时空管理员转移1000资金','向天使空军司令转移1000资金','回到战场','购买100天使投资','','','')
  end
 end
 if playerName == "Player_4" and btnIndex == 2 and dialogId == 104 then
  local money = exPlayerGetCurrentMoney(playerName)
  if money>=1000 then
   local previous = SetWorldBuilderThisPlayer(1)
   ExecuteAction('PLAYER_GIVE_MONEY','Player_6','1000')
   ExecuteAction('PLAYER_GIVE_MONEY','Player_4','-1000')
   exShowCustomBtnChoiceDialogForPlayer(playerName,104,'欢迎进入交易市场\n投资金额(上限'.. angel_max..'):'..angel_money,'向天使时空管理员转移1000资金','向天使空军司令转移1000资金','回到战场','购买100天使投资','','','')
   exAddTextToPublicBoardForPlayer(playerName,'转移成功',5)
  else
   exAddTextToPublicBoardForPlayer(playerName,'您的余额不足',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,104,'欢迎进入交易市场\n投资金额(上限'.. angel_max..'):'..angel_money,'向天使时空管理员转移1000资金','向天使空军司令转移1000资金','回到战场','购买100天使投资','','','')
  end
 end
 if playerName == "Player_5" and btnIndex == 1 and dialogId == 105 then
  local money = exPlayerGetCurrentMoney(playerName)
  if money>=1000 then
   local previous = SetWorldBuilderThisPlayer(1)
   ExecuteAction('PLAYER_GIVE_MONEY','Player_4','1000')
   ExecuteAction('PLAYER_GIVE_MONEY','Player_5','-1000')
   exShowCustomBtnChoiceDialogForPlayer(playerName,105,'欢迎进入交易市场\n投资金额(上限'.. angel_max..'):'..angel_money,'向天使攻击单元转移1000资金','向天使空军司令转移1000资金','回到战场','购买100天使投资','','','')
   exAddTextToPublicBoardForPlayer(playerName,'转移成功',5)
  else
   exAddTextToPublicBoardForPlayer(playerName,'您的余额不足',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,105,'欢迎进入交易市场\n投资金额(上限'.. angel_max..'):'..angel_money,'向天使攻击单元转移1000资金','向天使空军司令转移1000资金','回到战场','购买100天使投资','','','')
  end
 end
 if playerName == "Player_5" and btnIndex == 2 and dialogId == 105 then
  local money = exPlayerGetCurrentMoney(playerName)
  if money>=1000 then
   local previous = SetWorldBuilderThisPlayer(1)
   ExecuteAction('PLAYER_GIVE_MONEY','Player_6','1000')
   ExecuteAction('PLAYER_GIVE_MONEY','Player_5','-1000')
   exShowCustomBtnChoiceDialogForPlayer(playerName,105,'欢迎进入交易市场\n投资金额(上限'.. angel_max..'):'..angel_money,'向天使攻击单元转移1000资金','向天使空军司令转移1000资金','回到战场','购买100天使投资','','','')
   exAddTextToPublicBoardForPlayer(playerName,'转移成功',5)
  else
   exAddTextToPublicBoardForPlayer(playerName,'您的余额不足',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,105,'欢迎进入交易市场\n投资金额(上限'.. angel_max..'):'..angel_money,'向天使攻击单元转移1000资金','向天使空军司令转移1000资金','回到战场','购买100天使投资','','','')
  end
 end
 if playerName == "Player_6" and btnIndex == 1 and dialogId == 106 then
  local money = exPlayerGetCurrentMoney(playerName)
  if money>=1000 then
   local previous = SetWorldBuilderThisPlayer(1)
   ExecuteAction('PLAYER_GIVE_MONEY','Player_4','1000')
   ExecuteAction('PLAYER_GIVE_MONEY','Player_6','-1000')
   exShowCustomBtnChoiceDialogForPlayer(playerName,106,'欢迎进入交易市场\n投资金额(上限'.. angel_max..'):'..angel_money,'向天使攻击单元转移1000资金','向天使时空管理员转移1000资金','回到战场','购买100天使投资','','','')
   exAddTextToPublicBoardForPlayer(playerName,'转移成功',5)
  else
   exAddTextToPublicBoardForPlayer(playerName,'您的余额不足',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,106,'欢迎进入交易市场\n投资金额(上限'.. angel_max..'):'..angel_money,'向天使攻击单元转移1000资金','向天使时空管理员转移1000资金','回到战场','购买100天使投资','','','')
  end
 end
 if playerName == "Player_6" and btnIndex == 2 and dialogId == 106 then
  local money = exPlayerGetCurrentMoney(playerName)
  if money>=1000 then
   local previous = SetWorldBuilderThisPlayer(1)
   ExecuteAction('PLAYER_GIVE_MONEY','Player_5','1000')
   ExecuteAction('PLAYER_GIVE_MONEY','Player_6','-1000')
   exShowCustomBtnChoiceDialogForPlayer(playerName,106,'欢迎进入交易市场\n投资金额(上限'.. angel_max..'):'..angel_money,'向天使攻击单元转移1000资金','向天使时空管理员转移1000资金','回到战场','购买100天使投资','','','')
   exAddTextToPublicBoardForPlayer(playerName,'转移成功',5)
  else
   exAddTextToPublicBoardForPlayer(playerName,'您的余额不足',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,106,'欢迎进入交易市场\n投资金额(上限'.. angel_max..'):'..angel_money,'向天使攻击单元转移1000资金','向天使时空管理员转移1000资金','回到战场','购买100天使投资','','','')
  end
 end
 if playerName == "Player_1" and btnIndex == 4 and dialogId == 101 then
  local money = exPlayerGetCurrentMoney(playerName)
  if money>=100 and devil_money< devil_max and  start>600 then
   local previous = SetWorldBuilderThisPlayer(1)
   ExecuteAction('PLAYER_GIVE_MONEY','Player_1','-100')
   devil_money=devil_money+100
   exShowCustomBtnChoiceDialogForPlayer(playerName,101,'欢迎进入交易市场\n投资金额(上限'.. devil_max..'):'..devil_money,'向恶魔时空管理员转移1000资金','向恶魔空军司令转移1000资金','回到战场','购买100恶魔投资','','','')
   exAddTextToPublicBoardForPlayer(playerName,'投资成功',5)
  else
   exAddTextToPublicBoardForPlayer(playerName,'条件不满足!',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,101,'欢迎进入交易市场\n投资金额(上限'.. devil_max..'):'..devil_money,'向恶魔时空管理员转移1000资金','向恶魔空军司令转移1000资金','回到战场','购买100恶魔投资','','','')
  end
 end
 if playerName == "Player_2" and btnIndex == 4 and dialogId == 102 then
  local money = exPlayerGetCurrentMoney(playerName)
  if money>=100 and devil_money< devil_max and start>600 then
   local previous = SetWorldBuilderThisPlayer(1)
   ExecuteAction('PLAYER_GIVE_MONEY','Player_2','-100')
   devil_money=devil_money+100
   exShowCustomBtnChoiceDialogForPlayer(playerName,102,'欢迎进入交易市场\n投资金额(上限'.. devil_max..'):'..devil_money,'向恶魔攻击单元转移1000资金','向恶魔空军司令转移1000资金','回到战场','购买100恶魔投资','','','')
   exAddTextToPublicBoardForPlayer(playerName,'投资成功',5)
  else
   exAddTextToPublicBoardForPlayer(playerName,'条件不满足!',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,102,'欢迎进入交易市场\n投资金额(上限'.. devil_max..'):'..devil_money,'向恶魔攻击单元转移1000资金','向恶魔空军司令转移1000资金','回到战场','购买100恶魔投资','','','')
  end
 end
 if playerName == "Player_3" and btnIndex == 4 and dialogId == 103 then
  local money = exPlayerGetCurrentMoney(playerName)
  if money>=100 and devil_money< devil_max and start>600 then
   local previous = SetWorldBuilderThisPlayer(1)
   ExecuteAction('PLAYER_GIVE_MONEY','Player_3','-100')
   devil_money=devil_money+100
   exShowCustomBtnChoiceDialogForPlayer(playerName,103,'欢迎进入交易市场\n投资金额(上限'.. devil_max..'):'..devil_money,'向恶魔攻击单元转移1000资金','向恶魔时空管理员转移1000资金','回到战场','购买100恶魔投资','','','')
   exAddTextToPublicBoardForPlayer(playerName,'投资成功',5)
  else
   exAddTextToPublicBoardForPlayer(playerName,'条件不满足!',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,103,'欢迎进入交易市场\n投资金额(上限'.. devil_max..'):'..devil_money,'向恶魔攻击单元转移1000资金','向恶魔时空管理员转移1000资金','回到战场','购买100恶魔投资','','','')
  end
 end
 if playerName == "Player_4" and btnIndex == 4 and dialogId == 104 then
  local money = exPlayerGetCurrentMoney(playerName)
  if money>=100 and angel_money< angel_max and start>600 then
   local previous = SetWorldBuilderThisPlayer(1)
   ExecuteAction('PLAYER_GIVE_MONEY','Player_4','-100')
   angel_money=angel_money+100
   exShowCustomBtnChoiceDialogForPlayer(playerName,104,'欢迎进入交易市场\n投资金额(上限'.. angel_max..'):'..angel_money,'向天使时空管理员转移1000资金','向天使空军司令转移1000资金','回到战场','购买100天使投资','','','')
   exAddTextToPublicBoardForPlayer(playerName,'投资成功',5)
  else
   exAddTextToPublicBoardForPlayer(playerName,'条件不满足!',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,104,'欢迎进入交易市场\n投资金额(上限'.. angel_max..'):'..angel_money,'向天使时空管理员转移1000资金','向天使空军司令转移1000资金','回到战场','购买100天使投资','','','')
  end
 end
 if playerName == "Player_5" and btnIndex == 4 and dialogId == 105 then
  local money = exPlayerGetCurrentMoney(playerName)
  if money>=100 and angel_money< angel_max and start>600 then
   local previous = SetWorldBuilderThisPlayer(1)
   ExecuteAction('PLAYER_GIVE_MONEY','Player_5','-100')
   angel_money=angel_money+100
   exShowCustomBtnChoiceDialogForPlayer(playerName,105,'欢迎进入交易市场\n投资金额(上限'.. angel_max..'):'..angel_money,'向天使攻击单元转移1000资金','向天使空军司令转移1000资金','回到战场','购买100天使投资','','','')
   exAddTextToPublicBoardForPlayer(playerName,'投资成功',5)
  else
   exAddTextToPublicBoardForPlayer(playerName,'条件不满足!',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,105,'欢迎进入交易市场\n投资金额(上限'.. angel_max..'):'..angel_money,'向天使攻击单元转移1000资金','向天使空军司令转移1000资金','回到战场','购买100天使投资','','','')
  end
 end
 if playerName == "Player_6" and btnIndex == 4 and dialogId == 106 then
  local money = exPlayerGetCurrentMoney(playerName)
  if money>=100 and angel_money< angel_max and start>600 then
   local previous = SetWorldBuilderThisPlayer(1)
   ExecuteAction('PLAYER_GIVE_MONEY','Player_5','-100')
   angel_money=angel_money+100
   exShowCustomBtnChoiceDialogForPlayer(playerName,106,'欢迎进入交易市场\n投资金额(上限'.. angel_max..'):'..angel_money,'向天使攻击单元转移1000资金','向天使时空管理员转移1000资金','回到战场','购买100天使投资','','','')
   exAddTextToPublicBoardForPlayer(playerName,'投资成功',5)
  else
   exAddTextToPublicBoardForPlayer(playerName,'条件不满足!',5)
   exShowCustomBtnChoiceDialogForPlayer(playerName,106,'欢迎进入交易市场\n投资金额(上限'.. angel_max..'):'..angel_money,'向天使攻击单元转移1000资金','向天使时空管理员转移1000资金','回到战场','购买100天使投资','','','')
  end
 end
 SetworldBuilderThisPlayer(previous)
end