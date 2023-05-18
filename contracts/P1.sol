// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// 用来判断哈希表中是否有对应的键值
library Library {
    struct MapData {
        uint256 val;
        uint8 flag;
    }
}

contract P1 {
    // sol不支持函数内声明mapping（256位无碰撞哈希会撑爆内存），只能声明为状态变量，实际使用时会有非常大的gas开销。
    mapping(int256 => Library.MapData) private map;

    function twoSum(int256[] calldata nums, int256 target) external returns (uint256, uint256) {
        for (uint256 i = 0; i < nums.length; i++) {
            map[nums[i]] = Library.MapData({ val: i, flag: 1 });
        }
        for (uint256 i = 0; i < nums.length; i++) {
            int256 offset = target - nums[i];
            if (map[offset].flag == 1) {
                return (i, map[offset].val);
            }
        }
        return (0, 0);
    }
}
