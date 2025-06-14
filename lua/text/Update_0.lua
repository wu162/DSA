
g_UpdateBoxText = {
    [1] = '                                                         \n测试/BUG建议群：219951578地图更新!作者：Myself/群复读机\n1、海域合并。\n2、最前方的苏霍伊会把后方的非重甲或炮车载具往前方空投。\n3、超时空改为技能，将非重甲或炮车载具往前方传送。',
    [2] = '                                                          2.地图更新\n6、神州电厂进行了平衡性调整，前期资金会变少，但后期会更强，盟军先锋变换为AC130\n7、取消了T2船只的无碰撞，略微加快了雅典娜的蓄力时间，第二次升级后盟军可以制造超时空传送仪\n8、修改了开局方式，需要所有人确定看完更新说明才可开始(人机默认阅读完成)\n9、禁用了苏联起重机，修复了冷冻可以秒杀防御塔的BUG，可以更换BGM了，加入了结算动画\n10、修改了技能释放方式，第五回合解锁技能，通过顶部技能栏释放',
    [3] = '                                                          3.地图更新\n10、盟军超时空在建造之后会转换成超时空技能，冷却三回合\n11、上半为天界，下半为地狱，可以随时查看守护者知晓自己的阵营\n12、纳米虫巢会在敌方二塔被摧毁后解锁，并且双方玩家已和电脑结盟，可以给电脑的单位加上自己的协议了\n13、双方铁幕位新增加一个时停的技能，龙船位增加一个可使用两次的空军元帅技能，炸弹位增加一个可以使用两次的持续打击技能\n14、所有除龙船外的升级和协议加成都可以同步对应的电脑\n15、修复了龙船武器bug，减少了龙船数量提高了龙船血量，铁幕时间缩短但可以使用两次',
    [4] = '                                                          4.地图更新\n16、回调了铁幕时间，可以使用两次15秒的铁幕，并且盟军现在点出自由贸易后电厂产能会增加\n17、加入了市场交易，可以向其他玩家转移资金，并且加入了投资功能\n18、队伍里每个人都能进行投资，总金额共享，只能在剩余时间大于40秒的时候进行投资\n19、每回合结束后会统计两边的单位总价值，胜利的一方三个人都可以获得投资里的同等金额，失败方则没有，但失败的一方投资上限会增加(最高上限4000)，并且在胜利后会回到初始上限(400)\n20、一定要选队伍，这样才能在战网记录正常显示，一二塔加装了小型炸弹，巨炮加装了略微的回复效果\n21、加入了投降选项并将技能获取时间调整为第五回合',
    [5] = '                                                          5.地图更新\n1.海里塔被摧毁有赏金，1塔每人500，2塔每人900,3塔每人2100\n2.盟军侦查卫星协议被禁用，元神互锁禁用\n3.科技自然解锁的回合延后，t2在第5回合，t3在第11回合，t4在第18回合\n4.船去到对面出生点的赏金从200提高到300',
    [6] = '                                           6.地图更新\n1.天火塔可以正常使用了\n2.一塔血量提高，两边三塔掉落后的支援单位增强\n3.t4大船和超级要塞解锁逻辑修改：摧毁对方海3塔后才能出t4大船和超级要塞\n4.海2塔被摧毁后，攻击方将获得船坞科技建筑',
    [7] = '                                           7.地图更新\n1.海3塔被摧毁后，将立即额外释放一次达摩克利斯之剑(不消耗顶部按钮释放次数)\n2.海1塔赏金提高到每人1000，海2塔赏金提高到每人2000，海3塔赏金提高到每人5000\n3.海塔被摧毁后，后面的海塔会移动到前面'
}

g_UpdateBoxTextNum = 7;

exShowLongTextDialog(1, g_UpdateBoxText[1],'','清楚!','下一页')

function onUserLongTextDialogEvent(playerName, btnIndex, dialogId)
    local o
    for i=1,6,1 do
        if playerName=='Player_'..i then
            o=i
        end
    end

    if btnIndex == 1 then
        local prev = '';
        if dialogId > 2 then
            prev = '上一页'
        end
        exShowLongTextDialogForPlayer(playerName, dialogId - 1, g_UpdateBoxText[dialogId - 1], prev,'清楚!', '下一页')
    end

    if btnIndex == 3 then
        local next = '';
        if dialogId < (g_UpdateBoxTextNum - 1) then
            next = '下一页'
        end
        exShowLongTextDialogForPlayer(playerName, dialogId + 1, g_UpdateBoxText[dialogId + 1], '上一页','清楚!', next)
    end

    if btnIndex==2 then
        ExecuteAction("CREATE_NAMED_ON_TEAM_AT_WAYPOINT",playerName,'AlliedWallPiece','PlyrCreeps/teamPlyrCreeps','toupiaodian'..o)
        exMessageAppendToMessageArea('$p'..o..'Name已阅读完成')
    end
end