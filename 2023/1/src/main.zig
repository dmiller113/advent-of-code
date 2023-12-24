const std = @import("std");
const testing = std.testing;
const ascii = std.ascii;

const DATA_FILE_PATH = "data/input";
const TEST_FILE_PATH = "data/test";

fn handle_input_file(file: std.fs.File) !u32 {
    var buffer_reader = std.io.bufferedReader(file.reader());
    var input_stream = buffer_reader.reader();

    var buffer: [1024]u8 = undefined;
    var accumulator: u32 = 0;

    while (try input_stream.readUntilDelimiterOrEof(&buffer, '\n')) |line| {
        accumulator += try map_calibration_line_to_number(line);
    }

    return accumulator;
}

fn to_number(ch: u8) u8 {
    return ch - '0';
}

fn map_calibration_line_to_number(input_line: []const u8) !u8 {
    var first_number: ?u8 = null;
    var last_number: ?u8 = null;

    for (input_line) |current_character| {
        if (ascii.isDigit(current_character)) {
            var number = to_number(current_character);

            if (null == first_number) {
                first_number = number;
            }

            last_number = number;
        }
    }

    if (first_number) |first| {
        if (last_number) |last| {
            return first * 10 + last;
        }
    }

    return 0;
}

pub fn main() !void {
    var file = try std.fs.cwd().openFile(
        DATA_FILE_PATH,
        .{},
    );
    defer file.close();

    std.debug.print("{}\n", .{try handle_input_file(file)});
}

test "simple test" {
    var file = try std.fs.cwd().openFile(
        TEST_FILE_PATH,
        .{},
    );
    defer file.close();

    try testing.expectEqual(try handle_input_file(file), 142);
}
