// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract SocialMedia{
    struct post{
        address owner;
        string title;
        string description;
        uint likes;
        uint createdat;

    }

    // post[] public  Allpost;
    mapping (uint => post) Allpost;
    uint public postNo;
    function createPost(string memory _title,string memory _desc) public {
         Allpost[postNo].owner = msg.sender;
         Allpost[postNo].title = _title;
         Allpost[postNo].description = _desc;
         Allpost[postNo].createdat = block.timestamp;
         postNo++;


    }

    function getPost() public  view returns(post[] memory){
         post[] memory allp = new post[](postNo);

        for(uint i=0;i<postNo ;i++)
        {
            post storage item = Allpost[i];
            allp[i] = item;
        }

        return allp;
    }
}