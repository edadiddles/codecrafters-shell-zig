const std = @import("std");

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();

    while (true) {
        try stdout.print("$ ", .{});
        const stdin = std.io.getStdIn().reader();
        var buffer: [1024]u8 = undefined;
        const user_input = try stdin.readUntilDelimiter(&buffer, '\n');

        const input: []u8 = parse_input(user_input);
        const is_valid_builtin = try is_builtin(input);
        if (!is_valid_builtin) {
            try stdout.print("{s}: command not found\n", .{input});
        }
    }
}

fn parse_input(input: []u8) []u8 {
    return input;
}

fn is_builtin(cmd: []u8) !bool {
    _ = cmd;
    return false;
}
