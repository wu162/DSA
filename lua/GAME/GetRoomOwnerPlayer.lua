local previous = SetWorldBuilderThisPlayer(1)

local structures, count = CopyPlayerRegisteredObjectSet("<1st Human Player>", "STRUCTURES")

local teamName = ObjectTeamName(structures[1])
g_RoomOwnerPlayer = g_objectTeamNameToPlayerName[teamName]
SetWorldBuilderThisPlayer(previous)