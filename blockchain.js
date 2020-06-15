const fs = require('fs');
const path = require('path');
const Web3 = require('web3');
const TruffleContract = require('@truffle/contract');

const web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
const web3 = new Web3(web3Provider);

const createContractInstance = async artifactName => {
 const artifact = JSON.parse(fs.readFileSync(path.join(__dirname, 'build/contracts', `${artifactName}.json`)));
  const contract = TruffleContract(artifact);
  contract.setProvider(web3Provider);
  return contract.deployed();
};

let shop;
createContractInstance('Reward').then(instance => {
  shop = instance;
});


/*อันเก่า */
//-------------------------------------------------------------------------------------------
const addProduct = async (name, price, quantity, imgPath, seller) => {
  const timestamp = Date.now();
  const pid = timestamp;

  const receipt = await shop.addProduct(pid, name, price, quantity, imgPath, timestamp, { from: seller, gas: 1000000 });
  return { receipt: receipt, pid: pid };
};

/*อันเก่า */
// const buyProduct = async (pid, buyer) => {
//   try {

//     const receipt = await shop.buyProduct(pid, Date.now(), { from: buyer, gas: 1000000 });

//     return receipt;
//   } catch (error) {
//     if (error.reason) throw new Error(error.reason);
//     throw error;
//   }
// };
/*อันเก่า */
//----------------------------------------------------------------------------------------------------
const buyProduct = async (pid, buyer) => {
  try {
    
    const oldBalance = await token.getBalance(buyer);
    
    const receipt = await shop.buyProduct(pid, Date.now(), { from: buyer, gas: 1000000 });
    
    const newBalance = await token.getBalance(buyer);
    const product = await shop.getProduct.call(pid);
    await addBuyHistory(buyer, oldBalance, product.name, product.price, newBalance);

    return receipt;
  } catch (error) {
    if (error.reason) throw new Error(error.reason);
    throw error;
  }
};

//-----------------------------------------------------------------------------------------------------
const getProduct = async pid => {
  const product = await shop.getProduct.call(pid);
  product.id = pid;
  return product;
};

const getAllProducts = async () => {
  const events = await shop.getPastEvents('AddedProduct', { fromBlock: 0 });
  const allPids = events.map(item => item.returnValues.pid);
  return allPids;
};
/* อันเก่า */
//-----------------------------------------------------------------------------------

//---------------------------------------------------------------------------------
/* ใส่เพิ่มมาเอง */
//-------------------------------------------------------------------------------------------------------------
// const getAllHistorys = async () => {
//   const events = await shop.getPastEvents('AddedHistory', { fromBlock: 0 });
//   const allPids = events.map(item => item.returnValues.pid);
//   return allPids;
// };
//-------------------------------------------------------------------------------------------------------------

const getAccounts = () => web3.eth.getAccounts();
const unlockAccount = (address, password) => web3.eth.personal.unlockAccount(address, password);
const getBalance = () =>  web3.eth.getBalance("0x7b596B49a608f9384dF42Afa6121aaB120531e35",function(error, balance) {
  if(!error) {
      console.log(web3.utils.fromWei(balance, 'ether'));
  }
});
//----------------------------------------------------------------------------------------------------------------------------
/* ตามโค้ดอาจาร์ย */
//--------------------------------------------------------------------------------------------------------------
const getBuyHistory = async hid => {
  const buyHistory = await shop.getBuyHistory.call(hid);
  buyHistory.id = hid;
  return buyHistory;
};

const getAllBuyHistory = async () => {
  const events = await shop.getPastEvents('AddedBuyHistory', { fromBlock: 0 });
  const allHids = events.map(item => item.returnValues.hid);
  return allHids;
};

const addBuyHistory = async (buyer, oldBalance, productName, price, newBalance) => {
  try { 
    const dt = new Date();
    var mm = dt.getMonth() < 9 ? "0" + (dt.getMonth() + 1) : (dt.getMonth() + 1); // getMonth() is zero-based
    var dd = dt.getDate() < 10 ? "0" + dt.getDate() : dt.getDate();
    var hh = dt.getHours() < 10 ? "0" + dt.getHours() : dt.getHours();
    var min = dt.getMinutes() < 10 ? "0" + dt.getMinutes() : dt.getMinutes();
    const dateStr =  dd + '/' + mm + '/' + dt.getFullYear() + ' ' + hh + ':' + min;
    
    const timestamp = Date.now();
    const hid = timestamp;
    const receipt = await shop.addBuyHistory(hid, buyer, oldBalance, productName, price, newBalance, dateStr, { from: buyer, gas: 1000000 });
    return { receipt: receipt, hid: hid };
  } catch (error) {
    if (error.reason) throw new Error(error.reason);
    throw error;
  }
};

//--------------------------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------------------------------------------
let shops;
createContractInstance('Artic').then(instance => {
  shops = instance;
});

const addArticle = async (name, point, num, imgPaths, seller) => {
  const timestamp = Date.now();
  const pid = timestamp;

  const receipt = await shops.addArticle(pid, name, point, num, imgPaths, timestamp, { from: seller, gas: 1000000 });

  return { receipt: receipt, pid: pid };
};

/*ิอันเก่า */
//-----------------------------------------------------------------------------------------------------------
// const buyArticle = async (pid, buyer) => {
//   try {
//     const receipt = await shops.buyArticle(pid, Date.now(), { from: buyer, gas: 1000000 });

//     return receipt;
//   } catch (error) {
//     if (error.reason) throw new Error(error.reason);
//     throw error;
//   }
// };
//------------------------------------------------------------------------------------------------------------
const buyArticle = async (pid, buyer) => {
  try {
    
    const oldBalance = await token.getBalance(buyer);
    
    const receipt = await shops.buyArticle(pid, Date.now(), { from: buyer, gas: 1000000 });
    
    const newBalance = await token.getBalance(buyer);
    const article = await shops.getArticle.call(pid);
    await addBuyActivity(buyer, oldBalance, article.name, article.point, newBalance);

    return receipt;
  } catch (error) {
    if (error.reason) throw new Error(error.reason);
    throw error;
  }
};

//------------------------------------------------------------------------------------------------------------
const getArticle = async pid => {
  const article = await shops.getArticle.call(pid);
  article.id = pid;
  return article;
};

const getAllArticles = async () => {
  const events = await shops.getPastEvents('AddedArticle', { fromBlock: 0 });
  const allPids = events.map(item => item.returnValues.pid);
  return allPids;
};
//---------------------------------------------------------------------------------------------------------------
const getBuyActivity = async aid => {
  const buyActivity = await shops.getBuyActivity.call(aid);
  buyActivity.id = aid;
  return buyActivity;
};

const getAllBuyActivity = async () => {
  const events = await shops.getPastEvents('AddedBuyActivity', { fromBlock: 0 });
  const allAids = events.map(item => item.returnValues.aid);
  return allAids;
};

const addBuyActivity = async (buyer, oldBalance, activityName, point, newBalance) => {
  try { 
    const dt = new Date();
    var mm = dt.getMonth() < 9 ? "0" + (dt.getMonth() + 1) : (dt.getMonth() + 1); // getMonth() is zero-based
    var dd = dt.getDate() < 10 ? "0" + dt.getDate() : dt.getDate();
    var hh = dt.getHours() < 10 ? "0" + dt.getHours() : dt.getHours();
    var min = dt.getMinutes() < 10 ? "0" + dt.getMinutes() : dt.getMinutes();
    const dateStr =  dd + '/' + mm + '/' + dt.getFullYear() + ' ' + hh + ':' + min;
    
    const timestamp = Date.now();
    const aid = timestamp;
    const receipt = await shops.addBuyActivity(aid, buyer, oldBalance, activityName, point, newBalance, dateStr, { from: buyer, gas: 1000000 });
    return { receipt: receipt, aid: aid };
  } catch (error) {
    if (error.reason) throw new Error(error.reason);
    throw error;
  }
};

//-------------------------------------------------------------------------------------------------------------
/* เพิ่มมาเอง */ 
//-------------------------------------------------------------------------------------------------------------
// const getAllActivity = async () => {
//   const events = await shops.getPastEvents('AddedActivity', { fromBlock: 0 });
//   const allPids = events.map(item => item.returnValues.pid);
//   return allPids;
// };
//-------------------------------------------------------------------------------------------------------------

//----------------------------------------------------------------------------------------------------------------------------------
let token;
createContractInstance('Token').then(instance => {
  token = instance;
});

const getBalanceToken = async address => {
  const balance = await token.getBalance.call(address);
  return balance;
}
//------------------------------------------------------------------------------------------------------------------------------------


module.exports = {
  addProduct,
  buyProduct,
  getProduct,
  getAccounts,
  unlockAccount,
  getAllProducts,
  getBalance,
  //------------------
  addArticle,
  buyArticle,
  getArticle,
  getAllArticles,
  //-----------------
  getBalanceToken,
  // getAllHistorys,
  // getAllActivity,
  //--------------
  getBuyHistory,
  getAllBuyHistory,
  addBuyHistory,
  //--------------
  getBuyActivity,
  getAllBuyActivity,
  addBuyActivity,
 }
