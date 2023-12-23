// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.12;

import "forge-std/Script.sol";
import "../src/WalletFactory.sol";
import {IEntryPoint} from "account-abstraction/interfaces/IEntryPoint.sol";

contract WalletFactoryScript is Script {
    // Address of the EntryPoint contract on Goerli
    IEntryPoint constant ENTRYPOINT =
        IEntryPoint(0xE1B5Bd544fd88fedDdC2e5C62614bfECD053Eb14);

    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY"); // Fetch the private key from environment variables
        vm.startBroadcast(deployerPrivateKey); // Start broadcasting transactions

        WalletFactory walletFactory = new WalletFactory(ENTRYPOINT); // Initialize the WalletFactory contract

        vm.stopBroadcast(); // Stop broadcasting transactions
    }
}