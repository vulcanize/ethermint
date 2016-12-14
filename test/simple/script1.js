primary = eth.accounts[0];
balance = web3.fromWei(eth.getBalance(primary), "ether");
personal.unlockAccount(primary, "abc", 100)

console.log(primary)
console.log(balance)
console.log("gas price")
console.log(web3.eth.gasPrice)

var toAddr = '0xa8ade7feab1ece71446bed25fa0cf6745c19c3d5'
eth.sendTransaction({from: primary, to: toAddr, value: web3.toWei(1, "ether"), gas: 90000, gasPrice: web3.eth.gasPrice})
