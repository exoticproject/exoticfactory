#priority 9000

import crafttweaker.liquid.ILiquidStack;

//                                                          Basic以上のみで処理可能

global bug_basic as ILiquidStack[string] = {
    "Iron" : <liquid:iron>,
    "Gold" : <liquid:gold>,
    "Silver" : <liquid:silver>,
    "Copper" : <liquid:copper>,
    "Tin" : <liquid:tin>,
    "Lead" : <liquid:lead>,
    "Coal" : <liquid:lava>
};

global bns_liquid_basic as float[ILiquidStack] = {
    <liquid:bnsone> * 10 : 0.25
};

//                                                          Advanced以上のみで処理可能

global bug_advanced as ILiquidStack[string] = {

};

global bns_liquid_advanced as float[ILiquidStack] = {
};

//                                                          Elite以上のみで処理可能

global bug_elite as ILiquidStack[string] = {

};

global bns_liquid_elite as float[ILiquidStack] = {
};

//                                                          Ultimate以上のみで処理可能

global bug_ultimate as ILiquidStack[string] = {

};

global bns_liquid_ultimate as float[ILiquidStack] = {
};




//以下、下位互換を追加するやつ
for a,b in bug_basic{
    bug_advanced[a] = b;
}

for a,b in bns_liquid_basic{
    bns_liquid_advanced[a] = b;
}

for a,b in bug_advanced{
    bug_elite[a] = b;
    bug_ultimate[a] = b;
}

for a,b in bns_liquid_advanced{
    bns_liquid_elite[a] = b;
    bns_liquid_ultimate[a] = b;
}

for a,b in bug_elite{
    bug_ultimate[a] = b;
}

for a,b in bns_liquid_elite{
    bns_liquid_ultimate[a] = b;
}