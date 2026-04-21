const { ethers } = require("ethers");

async function main() {
    const Vault = await ethers.getContractFactory("FractionalVault");
    const vault = await Vault.deploy();
    await vault.waitForDeployment();

    console.log("FractionalVault deployed to:", await vault.getAddress());
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
