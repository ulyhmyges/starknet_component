
#[starknet::component]
pub mod erc20enable_component {
    
    use starknet::storage::{StoragePointerReadAccess, StoragePointerWriteAccess};
    use starknet::storage::Map;
    use starknet::storage::StoragePathEntry;
    use starknet::ContractAddress;
    use starknet::get_caller_address;

    #[storage]
    pub struct Storage {
        erc20enable_name: felt252,
        erc20enable_symbol: felt252,
        erc20enable_totalSupply: u128,
        erc20enable_balance: Map::<ContractAddress, u128>,
        erc20enable_owner: ContractAddress
    }

    #[derive(Drop, Debug, starknet::Event)]
    pub struct ERC20Event {}

    #[event]
    #[derive(Drop, Debug, starknet::Event)]
    pub enum Event {
        ERC20Event: ERC20Event,
    }

    #[embeddable_as(ERC20enable)]
    impl ERC20enableImpl<TContractState, +HasComponent<TContractState>,> of component::interface::component::IERC20enable<ComponentState<TContractState>> {
        fn balanceOf(self: @ComponentState<TContractState>, account: ContractAddress ) -> u128 {
            self.erc20enable_balance.entry(account).read()
        }
        fn transfer(ref self: ComponentState<TContractState>, recipient: ContractAddress, amount: u128) {
            let caller = get_caller_address();
            let funds = self.erc20enable_balance.entry(caller).read();
            assert(amount != 0, 'Need some funds');
            assert(funds >= amount, 'Not enough funds');
            self.erc20enable_balance.entry(caller).write(funds - amount);
            let funds_recipient = self.erc20enable_balance.entry(recipient).read();
            self.erc20enable_balance.entry(recipient).write(funds_recipient + amount);
            // self.emit(Transfer{from: caller, to: recipient, amount: amount});
            self.emit(Event::ERC20Event(ERC20Event {}))
        }
        fn name(self: @ComponentState<TContractState>) -> felt252 {
            self.erc20enable_name.read()
        }
        fn symbol(self: @ComponentState<TContractState>) -> felt252 {
            self.erc20enable_symbol.read()
        }
        fn totalSupply(self: @ComponentState<TContractState>) -> u128 {
            self.erc20enable_totalSupply.read()
        }

        fn owner(self: @ComponentState<TContractState>) -> ContractAddress {
            self.erc20enable_owner.read()
        }
    }

}