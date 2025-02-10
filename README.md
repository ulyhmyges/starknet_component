## Create a ERC20 token from scratch with Cairo

### Contract
- name : SimpleERC2OContract
- path : src/core/simpleERC20.cairo

### Build project
```
scarb build
```

### Declare contract
```
starkli declare --network=sepolia --keystore=$STARKNET_KEYSTORE --account=$STARKNET_ACCOUNT target/dev/<CONTRACT>_class.json
```

### Deploy contract on Sepolia
```
starkli deploy 
--network=sepolia 
--keystore=$STARKNET_KEYSTORE 
--account=$STARKNET_ACCOUNT 
<CLASS-HASH>
50 358434828907 5461067 <OWNER ADDRESS>
```

starkli deploy 
--network=sepolia 
--keystore=$STARKNET_KEYSTORE 
--account=$STARKNET_ACCOUNT 
0x04355e870ce28a3832398ea3948ad8134c11c170a3b6c12f3208090d06e27213 1414091849