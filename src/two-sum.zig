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

fn twoSumSmartSolution(nums: []const i32, target: i32) ? [2]usize {

    // Create an allocator
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var map = std.AutoHashMap(i32, usize).init(allocator);
    // Remember to free the map's memory when done
    defer map.deinit();

    for (nums, 0..) |num, index| {
        if (map.get(target - num)) |value| {
            return .{ value, index };
        }
        map.put(num, index) catch return null;
    }

    return null;
}

pub fn main() !void {
    const arr = [_]i32{ 2, 7, 11, 15 };
    if (twoSumDumbSolution(&arr, 9)) |indices| {
        std.debug.print("Found indices duumb: {any}\n", .{indices});
    } else {
        std.debug.print("No solution found dumb\n", .{});
    }

    if (twoSumSmartSolution(&arr, 9)) |indices| {
        std.debug.print("Found indices smart: {any}\n", .{indices});
    } else {
        std.debug.print("No solution found smart\n", .{});
    }
}