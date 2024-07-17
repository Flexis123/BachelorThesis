; ModuleID = 'inputs/llvm-ir-opt/menu.ll'
source_filename = "inputs/src/menu.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [15 x i8] c"1. Factorial \0A\00", align 1
@.str.1 = private unnamed_addr constant [10 x i8] c"2. Prime\0A\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"3. Odd\\Even\0A\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"4. Exit\0A\0A\0A\00", align 1
@.str.4 = private unnamed_addr constant [22 x i8] c"Enter your choice :  \00", align 1
@.str.5 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.6 = private unnamed_addr constant [15 x i8] c"Enter number:\0A\00", align 1
@.str.7 = private unnamed_addr constant [36 x i8] c"\0A\0AFactorial value of %d is = %lu\0A\0A\0A\00", align 1
@.str.8 = private unnamed_addr constant [36 x i8] c"\0A1 is neither prime nor composite\0A\0A\00", align 1
@.str.9 = private unnamed_addr constant [28 x i8] c"\0A%d is not a prime number\0A\0A\00", align 1
@.str.10 = private unnamed_addr constant [25 x i8] c"\0A\0A%d is a Prime number\0A\0A\00", align 1
@.str.11 = private unnamed_addr constant [25 x i8] c"\0A\0A%d is an Even number\0A\0A\00", align 1
@.str.12 = private unnamed_addr constant [24 x i8] c"\0A\0A%d is an Odd number\0A\0A\00", align 1
@.str.13 = private unnamed_addr constant [24 x i8] c"\0A\0A\09\09\09Coding is Fun !\0A\0A\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %choice = alloca i32, align 4
  %num = alloca i32, align 4
  br label %while.body

while.body:                                       ; preds = %sw.epilog, %entry
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %call2 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %call4 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %call5 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %choice)
  %0 = load i32, ptr %choice, align 4
  switch i32 %0, label %sw.epilog [
    i32 1, label %sw.bb
    i32 2, label %sw.bb9
    i32 3, label %sw.bb32
    i32 4, label %sw.bb42
  ]

sw.bb:                                            ; preds = %while.body
  %call6 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %call7 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %num)
  %x = add i32 5, 0
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %sw.bb
  %i.0 = phi i32 [ %x, %sw.bb ], [ %inc, %for.inc ]
  %fact.0 = phi i64 [ 1, %sw.bb ], [ %mul, %for.inc ]
  %1 = load i32, ptr %num, align 4
  %cmp = icmp sle i32 %i.0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %conv = sext i32 %i.0 to i64
  %mul = mul i64 %fact.0, %conv
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %2 = load i32, ptr %num, align 4
  %call8 = call i32 (ptr, ...) @printf(ptr noundef @.str.7, i32 noundef %2, i64 noundef %fact.0)
  br label %sw.epilog

sw.bb9:                                           ; preds = %while.body
  %call10 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %call11 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %num)
  %3 = load i32, ptr %num, align 4
  %cmp12 = icmp eq i32 %3, 1
  br i1 %cmp12, label %if.then, label %if.end

if.then:                                          ; preds = %sw.bb9
  %call14 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %if.end

if.end:                                           ; preds = %if.then, %sw.bb9
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc24, %if.end
  %i.1 = phi i32 [ 2, %if.end ], [ %inc25, %for.inc24 ]
  %4 = load i32, ptr %num, align 4
  %cmp16 = icmp slt i32 %i.1, %4
  br i1 %cmp16, label %for.body18, label %for.end26

for.body18:                                       ; preds = %for.cond15
  %5 = load i32, ptr %num, align 4
  %rem = srem i32 %5, %i.1
  %cmp19 = icmp eq i32 %rem, 0
  br i1 %cmp19, label %if.then21, label %if.end23

if.then21:                                        ; preds = %for.body18
  %6 = load i32, ptr %num, align 4
  %call22 = call i32 (ptr, ...) @printf(ptr noundef @.str.9, i32 noundef %6)
  br label %for.end26

if.end23:                                         ; preds = %for.body18
  br label %for.inc24

for.inc24:                                        ; preds = %if.end23
  %inc25 = add nsw i32 %i.1, 1
  br label %for.cond15, !llvm.loop !8

for.end26:                                        ; preds = %if.then21, %for.cond15
  %7 = load i32, ptr %num, align 4
  %cmp27 = icmp eq i32 %i.1, %7
  br i1 %cmp27, label %if.then29, label %if.end31

if.then29:                                        ; preds = %for.end26
  %8 = load i32, ptr %num, align 4
  %call30 = call i32 (ptr, ...) @printf(ptr noundef @.str.10, i32 noundef %8)
  br label %sw.epilog

if.end31:                                         ; preds = %for.end26
  br label %sw.bb32

sw.bb32:                                          ; preds = %if.end31, %while.body
  %call33 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  %call34 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.5, ptr noundef %num)
  %9 = load i32, ptr %num, align 4
  %rem35 = srem i32 %9, 2
  %cmp36 = icmp eq i32 %rem35, 0
  br i1 %cmp36, label %if.then38, label %if.else

if.then38:                                        ; preds = %sw.bb32
  %10 = load i32, ptr %num, align 4
  %call39 = call i32 (ptr, ...) @printf(ptr noundef @.str.11, i32 noundef %10)
  br label %if.end41

if.else:                                          ; preds = %sw.bb32
  %11 = load i32, ptr %num, align 4
  %call40 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %11)
  br label %if.end41

if.end41:                                         ; preds = %if.else, %if.then38
  br label %sw.epilog

sw.bb42:                                          ; preds = %while.body
  %call43 = call i32 (ptr, ...) @printf(ptr noundef @.str.13)
  call void @exit(i32 noundef 0) #3
  unreachable

sw.epilog:                                        ; preds = %if.end41, %if.then29, %for.end, %while.body
  br label %while.body
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 17.0.6 (++20231209124227+6009708b4367-1~exp1~20231209124336.77)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
