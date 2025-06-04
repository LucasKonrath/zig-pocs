const std = @import("std");

pub fn main() !void {
    // Integer types
    const i8_num: i8 = -128;
    const u8_num: u8 = 255;
    const i16_num: i16 = -32768;
    const u16_num: u16 = 65535;
    const i32_num: i32 = -2147483648;
    const u32_num: u32 = 4294967295;

    // Floating point types
    const f32_num: f32 = 3.14159;
    const f64_num: f64 = 3.14159265359;

    // Boolean type
    const bool_val: bool = true;

    // Character type (which is actually just u8)
    const char_val: u8 = 'A';

    // Printing all values
    std.debug.print("\nIntegers:\n", .{});
    std.debug.print("i8: {}\n", .{i8_num});
    std.debug.print("u8: {}\n", .{u8_num});
    std.debug.print("i16: {}\n", .{i16_num});
    std.debug.print("u16: {}\n", .{u16_num});
    std.debug.print("i32: {}\n", .{i32_num});
    std.debug.print("u32: {}\n", .{u32_num});

    std.debug.print("\nFloating points:\n", .{});
    std.debug.print("f32: {d:.5}\n", .{f32_num});
    std.debug.print("f64: {d:.10}\n", .{f64_num});

    std.debug.print("\nOther types:\n", .{});
    std.debug.print("bool: {}\n", .{bool_val});
    std.debug.print("char: {c} (ASCII: {})\n", .{char_val, char_val});

    var buffer: [100]u8 = undefined;
    const stdout = std.io.getStdOut().writer();

    try stdout.print("Enter pizza diameter in centimeters: ", .{});

    const stdin = std.io.getStdIn();

    // Create a buffered reader
    var buf_reader = std.io.bufferedReader(stdin.reader());
    var reader = buf_reader.reader();

    // Read line from stdin using the buffered reader
    const user_input = try reader.readUntilDelimiter(&buffer, '\n');

    // Convert string to float
    const diameter = try std.fmt.parseFloat(f64, user_input);

    // Calculate area using the separate function
    const area = calculatePizzaArea(diameter);

    // Print the result with 2 decimal places
    try stdout.print("\nPizza area: {d:.2} square centimeters\n", .{area});


}


fn calculatePizzaArea(diameter: f64) f64 {
        const radius = diameter / 2.0;
        return std.math.pi * radius * radius;
}