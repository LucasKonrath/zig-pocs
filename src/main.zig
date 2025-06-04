const std = @import("std");
pub fn main() !void {
    std.debug.print("Hello world!", .{});
}

/// This imports the separate module containing `root.zig`. Take a look in `build.zig` for details.
const lib = @import("zig_poc_lib");

/// primitive types
const signed_8_int: i8 = -10;
