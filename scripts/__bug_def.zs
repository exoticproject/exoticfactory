#priority 9000

import crafttweaker.liquid.ILiquidStack;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
//                                                          Basic以上のみで処理可能

global bug_basic_cost as int = 16;

global matter_item as int[IItemStack] = {
    <minecraft:dirt> : 1
};

global bug_basic as string[] = [
    "Iron",
    "Gold",
    "Silver",
    "Copper",
    "Tin",
    "Lead",
    "Coal" 
];

global bns_liquid_basic as float[ILiquidStack] = {
    <liquid:bnsone> * 10 : 0.25
};

//                                                          Advanced以上のみで処理可能

global bug_advanced as string[] = [

];

global bns_liquid_advanced as float[ILiquidStack] = {
};

//                                                          Elite以上のみで処理可能

global bug_elite as string[] = [

];

global bns_liquid_elite as float[ILiquidStack] = {
};

//                                                          Ultimate以上のみで処理可能

global bug_ultimate as string[] = [

];

global bns_liquid_ultimate as float[ILiquidStack] = {
};




//以下、下位互換を追加するやつ
for a,b in bns_liquid_basic{
    bns_liquid_advanced[a] = b;
}

for a,b in bns_liquid_advanced{
    bns_liquid_elite[a] = b;
    bns_liquid_ultimate[a] = b;
}
for a,b in bns_liquid_elite{
    bns_liquid_ultimate[a] = b;
}