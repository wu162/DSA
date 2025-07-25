exMessageAppendToMessageArea("等待房主选择游戏模式")
g_objectTeamNameToPlayerName = {
    ["teamPlayer_1"] = "Player_1",
    ["teamPlayer_2"] = "Player_2",
    ["teamPlayer_3"] = "Player_3",
    ["teamPlayer_4"] = "Player_4",
    ["teamPlayer_5"] = "Player_5",
    ["teamPlayer_6"] = "Player_6",
}

local previous = SetWorldBuilderThisPlayer(1)

local structures, count = CopyPlayerRegisteredObjectSet("<1st Human Player>", "STRUCTURES")

local teamName = ObjectTeamName(structures[1])
g_RoomOwnerPlayer = g_objectTeamNameToPlayerName[teamName]
exShowCustomBtnChoiceDialogForPlayer(g_RoomOwnerPlayer, 201, "选择游戏模式", '正常模式', '死亡模式', '缩小模式', '', '', '', '')


SetworldBuilderThisPlayer(previous)