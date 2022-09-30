const { MerkleTree } = require('merkletreejs');
const keccak256 = require('keccak256');

const addresses = ["0x5B38Da6a701c568545dCfcB03FcB875f56beddC4","0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2", "0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db", "0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB"];


const leaves = addresses.map(x =>keccak256(x));

const tree = new MerkleTree(leaves, keccak256, {sortPairs:true})

const buf2hex = x=> "0x"+ x.toString("hex");


//Getting root
console.log(buf2hex(tree.getRoot()));


//Getting proof for any address
const proof = tree.getProof(keccak256("0x5B38Da6a701c568545dCfcB03FcB875f56beddC4")).map(x=> buf2hex(x.data));

console.log(proof);