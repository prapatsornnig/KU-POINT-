const Token = artifacts.require('Token');
const Reward = artifacts.require('Reward');
const Artic = artifacts.require('Artic');
//---------------------------------------------------------------
//---------------------------------------------------------------

module.exports = function(deployer, networks, accounts) {
  deployer
    .deploy(Token, 10000000)
    .then(async () => {
      const tokenContract = await Token.deployed();
      return deployer.deploy(Reward, tokenContract.address);
    })
    .then(async () => {
      const tokenContract = await Token.deployed();
      return deployer.deploy(Artic, tokenContract.address);
    })
    .then(async () => {
      const token = await Token.deployed();
      const coinbase = accounts[0];
      const value = 500;
      await token.transfer(coinbase, accounts[1], value);
    });
};
//---------------------------------------------------------------------