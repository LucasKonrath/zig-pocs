const std = @import("std");

fn twoSumDumbSolution(nums: []const i32, target: i32) ?[2]usize {
    for (nums, 0..) |num1, i| {
        for (nums[i + 1..], 0..) |num2, j| {
            if (num1 + num2 == target) {
                return [2]usize{ i, i + 1 + j };
            }
        }
    }
    return null;
}

pub fn main() !void {
    const arr = [_]i32{ 2, 7, 11, 15 };
    if (twoSumDumbSolution(&arr, 9)) |indices| {
        std.debug.print("Found indices: {any}\n", .{indices});
    } else {
        std.debug.print("No solution found\n", .{});
    }
}