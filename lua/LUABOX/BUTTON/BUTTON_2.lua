devil_max=400
angel_max=400
 function onUserBtnChoiceDialogEvent(playerName, btnIndex, dialogId)
 local round = exCounterGetByName("lvc")
 local start = exCounterGetByName("start")
 if playerName == "Player_1" and btnIndex == 1 and dialogId == 101 then
 local money = exPlayerGetCurrentMoney(playerName)
 if money>=1000 then
 local previous = SetWorldBuilderThisPlayer(1)
 ExecuteAction('PLAYER_GIVE_MONEY','Player_2','1000')
 ExecuteAction('PLAYER_GIVE_MONEY','Player_1','-1000')
 exAddTextToPublicBoardForPlayer(playerName,'杞Щ鎴愬姛',5)
 exShowCustomBtnChoiceDialogForPlayer(playerName,101,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. devil_max..'):'..devil_money,'鍚戞伓榄旀椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍚戞伓榄旂┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100鎭堕瓟鎶曡祫','','','')
 else
 exAddTextToPublicBoardForPlayer(playerName,'鎮ㄧ殑浣欓涓嶈冻',5)
 exShowCustomBtnChoiceDialogForPlayer(playerName,101,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. devil_max..'):'..devil_money,'鍚戞伓榄旀椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍚戞伓榄旂┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100鎭堕瓟鎶曡祫','','','')
 end
 end
 if playerName == "Player_1" and btnIndex == 2 and dialogId == 101 then
 local money = exPlayerGetCurrentMoney(playerName)
 if money>=1000 then
 local previous = SetWorldBuilderThisPlayer(1)
 ExecuteAction('PLAYER_GIVE_MONEY','Player_3','1000')
 ExecuteAction('PLAYER_GIVE_MONEY','Player_1','-1000')
 exAddTextToPublicBoardForPlayer(playerName,'杞Щ鎴愬姛',5)
 exShowCustomBtnChoiceDialogForPlayer(playerName,101,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. devil_max..'):'..devil_money,'鍚戞伓榄旀椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍚戞伓榄旂┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100鎭堕瓟鎶曡祫','','','')
 else
 exAddTextToPublicBoardForPlayer(playerName,'鎮ㄧ殑浣欓涓嶈冻',5)
 exShowCustomBtnChoiceDialogForPlayer(playerName,101,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. devil_max..'):'..devil_money,'鍚戞伓榄旀椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍚戞伓榄旂┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100鎭堕瓟鎶曡祫','','','')
 end
 end
 if playerName == "Player_2" and btnIndex == 1 and dialogId == 102 then
 local money = exPlayerGetCurrentMoney(playerName)
 if money>=1000 then
 local previous = SetWorldBuilderThisPlayer(1)
 ExecuteAction('PLAYER_GIVE_MONEY','Player_1','1000')
 ExecuteAction('PLAYER_GIVE_MONEY','Player_2','-1000')
 exAddTextToPublicBoardForPlayer(playerName,'杞Щ鎴愬姛',5)
 exShowCustomBtnChoiceDialogForPlayer(playerName,102,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. devil_max..'):'..devil_money,'鍚戞伓榄旀敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戞伓榄旂┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100鎭堕瓟鎶曡祫','','','')
 else
 exAddTextToPublicBoardForPlayer(playerName,'鎮ㄧ殑浣欓涓嶈冻',5)
 exShowCustomBtnChoiceDialogForPlayer(playerName,102,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. devil_max..'):'..devil_money,'鍚戞伓榄旀敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戞伓榄旂┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100鎭堕瓟鎶曡祫','','','')
 end
 end
 if playerName == "Player_2" and btnIndex == 2 and dialogId == 102 then
 local money = exPlayerGetCurrentMoney(playerName)
 if money>=1000 then
 local previous = SetWorldBuilderThisPlayer(1)
 ExecuteAction('PLAYER_GIVE_MONEY','Player_3','1000')
 ExecuteAction('PLAYER_GIVE_MONEY','Player_2','-1000')
 exAddTextToPublicBoardForPlayer(playerName,'杞Щ鎴愬姛',5)
 exShowCustomBtnChoiceDialogForPlayer(playerName,102,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. devil_max..'):'..devil_money,'鍚戞伓榄旀敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戞伓榄旂┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100鎭堕瓟鎶曡祫','','','')
 else
 exAddTextToPublicBoardForPlayer(playerName,'鎮ㄧ殑浣欓涓嶈冻',5)
 exShowCustomBtnChoiceDialogForPlayer(playerName,102,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. devil_max..'):'..devil_money,'鍚戞伓榄旀敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戞伓榄旂┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100鎭堕瓟鎶曡祫','','','')
 end
 end
 if playerName == "Player_3" and btnIndex == 1 and dialogId == 103 then
 local money = exPlayerGetCurrentMoney(playerName)
 if money>=1000 then
 local previous = SetWorldBuilderThisPlayer(1)
 ExecuteAction('PLAYER_GIVE_MONEY','Player_1','1000')
 ExecuteAction('PLAYER_GIVE_MONEY','Player_3','-1000')
 exShowCustomBtnChoiceDialogForPlayer(playerName,103,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. devil_max..'):'..devil_money,'鍚戞伓榄旀敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戞伓榄旀椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍥炲埌鎴樺満','璐拱100鎭堕瓟鎶曡祫','','','') 
 exAddTextToPublicBoardForPlayer(playerName,'杞Щ鎴愬姛',5)
 else
 exAddTextToPublicBoardForPlayer(playerName,'鎮ㄧ殑浣欓涓嶈冻',5)
 exShowCustomBtnChoiceDialogForPlayer(playerName,103,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. devil_max..'):'..devil_money,'鍚戞伓榄旀敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戞伓榄旀椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍥炲埌鎴樺満','璐拱100鎭堕瓟鎶曡祫','','','') 
 end
 end
 if playerName == "Player_3" and btnIndex == 2 and dialogId == 103 then
 local money = exPlayerGetCurrentMoney(playerName)
 if money>=1000 then
 local previous = SetWorldBuilderThisPlayer(1)
 ExecuteAction('PLAYER_GIVE_MONEY','Player_2','1000')
ExecuteAction('PLAYER_GIVE_MONEY','Player_3','-1000')
 exShowCustomBtnChoiceDialogForPlayer(playerName,103,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. devil_max..'):'..devil_money,'鍚戞伓榄旀敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戞伓榄旀椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍥炲埌鎴樺満','璐拱100鎭堕瓟鎶曡祫','','','') 
exAddTextToPublicBoardForPlayer(playerName,'杞Щ鎴愬姛',5)
else
exAddTextToPublicBoardForPlayer(playerName,'鎮ㄧ殑浣欓涓嶈冻',5)
exShowCustomBtnChoiceDialogForPlayer(playerName,103,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. devil_max..'):'..devil_money,'鍚戞伓榄旀敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戞伓榄旀椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍥炲埌鎴樺満','璐拱100鎭堕瓟鎶曡祫','','','') 
end
end
if playerName == "Player_4" and btnIndex == 1 and dialogId == 104 then
local money = exPlayerGetCurrentMoney(playerName)
if money>=1000 then
local previous = SetWorldBuilderThisPlayer(1)
ExecuteAction('PLAYER_GIVE_MONEY','Player_5','1000')
ExecuteAction('PLAYER_GIVE_MONEY','Player_4','-1000')
exShowCustomBtnChoiceDialogForPlayer(playerName,104,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. angel_max..'):'..angel_money,'鍚戝ぉ浣挎椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍚戝ぉ浣跨┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100澶╀娇鎶曡祫','','','')
exAddTextToPublicBoardForPlayer(playerName,'杞Щ鎴愬姛',5)
else
exAddTextToPublicBoardForPlayer(playerName,'鎮ㄧ殑浣欓涓嶈冻',5)
exShowCustomBtnChoiceDialogForPlayer(playerName,104,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. angel_max..'):'..angel_money,'鍚戝ぉ浣挎椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍚戝ぉ浣跨┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100澶╀娇鎶曡祫','','','')
end
end
if playerName == "Player_4" and btnIndex == 2 and dialogId == 104 then
local money = exPlayerGetCurrentMoney(playerName)
if money>=1000 then
local previous = SetWorldBuilderThisPlayer(1)
ExecuteAction('PLAYER_GIVE_MONEY','Player_6','1000')
ExecuteAction('PLAYER_GIVE_MONEY','Player_4','-1000')
exShowCustomBtnChoiceDialogForPlayer(playerName,104,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. angel_max..'):'..angel_money,'鍚戝ぉ浣挎椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍚戝ぉ浣跨┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100澶╀娇鎶曡祫','','','')
exAddTextToPublicBoardForPlayer(playerName,'杞Щ鎴愬姛',5)
else
exAddTextToPublicBoardForPlayer(playerName,'鎮ㄧ殑浣欓涓嶈冻',5)
exShowCustomBtnChoiceDialogForPlayer(playerName,104,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. angel_max..'):'..angel_money,'鍚戝ぉ浣挎椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍚戝ぉ浣跨┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100澶╀娇鎶曡祫','','','')
end
end
if playerName == "Player_5" and btnIndex == 1 and dialogId == 105 then
local money = exPlayerGetCurrentMoney(playerName)
if money>=1000 then
local previous = SetWorldBuilderThisPlayer(1)
ExecuteAction('PLAYER_GIVE_MONEY','Player_4','1000')
ExecuteAction('PLAYER_GIVE_MONEY','Player_5','-1000')
exShowCustomBtnChoiceDialogForPlayer(playerName,105,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. angel_max..'):'..angel_money,'鍚戝ぉ浣挎敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戝ぉ浣跨┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100澶╀娇鎶曡祫','','','') 
exAddTextToPublicBoardForPlayer(playerName,'杞Щ鎴愬姛',5)
else
exAddTextToPublicBoardForPlayer(playerName,'鎮ㄧ殑浣欓涓嶈冻',5)
exShowCustomBtnChoiceDialogForPlayer(playerName,105,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. angel_max..'):'..angel_money,'鍚戝ぉ浣挎敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戝ぉ浣跨┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100澶╀娇鎶曡祫','','','') 
end
end
if playerName == "Player_5" and btnIndex == 2 and dialogId == 105 then
local money = exPlayerGetCurrentMoney(playerName)
if money>=1000 then
local previous = SetWorldBuilderThisPlayer(1)
ExecuteAction('PLAYER_GIVE_MONEY','Player_6','1000')
ExecuteAction('PLAYER_GIVE_MONEY','Player_5','-1000')
exShowCustomBtnChoiceDialogForPlayer(playerName,105,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. angel_max..'):'..angel_money,'鍚戝ぉ浣挎敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戝ぉ浣跨┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100澶╀娇鎶曡祫','','','') 
exAddTextToPublicBoardForPlayer(playerName,'杞Щ鎴愬姛',5)
else
exAddTextToPublicBoardForPlayer(playerName,'鎮ㄧ殑浣欓涓嶈冻',5)
exShowCustomBtnChoiceDialogForPlayer(playerName,105,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. angel_max..'):'..angel_money,'鍚戝ぉ浣挎敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戝ぉ浣跨┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100澶╀娇鎶曡祫','','','') 
end
end
if playerName == "Player_6" and btnIndex == 1 and dialogId == 106 then
local money = exPlayerGetCurrentMoney(playerName)
if money>=1000 then
local previous = SetWorldBuilderThisPlayer(1)
ExecuteAction('PLAYER_GIVE_MONEY','Player_4','1000')
ExecuteAction('PLAYER_GIVE_MONEY','Player_6','-1000')
exShowCustomBtnChoiceDialogForPlayer(playerName,106,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. angel_max..'):'..angel_money,'鍚戝ぉ浣挎敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戝ぉ浣挎椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍥炲埌鎴樺満','璐拱100澶╀娇鎶曡祫','','','')
exAddTextToPublicBoardForPlayer(playerName,'杞Щ鎴愬姛',5)
else
exAddTextToPublicBoardForPlayer(playerName,'鎮ㄧ殑浣欓涓嶈冻',5)
exShowCustomBtnChoiceDialogForPlayer(playerName,106,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. angel_max..'):'..angel_money,'鍚戝ぉ浣挎敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戝ぉ浣挎椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍥炲埌鎴樺満','璐拱100澶╀娇鎶曡祫','','','')
end
end
if playerName == "Player_6" and btnIndex == 2 and dialogId == 106 then
local money = exPlayerGetCurrentMoney(playerName)
if money>=1000 then
local previous = SetWorldBuilderThisPlayer(1)
ExecuteAction('PLAYER_GIVE_MONEY','Player_5','1000')
ExecuteAction('PLAYER_GIVE_MONEY','Player_6','-1000')
exShowCustomBtnChoiceDialogForPlayer(playerName,106,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. angel_max..'):'..angel_money,'鍚戝ぉ浣挎敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戝ぉ浣挎椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍥炲埌鎴樺満','璐拱100澶╀娇鎶曡祫','','','')
exAddTextToPublicBoardForPlayer(playerName,'杞Щ鎴愬姛',5)
else 
exAddTextToPublicBoardForPlayer(playerName,'鎮ㄧ殑浣欓涓嶈冻',5)
exShowCustomBtnChoiceDialogForPlayer(playerName,106,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. angel_max..'):'..angel_money,'鍚戝ぉ浣挎敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戝ぉ浣挎椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍥炲埌鎴樺満','璐拱100澶╀娇鎶曡祫','','','')
end
end
if playerName == "Player_1" and btnIndex == 4 and dialogId == 101 then
 local money = exPlayerGetCurrentMoney(playerName)
 if money>=100 and devil_money< devil_max and  start>600 then
 local previous = SetWorldBuilderThisPlayer(1)
 ExecuteAction('PLAYER_GIVE_MONEY','Player_1','-100')
 devil_money=devil_money+100
 exShowCustomBtnChoiceDialogForPlayer(playerName,101,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. devil_max..'):'..devil_money,'鍚戞伓榄旀椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍚戞伓榄旂┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100鎭堕瓟鎶曡祫','','','') 
 exAddTextToPublicBoardForPlayer(playerName,'鎶曡祫鎴愬姛',5)
 else 
 exAddTextToPublicBoardForPlayer(playerName,'鏉′欢涓嶆弧瓒?',5)
 exShowCustomBtnChoiceDialogForPlayer(playerName,101,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. devil_max..'):'..devil_money,'鍚戞伓榄旀椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍚戞伓榄旂┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100鎭堕瓟鎶曡祫','','','') 
 end
 end
 if playerName == "Player_2" and btnIndex == 4 and dialogId == 102 then
 local money = exPlayerGetCurrentMoney(playerName)
 if money>=100 and devil_money< devil_max and start>600 then
 local previous = SetWorldBuilderThisPlayer(1)
 ExecuteAction('PLAYER_GIVE_MONEY','Player_2','-100')
 devil_money=devil_money+100
 exShowCustomBtnChoiceDialogForPlayer(playerName,102,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. devil_max..'):'..devil_money,'鍚戞伓榄旀敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戞伓榄旂┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100鎭堕瓟鎶曡祫','','','') 
 exAddTextToPublicBoardForPlayer(playerName,'鎶曡祫鎴愬姛',5)
 else 
 exAddTextToPublicBoardForPlayer(playerName,'鏉′欢涓嶆弧瓒?',5)
 exShowCustomBtnChoiceDialogForPlayer(playerName,102,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. devil_max..'):'..devil_money,'鍚戞伓榄旀敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戞伓榄旂┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100鎭堕瓟鎶曡祫','','','') 
 end
 end
 if playerName == "Player_3" and btnIndex == 4 and dialogId == 103 then
 local money = exPlayerGetCurrentMoney(playerName)
 if money>=100 and devil_money< devil_max and start>600 then
 local previous = SetWorldBuilderThisPlayer(1)
 ExecuteAction('PLAYER_GIVE_MONEY','Player_3','-100')
 devil_money=devil_money+100
 exShowCustomBtnChoiceDialogForPlayer(playerName,103,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. devil_max..'):'..devil_money,'鍚戞伓榄旀敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戞伓榄旀椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍥炲埌鎴樺満','璐拱100鎭堕瓟鎶曡祫','','','') 
 exAddTextToPublicBoardForPlayer(playerName,'鎶曡祫鎴愬姛',5)
 else 
 exAddTextToPublicBoardForPlayer(playerName,'鏉′欢涓嶆弧瓒?',5)
 exShowCustomBtnChoiceDialogForPlayer(playerName,103,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. devil_max..'):'..devil_money,'鍚戞伓榄旀敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戞伓榄旀椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍥炲埌鎴樺満','璐拱100鎭堕瓟鎶曡祫','','','') 
 end
 end
 if playerName == "Player_4" and btnIndex == 4 and dialogId == 104 then
 local money = exPlayerGetCurrentMoney(playerName)
 if money>=100 and angel_money< angel_max and start>600 then
 local previous = SetWorldBuilderThisPlayer(1)
 ExecuteAction('PLAYER_GIVE_MONEY','Player_4','-100')
 angel_money=angel_money+100
 exShowCustomBtnChoiceDialogForPlayer(playerName,104,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. angel_max..'):'..angel_money,'鍚戝ぉ浣挎椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍚戝ぉ浣跨┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100澶╀娇鎶曡祫','','','') 
 exAddTextToPublicBoardForPlayer(playerName,'鎶曡祫鎴愬姛',5)
 else 
 exAddTextToPublicBoardForPlayer(playerName,'鏉′欢涓嶆弧瓒?',5)
 exShowCustomBtnChoiceDialogForPlayer(playerName,104,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. angel_max..'):'..angel_money,'鍚戝ぉ浣挎椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍚戝ぉ浣跨┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100澶╀娇鎶曡祫','','','') 
 end
 end
 if playerName == "Player_5" and btnIndex == 4 and dialogId == 105 then
local money = exPlayerGetCurrentMoney(playerName)
if money>=100 and angel_money< angel_max and start>600 then
local previous = SetWorldBuilderThisPlayer(1)
ExecuteAction('PLAYER_GIVE_MONEY','Player_5','-100')
angel_money=angel_money+100
exShowCustomBtnChoiceDialogForPlayer(playerName,105,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. angel_max..'):'..angel_money,'鍚戝ぉ浣挎敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戝ぉ浣跨┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100澶╀娇鎶曡祫','','','') 
exAddTextToPublicBoardForPlayer(playerName,'鎶曡祫鎴愬姛',5)
else 
exAddTextToPublicBoardForPlayer(playerName,'鏉′欢涓嶆弧瓒?',5)
exShowCustomBtnChoiceDialogForPlayer(playerName,105,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. angel_max..'):'..angel_money,'鍚戝ぉ浣挎敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戝ぉ浣跨┖鍐涘徃浠よ浆绉?000璧勯噾','鍥炲埌鎴樺満','璐拱100澶╀娇鎶曡祫','','','') 
end
end
if playerName == "Player_6" and btnIndex == 4 and dialogId == 106 then
local money = exPlayerGetCurrentMoney(playerName)
if money>=100 and angel_money< angel_max and start>600 then
local previous = SetWorldBuilderThisPlayer(1)
ExecuteAction('PLAYER_GIVE_MONEY','Player_5','-100')
angel_money=angel_money+100
exShowCustomBtnChoiceDialogForPlayer(playerName,106,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. angel_max..'):'..angel_money,'鍚戝ぉ浣挎敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戝ぉ浣挎椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍥炲埌鎴樺満','璐拱100澶╀娇鎶曡祫','','','') 
exAddTextToPublicBoardForPlayer(playerName,'鎶曡祫鎴愬姛',5)
else 
exAddTextToPublicBoardForPlayer(playerName,'鏉′欢涓嶆弧瓒?',5)
exShowCustomBtnChoiceDialogForPlayer(playerName,106,'娆㈣繋杩涘叆浜ゆ槗甯傚満\n鎶曡祫閲戦(涓婇檺'.. angel_max..'):'..angel_money,'鍚戝ぉ浣挎敾鍑诲崟鍏冭浆绉?000璧勯噾','鍚戝ぉ浣挎椂绌虹鐞嗗憳杞Щ1000璧勯噾','鍥炲埌鎴樺満','璐拱100澶╀娇鎶曡祫','','','') 
end
end
SetworldBuilderThisPlayer(previous)
end