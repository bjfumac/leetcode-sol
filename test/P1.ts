import { loadFixture } from "@nomicfoundation/hardhat-network-helpers";
import { expect } from "chai";
import { ethers } from "hardhat";

import { P1__factory } from "./../types/factories/P1__factory";

describe("P1. Two Sum - 两数之和", function () {
  async function deployFixture() {
    const contract: P1__factory = <P1__factory>await ethers.getContractFactory("P1");
    const problem = await contract.deploy();
    return { problem };
  }

  describe("Test", function () {
    it("Should be [0, 1]", async function () {
      const { problem } = await loadFixture(deployFixture);
      const result = await problem.callStatic.twoSum([2, 7, 11, 15], 9);
      expect(result).to.deep.equal([0, 1]);
    });
  });
});
