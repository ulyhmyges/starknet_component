use starknet::ContractAddress;

#[starknet::interface]
pub trait IERC20Contract<TContractState> {
    fn owner_contract(self: @TContractState) -> ContractAddress;
    fn getItem(self: @TContractState) -> felt252;
    fn setItem(ref self: TContractState, item: felt252);
}