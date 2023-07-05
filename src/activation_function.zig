const std = @import("std");
const testing = std.testing;

// step function
// a is array of type of T
// if a value is less than 0, return 0
// otherwise return 1

pub fn step(comptime T: type, a: []T, comptime len: usize) ![]T {
    var result: [len]T = undefined;
    for (a, 0..) |value, i| {
        if (value < 0) {
            result[i] = 0;
        } else {
            result[i] = 1;
        }
    }
    return result[0..len];
}

test "step function" {
    var a: [5]f32 = undefined;
    a[0] = -1.0;
    a[1] = 2.0;
    a[2] = 3.0;
    a[3] = -4.0;
    a[4] = 5.0;
    var result: []f32 = try step(f32, &a, a.len);
    try testing.expectEqual(result[0], 0.0);
    try testing.expectEqual(result[1], 1.0);
    try testing.expectEqual(result[2], 1.0);
    try testing.expectEqual(result[3], 0.0);
    try testing.expectEqual(result[4], 1.0);
}
