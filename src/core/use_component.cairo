#[starknet::contract]
pub mod ERC20Contract {

use erc20enable_component::ERC20enableInternalTrait;
use component::interface::component::IERC20enable;
use starknet::storage::StoragePointerReadAccess;
use starknet::storage::StoragePointerWriteAccess;
use component::core::component::erc20enable_component;
use starknet::ContractAddress;

    component!(path: erc20enable_component, storage: erc20, event: ERC20Event);

    #[abi(embed_v0)]
    impl ERC20enableImpl = erc20enable_component::ERC20enable<ContractState>;

    #[storage]
    pub struct Storage {
        item: felt252,
        #[substorage(v0)]
        erc20: erc20enable_component::Storage,
    }

    #[event]
    #[derive(Drop, Debug, starknet::Event)]
    pub enum Event {
        ERC20Event: erc20enable_component::Event,
    }

    #[constructor]
    fn constructor(ref self: ContractState, totalSupply: u128, name: felt252, symbol: felt252, owner: ContractAddress){
        // self.erc20.erc20enable_name.write(name); // TODO: use generate_trait
        //let owner = self.erc20.owner(owner);
        self.erc20._init(totalSupply, name, symbol, owner);
    }

    #[abi(embed_v0)]
    impl ERC20ContractImpl of component::interface::use_component::IERC20Contract<ContractState> {
        fn owner_contract(self: @ContractState) -> ContractAddress {
            self.erc20.owner()
        }
        
        fn getItem(self: @ContractState) -> felt252 {
            self.item.read()
        }

        fn setItem(ref self: ContractState, item: felt252) {
            self.item.write(item);
        }
    }

}