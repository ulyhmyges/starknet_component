use starknet::ContractAddress;

#[starknet::interface]
pub trait IERC20Contract<TContractState> {
    fn owner_contract(self: @TContractState) -> ContractAddress;
}