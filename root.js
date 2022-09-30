const { MerkleTree } = require('merkletreejs');
const keccak256 = require('keccak256');

const addresses = ["0xAA441bEAcB48f7d2a62374aBbd2154cB4C22c84a","0xC3032725b2b46bE569B03925484C80D593c88443", "0x728F2B96D15BDaa88368a371B4BD77CeA0083166", "0x5B38Da6a701c568545dCfcB03FcB875f56beddC4"];


const leaves = addresses.map(x =>keccak256(x));

const tree = new MerkleTree(leaves, keccak256, {sortPairs:true})

const buf2hex = x=> "0x"+ x.toString("hex");


//Getting root
console.log(buf2hex(tree.getRoot()));


//Getting proof for any address
const proof = tree.getProof(keccak256("0x5B38Da6a701c568545dCfcB03FcB875f56beddC4")).map(x=> buf2hex(x.data));

console.log(proof);