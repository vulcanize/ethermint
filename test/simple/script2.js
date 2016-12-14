var toAddr = '0xa8ade7feab1ece71446bed25fa0cf6745c19c3d5'
balance = web3.fromWei(eth.getBalance(toAddr), "ether");
console.log(balance)
