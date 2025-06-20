local _, ns = ...

local LibBG = ns.LibBG
local L = ns.L

local pt = print

if BG.IsVanilla then
    -- 60服
    -- 黑名单
    BG.Loot.blacklist = {
        -- 60/plus
        17413, 17414, 17682, 17683, 22393, 18600,                      -- 坚韧祷言、野性赐福、暗影防护、奥术光辉
        22727,                                                         -- 橙杖杖柄
        19708, 19713, 19715, 19711, 19710, 19712, 19707, 19714, 19709, -- ZUG蓝色宝石
        213169, 213170, 213641,                                        -- 白银血币、黄金血币、一箱诺莫瑞根回收品
        223327, 223325, 223326, 221474,                                -- plus神庙哈卡任务奖励的蓝装
    }
    -- 白名单
    BG.Loot.whitelist = {
        -- 60/plus
        -- 17962, 17963, 17964, 17965, 17969, -- [一袋宝石]
        17203,                                                      -- MC萨弗隆铁锭
        17204, 227728,                                              -- MC萨弗拉斯之眼
        -- 22376, 22373, 22374, 22375,                                 -- NAXX护甲碎片
        23055,                                                      -- NAXX溶解之语
        21762,                                                      -- AQL/TAQ大型圣甲虫箱的钥匙
        20873, 20869, 20866, 20870, 20868, 20871, 20867, 20872,     -- AQL小怪雕像
        20876, 20879, 20875, 20878, 20881, 20877, 20874, 20882,     -- AQL/TAQ大型圣甲虫箱开出的雕像
        16665,                                                      -- 宁神射击
        18562,                                                      -- [源质矿石]
        15410,                                                      -- [奥妮克希亚鳞片]
        17966, 228992,                                              -- [奥妮克希亚皮袋]
        11382,                                                      -- [山脉之血]
        17012,                                                      -- [熔火犬皮]
        17011,                                                      -- [熔岩之核]
        17010,                                                      -- [炽热之核]
        19939, 19942, 19940, 19941, 231513, 231514, 231515, 231516, -- ZUG隐藏boss掉落的职业物品
        213427,                                                     -- 脏兮兮的回收品
        215449,                                                     -- 世界缩小器
        221021, 221312,                                             -- 梦魇之种、一瓶阿塔莱魔精
        13519, 13522, 18657, 16247,                                 -- 黑上配方
        -- , -- []
        -- , -- []
    }
    -- 杂项
    BG.Loot.zaXiangItems = {
        -- 60/plus
        21237, 21232,                                                   -- 安其拉徽记和武器
        213427,                                                         -- 脏兮兮
        220637, 220636,                                                 -- plusP3套装兑换物
        221021, 221312,                                                 -- 梦魇之种、一瓶阿塔莱魔精
        221298, 221300, 221301, 221302, 221303, 221304, 221305, 221306, -- 梦魇卡牌
        221290, 221291, 221297, 221292, 221296, 221293, 221295, 221294, -- 沙丘卡牌
        221281, 221282, 221284, 221283, 221288, 221287, 221285, 221286, -- 瘟疫卡牌
        221271, 221275, 221273, 221279, 221274, 221278, 221276, 221277, -- 荒野卡牌
    }
else
    -- WLK
    -- 黑名单
    BG.Loot.blacklist = {
        -- CTM
        77951,                                                  -- 暗影宝石
        -- WLK
        49888,                                                  -- 影锋
        48663, 230763,                                          -- 美酒节
        45875, 45878,                                           -- 一包奥杜尔战利品
        45897,                                                  --[重铸的远古王者之锤]
        52006,                                                  --[冰霜珍宝袋]
        51315, 51316, 51317, 51318, 51319, 51320, 51321,        --[密封的箱子]相关物品
        69771, 54806, 225923,                                   -- iLv353、232、225的埃霍恩的冰霜之镰
        30312, 30311, 30317, 30316, 30313, 30314, 30318, 30319, -- 风暴要塞神器
    }
    -- 白名单
    BG.Loot.whitelist = {
        -- WLK
        50226, --[烂肠的酸性血液]
        50231, --[腐面的酸性血液]
        52019, -- 小宝的丝带
        45087, --[ULD宝珠]
        47556, --[TOC宝珠]
        49908, --[ICC宝珠]
        -- TOC图纸
        47622, 47623, 47627, 47626, 47624, 47625, 47629, 47635, 47631, 47630, 47628, 47634, 47632, 47633, 47654, 47655, 47656, 47657,
        47640, 47641, 47642, 47643, 47644, 47645, 47646, 47647, 47648, 47649, 47650, 47651, 47652, 47653, 47639, 47638, 47637, 47636,
        -- , -- []
        -- , -- []
    }
    -- 杂项
    BG.Loot.zaXiangItems = {
        -- CTM
        67424, 67423, 67425, 65087, 65088, 65089, 67430, 67429, 67431,
        67427, 67428, 67426, 65000, 65001, 65002, 64316, 64315, 64314,
        63684, 63683, 63682, -- P1套装兑换物
        -- WLK
        50226,               --[烂肠的酸性血液]
        50231,               --[腐面的酸性血液]
        47242,               --  北伐
        47557, 47558, 47559, -- TOC258套装圣物
        -- test
        -- 10938,
        -- 10939,
    }
end
