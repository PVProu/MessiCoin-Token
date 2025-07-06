# MessiCoin (D10S)

**MessiCoin** is a custom-built ERC20 token smart contract developed in Solidity using the OpenZeppelin library. Inspired by the legendary Lionel Messi, this token showcases advanced features such as controlled token distribution, blacklist enforcement, transfer pausing, and secure burning—all following industry best practices.

---

## ✨ Key Features

- 🔐 **OpenZeppelin Integration** – Built on the trusted ERC20 and Pausable modules.
- 📦 **Fixed Supply** – Hard-capped at 100,000 tokens (18 decimals).
- 🚫 **Blacklist System** – Blocks malicious or unwanted addresses from transferring or receiving tokens.
- ⛔ **Pause Functionality** – The owner can globally pause/resume transfers.
- 🔥 **Token Burning** – Any user can burn (destroy) their own tokens.
- 💼 **Automated Token Allocation** at deployment:
  - 10% to presale
  - 30% to rewards
  - 30% to DEX liquidity
  - 25% to the team
  - 5% to the owner

---

## 🧠 Tech Stack

- **Solidity v0.8.24**
- **OpenZeppelin Contracts v4**
- Compatible with all EVM-based chains: Ethereum, Polygon, BNB Chain, etc.

---

## 🛡 Security & Access Control

- Custom `modifiers` ensure access control:
  - `onlyOwner`: restricts critical functions
  - `notBlacklisted`: prevents blacklisted users from transacting
- Uses `require()` and `revert()` for clear validation and error messaging
- Emits events to support off-chain indexing (e.g., The Graph, Etherscan)

---

## 🧪 Notable Functions

| Function             | Purpose                                                |
|----------------------|--------------------------------------------------------|
| `safeTransfer()`     | Secure transfer with blacklist & pause validation      |
| `burnTokens()`       | Users can burn their own tokens                        |
| `setBlackList()`     | Owner adds/removes addresses from the blacklist        |
| `pause()` / `unpause()` | Global transfer control                           |
| `getBlacklistStatus()` | Public view of blacklist state                      |

---

## 🚀 Deployment Instructions

1. Clone or import the contract into Remix or Hardhat.
2. Provide four wallet addresses in the constructor:
   - Presale
   - Rewards
   - DEX Liquidity
   - Team
3. Deploy the contract.
4. Interact via MetaMask, Remix UI, or a custom Web3 frontend.

---

## 👨‍💻 About the Author

This project was built as part of my journey into Web3 and smart contract development. I'm passionate about combining **technology, creativity, and freedom**, and I'm actively exploring roles in blockchain, Web3, or fintech ecosystems.

> Let's connect!  
If you'd like to test, audit, or collaborate, feel free to reach out via GitHub or LinkedIn.

---

## 📄 License

[LGPL-3.0-only](https://spdx.org/licenses/LGPL-3.0-only.html)
