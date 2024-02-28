## Setup 
- Reference: https://github.com/alchemyplatform/learn-solidity-presentations
- Install Foundry https://www.linkedin.com/pulse/how-install-foundry-windows-pablo-rego/ . To install founry you need cargo(toolchan for Rust Comipler) and VS Studio runtime libraries 
    - Foundary Consists of: 
        - Forge
        - Cast
        - Anvil
        - Chisel 

```
curl -L https://foundry.paradigm.xyz | bash
```

Use rustup. Installer for system programming language Rust.`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

Then use cargo to install forge and all ohter tools. `cargo install --git https://github.com/foundry-rs/foundry --profile local --locked forge cast chisel anvil`
**Above command takes atleast 15 mins to install; it installs over 1000 packages and consumes 1 GB** 
To uninstall run:  `cargo uninstall forge cast chisel anvil`

### Forge Cli Existing
```bash
# Forcibly create a new project in a non-empty directory:
1a-value-types/examples/0-example-value-types$ forge init --force 
1a-value-types/examples/0-example-value-types$ forge compile
1a-value-types/examples/0-example-value-types$ forge test
```
### Forge Cli New
```bash
learn-solidity$ forge init 11-reentracy-attack
```