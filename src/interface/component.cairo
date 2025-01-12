use starknet::ContractAddress;

#[starknet::interface]
pub trait IERC20enable<TContractState> {
    fn balanceOf(self: @TContractState, account: ContractAddress ) -> u128;
    fn transfer(ref self: TContractState, recipient: ContractAddress, amount: u128);
    fn name(self: @TContractState) -> felt252;
    fn symbol(self: @TContractState) -> felt252;
    fn totalSupply(self: @TContractState) -> u128;
    fn owner(self: @TContractState) -> ContractAddress;
}
