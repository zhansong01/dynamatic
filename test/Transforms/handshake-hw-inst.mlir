// NOTE: Assertions have been autogenerated by utils/generate-test-checks.py
// RUN: dynamatic-opt %s --lower-cf-to-handshake --split-input-file | FileCheck %s

// CHECK-LABEL:   handshake.func @hw_inst(
// CHECK-SAME:                            %[[VAL_0:.*]]: !handshake.control<>, ...) -> (!handshake.channel<i32>, !handshake.control<>) attributes {argNames = ["start"], resNames = ["out0", "end"]} {
// CHECK:           %[[VAL_1:.*]] = source {handshake.bb = 0 : ui32, handshake.name = "source0"} : <>
// CHECK:           %[[VAL_2:.*]] = constant %[[VAL_1]] {handshake.bb = 0 : ui32, handshake.name = "constant0", value = 31 : i32} : <>, <i32>
// CHECK:           %[[VAL_3:.*]] = source {handshake.bb = 0 : ui32, handshake.name = "source1"} : <>
// CHECK:           %[[VAL_4:.*]] = constant %[[VAL_3]] {handshake.bb = 0 : ui32, handshake.name = "constant1", value = 11 : i32} : <>, <i32>
// CHECK:           %[[VAL_5:.*]]:3 = instance @__placeholder(%[[VAL_4]], %[[VAL_0]]) {BITWIDTH = 31 : i32, handshake.bb = 0 : ui32, handshake.name = "call2"} : (!handshake.channel<i32>, !handshake.control<>) -> (!handshake.channel<i32>, !handshake.channel<i32>, !handshake.control<>)
// CHECK:           %[[VAL_6:.*]] = muli %[[VAL_5]]#0, %[[VAL_5]]#1 {handshake.bb = 0 : ui32, handshake.name = "muli0"} : <i32>
// CHECK:           %[[VAL_7:.*]] = addi %[[VAL_5]]#1, %[[VAL_5]]#1 {handshake.bb = 0 : ui32, handshake.name = "addi0"} : <i32>
// CHECK:           %[[VAL_8:.*]] = subi %[[VAL_4]], %[[VAL_5]]#1 {handshake.bb = 0 : ui32, handshake.name = "subi0"} : <i32>
// CHECK:           %[[VAL_9:.*]] = addi %[[VAL_8]], %[[VAL_5]]#0 {handshake.bb = 0 : ui32, handshake.name = "addi1"} : <i32>
// CHECK:           %[[VAL_10:.*]] = addi %[[VAL_6]], %[[VAL_7]] {handshake.bb = 0 : ui32, handshake.name = "addi2"} : <i32>
// CHECK:           %[[VAL_11:.*]] = addi %[[VAL_10]], %[[VAL_9]] {handshake.bb = 0 : ui32, handshake.name = "addi3"} : <i32>
// CHECK:           end {handshake.bb = 0 : ui32, handshake.name = "end0"} %[[VAL_11]], %[[VAL_0]] : <i32>, <>
// CHECK:         }
// CHECK:         handshake.func private @__placeholder(!handshake.channel<i32>, !handshake.control<>, ...) -> (!handshake.channel<i32>, !handshake.channel<i32>, !handshake.control<>) attributes {argNames = ["input_a", "start"], resNames = ["out0", "out1", "end"]}
module {
  func.func @hw_inst() -> i32 {
    %c31_i32 = arith.constant {handshake.name = "constant0"} 31 : i32
    %c11_i32 = arith.constant {handshake.name = "constant1"} 11 : i32
    %0 = call @__init1() {handshake.name = "call0"} : () -> i32
    %1 = call @__init1() {handshake.name = "call1"} : () -> i32
    call @__placeholder(%c11_i32, %0, %1, %c31_i32) {handshake.name = "call2"} : (i32, i32, i32, i32) -> ()
    %2 = arith.muli %0, %1 {handshake.name = "muli0"} : i32
    %3 = arith.addi %1, %1 {handshake.name = "addi0"} : i32
    %4 = arith.subi %c11_i32, %1 {handshake.name = "subi0"} : i32
    %5 = arith.addi %4, %0 {handshake.name = "addi1"} : i32
    %6 = arith.addi %2, %3 {handshake.name = "addi2"} : i32
    %7 = arith.addi %6, %5 {handshake.name = "addi3"} : i32
    return {handshake.name = "return0"} %7 : i32
  }
  func.func private @__init1() -> i32
  func.func private @__placeholder(i32 {handshake.arg_name = "input_a"}, i32 {handshake.arg_name = "output_b"}, i32 {handshake.arg_name = "output_c"}, i32 {handshake.arg_name = "parameter_BITWIDTH"})

}

// -----

