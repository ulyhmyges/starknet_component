# School Project

## Create a Component from an ERC20 token with Cairo

### Contracts

- name: erc20enable_component
- path: src/core/component.cairo

- name: ERC20Contract
- path: src/core/use_component.cairo

### Build project

```sh
scarb build
```

### Declare contract

```sh
starkli declare --network=sepolia --keystore=$STARKNET_KEYSTORE --account=$STARKNET_ACCOUNT target/dev/<CONTRACT>_class.json
```

### Deploy contract on Sepolia

```sh
starkli deploy 
--network=sepolia 
--keystore=$STARKNET_KEYSTORE 
--account=$STARKNET_ACCOUNT 
<CLASS-HASH>
50 358434828907 5461067 <OWNER ADDRESS>
```

Environment variables are defined in .env file (STARKNET_KEYSTORE, STARKNET_ACCOUNT, etc...)

Example:

```sh
starkli deploy --network=sepolia --keystore=$STARKNET_KEYSTORE --account=$STARKNET_ACCOUNT 0x01ab09040e92f916a6871d6651dd49cfc75797d60b23e10a0d16118268739dd3 500000 1414091849 1414091849 0x00a73a3EeDe589E6b4596915329a5f056294D1f479172788f8bbD438e012E995
```
