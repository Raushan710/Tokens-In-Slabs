// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract addTOken {

  //creating 5 different slabs
    uint256[5] tokenslabs;

  //total number of tokens added
    uint Totalsupply = 0;

  //mapping address to slabNumbers
    mapping (address => string[]) map;

   // depicting different slabs's  capacities
    function slabCapacities(uint slabNumber) public view returns(uint capacity){

        uint cap = 0;

       if(slabNumber==0)
       cap=100;

       else if(slabNumber==1)
       cap=200;

       else if(slabNumber==2)
       cap=300;

       else if(slabNumber==3)
       cap=400;

       else if(slabNumber==4)
       cap=500;

       return cap;
    }
   
   //adding tokens to the slab from higher level to lower level
    function Deposite (uint256 token) public returns (string memory) {
        if(Totalsupply + token <= 1500 && token > 0){
            uint256 LeftTokens=token;
            
            // for slab 4
             if((500-tokenslabs[4])>0){
                 if((500-tokenslabs[4])>=LeftTokens){
                     tokenslabs[4]+=LeftTokens;
                     LeftTokens=0;

                     map[msg.sender].push("SLAB 4");
                 }else{
                     LeftTokens-=(500-tokenslabs[4]);
                     tokenslabs[4]=500;
                     map[msg.sender].push("SLAB 4");

                 }
                 
             }
            
            // for slab 3
            if((400-tokenslabs[3])>0 && LeftTokens>0){
                 if((400-tokenslabs[3])>=LeftTokens){
                     tokenslabs[3]+=LeftTokens;
                     LeftTokens=0;
                     map[msg.sender].push("SLAB 3");
                 }else{
                     LeftTokens-=(400-tokenslabs[3]);
                     tokenslabs[3]=400;
                     map[msg.sender].push("SLAB 3");

                 }
                 
             }

            // for slab 2
            if((300-tokenslabs[2])>0 && LeftTokens>0){
                 if((300-tokenslabs[2])>=LeftTokens){
                     tokenslabs[2]+=LeftTokens;
                     LeftTokens=0;
                     map[msg.sender].push("SLAB 2");
                 }else{
                     LeftTokens-=(300-tokenslabs[2]);
                     tokenslabs[2]=300;
                     map[msg.sender].push("SLAB 2");

                 }
                 
             }
            
            // for slab 1
            if((200-tokenslabs[1])>0 && LeftTokens>0){
                 if((200-tokenslabs[1])>=LeftTokens){
                     tokenslabs[1]+=LeftTokens;
                     LeftTokens=0;
                     map[msg.sender].push("SLAB 1");
                 }else{
                     LeftTokens-=(200-tokenslabs[1]);
                     tokenslabs[1]=200;
                     map[msg.sender].push("SLAB 1");

                 }
                 
             }

            // for slab 0
            if((100-tokenslabs[0])>0 && LeftTokens>0){
                 if((100-tokenslabs[0])>=LeftTokens){
                     tokenslabs[0]+=LeftTokens;
                     LeftTokens=0;
                     map[msg.sender].push("SLAB 0");
                 }else{
                     LeftTokens-=(100-tokenslabs[0]);
                     tokenslabs[0]=100;
                     map[msg.sender].push("SLAB 0");

                 }
                 
             }


        } else {
            if(token==0){
                return "token is empty";
            }
            return "All slabs are full";
        }

     return "Token is deposited"; 
    }

    //enquiring how many slabs contain tokens
    function inquire(address Address) public view returns (string[] memory){

        return map[Address];
    }
}
