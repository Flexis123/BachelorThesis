; ModuleID = 'inputs/src/random_prog.c'
source_filename = "inputs/src/random_prog.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [34 x i8] c"\0AChoose an operation to perform:\0A\00", align 1
@.str.1 = private unnamed_addr constant [26 x i8] c"1. Arithmetic Operations\0A\00", align 1
@.str.2 = private unnamed_addr constant [21 x i8] c"2. Array Operations\0A\00", align 1
@.str.3 = private unnamed_addr constant [22 x i8] c"3. String Operations\0A\00", align 1
@.str.4 = private unnamed_addr constant [9 x i8] c"4. Exit\0A\00", align 1
@.str.5 = private unnamed_addr constant [20 x i8] c"Enter your choice: \00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.7 = private unnamed_addr constant [31 x i8] c"Exiting the program. Goodbye!\0A\00", align 1
@.str.8 = private unnamed_addr constant [35 x i8] c"Invalid choice! Please try again.\0A\00", align 1
@.str.9 = private unnamed_addr constant [51 x i8] c"Welcome to the C program with multiple functions!\0A\00", align 1
@.str.10 = private unnamed_addr constant [21 x i8] c"Enter two integers: \00", align 1
@.str.11 = private unnamed_addr constant [6 x i8] c"%d %d\00", align 1
@.str.12 = private unnamed_addr constant [30 x i8] c"Addition of %d and %d is: %d\0A\00", align 1
@.str.13 = private unnamed_addr constant [34 x i8] c"Subtraction of %d from %d is: %d\0A\00", align 1
@.str.14 = private unnamed_addr constant [36 x i8] c"Multiplication of %d and %d is: %d\0A\00", align 1
@.str.15 = private unnamed_addr constant [31 x i8] c"Division of %d by %d is: %.2f\0A\00", align 1
@.str.16 = private unnamed_addr constant [36 x i8] c"Addition of %d and %d again is: %d\0A\00", align 1
@.str.17 = private unnamed_addr constant [40 x i8] c"Subtraction of %d from %d again is: %d\0A\00", align 1
@.str.18 = private unnamed_addr constant [26 x i8] c"Error! Division by zero.\0A\00", align 1
@.str.19 = private unnamed_addr constant [30 x i8] c"Enter the size of the array: \00", align 1
@.str.20 = private unnamed_addr constant [33 x i8] c"Enter %d elements of the array: \00", align 1
@.str.21 = private unnamed_addr constant [17 x i8] c"Array elements: \00", align 1
@.str.22 = private unnamed_addr constant [37 x i8] c"Maximum element in the array is: %d\0A\00", align 1
@.str.23 = private unnamed_addr constant [37 x i8] c"Minimum element in the array is: %d\0A\00", align 1
@.str.24 = private unnamed_addr constant [45 x i8] c"Addition of max and min in the array is: %d\0A\00", align 1
@.str.25 = private unnamed_addr constant [49 x i8] c"Subtraction of min from max in the array is: %d\0A\00", align 1
@.str.26 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.27 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.28 = private unnamed_addr constant [17 x i8] c"Enter a string: \00", align 1
@.str.29 = private unnamed_addr constant [8 x i8] c" %[^\0A]s\00", align 1
@.str.30 = private unnamed_addr constant [30 x i8] c"Length of string \22%s\22 is: %d\0A\00", align 1
@.str.31 = private unnamed_addr constant [24 x i8] c"Reversed string is: %s\0A\00", align 1
@.str.32 = private unnamed_addr constant [25 x i8] c"Uppercase string is: %s\0A\00", align 1
@.str.33 = private unnamed_addr constant [25 x i8] c"Lowercase string is: %s\0A\00", align 1
@.str.34 = private unnamed_addr constant [36 x i8] c"Length of string \22%s\22 again is: %d\0A\00", align 1
@.str.35 = private unnamed_addr constant [30 x i8] c"Reversed string again is: %s\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !prof !35 {
entry:
  %retval = alloca i32, align 4
  %choice = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  call void @greetUser()
  br label %do.body

do.body:                                          ; preds = %do.cond, %entry
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %call2 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  %call4 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %call5 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %call6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.6, ptr noundef %choice)
  %0 = load i32, ptr %choice, align 4
  switch i32 %0, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb7
    i32 3, label %sw.bb8
    i32 4, label %sw.bb9
  ], !prof !36

sw.bb:                                            ; preds = %do.body
  call void @arithmeticOperations()
  br label %sw.epilog

sw.bb7:                                           ; preds = %do.body
  call void @arrayOperations()
  br label %sw.epilog

sw.bb8:                                           ; preds = %do.body
  call void @stringOperations()
  br label %sw.epilog

sw.bb9:                                           ; preds = %do.body
  %call10 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %sw.epilog

sw.default:                                       ; preds = %do.body
  %call11 = call i32 (ptr, ...) @printf(ptr noundef @.str.8)
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb9, %sw.bb8, %sw.bb7, %sw.bb
  br label %do.cond

do.cond:                                          ; preds = %sw.epilog
  %1 = load i32, ptr %choice, align 4
  %cmp = icmp ne i32 %1, 4
  br i1 %cmp, label %do.body, label %do.end, !prof !37, !llvm.loop !38

do.end:                                           ; preds = %do.cond
  ret i32 0
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: cold noinline nounwind uwtable
define dso_local void @greetUser() #2 !prof !35 {
entry:
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.9)
  ret void
}

; Function Attrs: cold noinline nounwind uwtable
define dso_local void @arithmeticOperations() #2 !prof !40 {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %sum = alloca i32, align 4
  %diff = alloca i32, align 4
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.10)
  %call1 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.11, ptr noundef %a, ptr noundef %b)
  %0 = load i32, ptr %a, align 4
  %1 = load i32, ptr %b, align 4
  %2 = load i32, ptr %a, align 4
  %3 = load i32, ptr %b, align 4
  %call2 = call i32 @add(i32 noundef %2, i32 noundef %3)
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.12, i32 noundef %0, i32 noundef %1, i32 noundef %call2)
  %4 = load i32, ptr %b, align 4
  %5 = load i32, ptr %a, align 4
  %6 = load i32, ptr %a, align 4
  %7 = load i32, ptr %b, align 4
  %call4 = call i32 @subtract(i32 noundef %6, i32 noundef %7)
  %call5 = call i32 (ptr, ...) @printf(ptr noundef @.str.13, i32 noundef %4, i32 noundef %5, i32 noundef %call4)
  %8 = load i32, ptr %a, align 4
  %9 = load i32, ptr %b, align 4
  %10 = load i32, ptr %a, align 4
  %11 = load i32, ptr %b, align 4
  %call6 = call i32 @multiply(i32 noundef %10, i32 noundef %11)
  %call7 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, i32 noundef %8, i32 noundef %9, i32 noundef %call6)
  %12 = load i32, ptr %a, align 4
  %13 = load i32, ptr %b, align 4
  %14 = load i32, ptr %a, align 4
  %15 = load i32, ptr %b, align 4
  %call8 = call float @divide(i32 noundef %14, i32 noundef %15)
  %conv = fpext float %call8 to double
  %call9 = call i32 (ptr, ...) @printf(ptr noundef @.str.15, i32 noundef %12, i32 noundef %13, double noundef %conv)
  %16 = load i32, ptr %a, align 4
  %17 = load i32, ptr %b, align 4
  %call10 = call i32 @add(i32 noundef %16, i32 noundef %17)
  store i32 %call10, ptr %sum, align 4
  %18 = load i32, ptr %a, align 4
  %19 = load i32, ptr %b, align 4
  %call11 = call i32 @subtract(i32 noundef %18, i32 noundef %19)
  store i32 %call11, ptr %diff, align 4
  %20 = load i32, ptr %a, align 4
  %21 = load i32, ptr %b, align 4
  %22 = load i32, ptr %sum, align 4
  %23 = load i32, ptr %diff, align 4
  %call12 = call i32 @add(i32 noundef %22, i32 noundef %23)
  %call13 = call i32 (ptr, ...) @printf(ptr noundef @.str.16, i32 noundef %20, i32 noundef %21, i32 noundef %call12)
  %24 = load i32, ptr %diff, align 4
  %25 = load i32, ptr %sum, align 4
  %26 = load i32, ptr %sum, align 4
  %27 = load i32, ptr %diff, align 4
  %call14 = call i32 @subtract(i32 noundef %26, i32 noundef %27)
  %call15 = call i32 (ptr, ...) @printf(ptr noundef @.str.17, i32 noundef %24, i32 noundef %25, i32 noundef %call14)
  ret void
}

; Function Attrs: cold noinline nounwind uwtable
define dso_local i32 @add(i32 noundef %a, i32 noundef %b) #2 !prof !40 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, ptr %a.addr, align 4
  store i32 %b, ptr %b.addr, align 4
  %0 = load i32, ptr %a.addr, align 4
  %1 = load i32, ptr %b.addr, align 4
  %add = add nsw i32 %0, %1
  ret i32 %add
}

; Function Attrs: cold noinline nounwind uwtable
define dso_local i32 @subtract(i32 noundef %a, i32 noundef %b) #2 !prof !40 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, ptr %a.addr, align 4
  store i32 %b, ptr %b.addr, align 4
  %0 = load i32, ptr %a.addr, align 4
  %1 = load i32, ptr %b.addr, align 4
  %sub = sub nsw i32 %0, %1
  ret i32 %sub
}

; Function Attrs: cold noinline nounwind uwtable
define dso_local i32 @multiply(i32 noundef %a, i32 noundef %b) #2 !prof !40 {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, ptr %a.addr, align 4
  store i32 %b, ptr %b.addr, align 4
  %0 = load i32, ptr %a.addr, align 4
  %1 = load i32, ptr %b.addr, align 4
  %mul = mul nsw i32 %0, %1
  ret i32 %mul
}

; Function Attrs: cold noinline nounwind uwtable
define dso_local float @divide(i32 noundef %a, i32 noundef %b) #2 !prof !40 {
entry:
  %retval = alloca float, align 4
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  store i32 %a, ptr %a.addr, align 4
  store i32 %b, ptr %b.addr, align 4
  %0 = load i32, ptr %b.addr, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %1 = load i32, ptr %a.addr, align 4
  %conv = sitofp i32 %1 to float
  %2 = load i32, ptr %b.addr, align 4
  %conv1 = sitofp i32 %2 to float
  %div = fdiv float %conv, %conv1
  store float %div, ptr %retval, align 4
  br label %return

if.else:                                          ; preds = %entry
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.18)
  store float 0.000000e+00, ptr %retval, align 4
  br label %return

return:                                           ; preds = %if.else, %if.then
  %3 = load float, ptr %retval, align 4
  ret float %3
}

; Function Attrs: cold noinline nounwind uwtable
define dso_local void @arrayOperations() #2 !prof !40 {
entry:
  %size = alloca i32, align 4
  %saved_stack = alloca ptr, align 8
  %__vla_expr0 = alloca i64, align 8
  %i = alloca i32, align 4
  %max = alloca i32, align 4
  %min = alloca i32, align 4
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.19)
  %call1 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.6, ptr noundef %size)
  %0 = load i32, ptr %size, align 4
  %1 = zext i32 %0 to i64
  %2 = call ptr @llvm.stacksave()
  store ptr %2, ptr %saved_stack, align 8
  %vla = alloca i32, i64 %1, align 16
  store i64 %1, ptr %__vla_expr0, align 8
  %3 = load i32, ptr %size, align 4
  %call2 = call i32 (ptr, ...) @printf(ptr noundef @.str.20, i32 noundef %3)
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %4 = load i32, ptr %i, align 4
  %5 = load i32, ptr %size, align 4
  %cmp = icmp slt i32 %4, %5
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %6 = load i32, ptr %i, align 4
  %idxprom = sext i32 %6 to i64
  %arrayidx = getelementptr inbounds i32, ptr %vla, i64 %idxprom
  %call3 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.6, ptr noundef %arrayidx)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %7 = load i32, ptr %i, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !41

for.end:                                          ; preds = %for.cond
  %call4 = call i32 (ptr, ...) @printf(ptr noundef @.str.21)
  %8 = load i32, ptr %size, align 4
  call void @printArray(ptr noundef %vla, i32 noundef %8)
  %9 = load i32, ptr %size, align 4
  %call5 = call i32 @findMax(ptr noundef %vla, i32 noundef %9)
  %call6 = call i32 (ptr, ...) @printf(ptr noundef @.str.22, i32 noundef %call5)
  %10 = load i32, ptr %size, align 4
  %call7 = call i32 @findMin(ptr noundef %vla, i32 noundef %10)
  %call8 = call i32 (ptr, ...) @printf(ptr noundef @.str.23, i32 noundef %call7)
  %11 = load i32, ptr %size, align 4
  %call9 = call i32 @findMax(ptr noundef %vla, i32 noundef %11)
  store i32 %call9, ptr %max, align 4
  %12 = load i32, ptr %size, align 4
  %call10 = call i32 @findMin(ptr noundef %vla, i32 noundef %12)
  store i32 %call10, ptr %min, align 4
  %13 = load i32, ptr %max, align 4
  %14 = load i32, ptr %min, align 4
  %call11 = call i32 @add(i32 noundef %13, i32 noundef %14)
  %call12 = call i32 (ptr, ...) @printf(ptr noundef @.str.24, i32 noundef %call11)
  %15 = load i32, ptr %max, align 4
  %16 = load i32, ptr %min, align 4
  %call13 = call i32 @subtract(i32 noundef %15, i32 noundef %16)
  %call14 = call i32 (ptr, ...) @printf(ptr noundef @.str.25, i32 noundef %call13)
  %17 = load ptr, ptr %saved_stack, align 8
  call void @llvm.stackrestore(ptr %17)
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave() #3

; Function Attrs: cold noinline nounwind uwtable
define dso_local void @printArray(ptr noundef %arr, i32 noundef %size) #2 !prof !40 {
entry:
  %arr.addr = alloca ptr, align 8
  %size.addr = alloca i32, align 4
  %i = alloca i32, align 4
  store ptr %arr, ptr %arr.addr, align 8
  store i32 %size, ptr %size.addr, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %1 = load i32, ptr %size.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load ptr, ptr %arr.addr, align 8
  %3 = load i32, ptr %i, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i32, ptr %2, i64 %idxprom
  %4 = load i32, ptr %arrayidx, align 4
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.26, i32 noundef %4)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, ptr %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !42

for.end:                                          ; preds = %for.cond
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.27)
  ret void
}

; Function Attrs: cold noinline nounwind uwtable
define dso_local i32 @findMax(ptr noundef %arr, i32 noundef %size) #2 !prof !40 {
entry:
  %arr.addr = alloca ptr, align 8
  %size.addr = alloca i32, align 4
  %max = alloca i32, align 4
  %i = alloca i32, align 4
  store ptr %arr, ptr %arr.addr, align 8
  store i32 %size, ptr %size.addr, align 4
  %0 = load ptr, ptr %arr.addr, align 8
  %arrayidx = getelementptr inbounds i32, ptr %0, i64 0
  %1 = load i32, ptr %arrayidx, align 4
  store i32 %1, ptr %max, align 4
  store i32 1, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, ptr %i, align 4
  %3 = load i32, ptr %size.addr, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load ptr, ptr %arr.addr, align 8
  %5 = load i32, ptr %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx1 = getelementptr inbounds i32, ptr %4, i64 %idxprom
  %6 = load i32, ptr %arrayidx1, align 4
  %7 = load i32, ptr %max, align 4
  %cmp2 = icmp sgt i32 %6, %7
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %8 = load ptr, ptr %arr.addr, align 8
  %9 = load i32, ptr %i, align 4
  %idxprom3 = sext i32 %9 to i64
  %arrayidx4 = getelementptr inbounds i32, ptr %8, i64 %idxprom3
  %10 = load i32, ptr %arrayidx4, align 4
  store i32 %10, ptr %max, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %11 = load i32, ptr %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !43

for.end:                                          ; preds = %for.cond
  %12 = load i32, ptr %max, align 4
  ret i32 %12
}

; Function Attrs: cold noinline nounwind uwtable
define dso_local i32 @findMin(ptr noundef %arr, i32 noundef %size) #2 !prof !40 {
entry:
  %arr.addr = alloca ptr, align 8
  %size.addr = alloca i32, align 4
  %min = alloca i32, align 4
  %i = alloca i32, align 4
  store ptr %arr, ptr %arr.addr, align 8
  store i32 %size, ptr %size.addr, align 4
  %0 = load ptr, ptr %arr.addr, align 8
  %arrayidx = getelementptr inbounds i32, ptr %0, i64 0
  %1 = load i32, ptr %arrayidx, align 4
  store i32 %1, ptr %min, align 4
  store i32 1, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, ptr %i, align 4
  %3 = load i32, ptr %size.addr, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load ptr, ptr %arr.addr, align 8
  %5 = load i32, ptr %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx1 = getelementptr inbounds i32, ptr %4, i64 %idxprom
  %6 = load i32, ptr %arrayidx1, align 4
  %7 = load i32, ptr %min, align 4
  %cmp2 = icmp slt i32 %6, %7
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %8 = load ptr, ptr %arr.addr, align 8
  %9 = load i32, ptr %i, align 4
  %idxprom3 = sext i32 %9 to i64
  %arrayidx4 = getelementptr inbounds i32, ptr %8, i64 %idxprom3
  %10 = load i32, ptr %arrayidx4, align 4
  store i32 %10, ptr %min, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %11 = load i32, ptr %i, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !44

for.end:                                          ; preds = %for.cond
  %12 = load i32, ptr %min, align 4
  ret i32 %12
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore(ptr) #3

; Function Attrs: inlinehint noinline nounwind uwtable
define dso_local void @stringOperations() #4 !prof !45 {
entry:
  %str = alloca [100 x i8], align 16
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.28)
  %arraydecay = getelementptr inbounds [100 x i8], ptr %str, i64 0, i64 0
  %call1 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.29, ptr noundef %arraydecay)
  %arraydecay2 = getelementptr inbounds [100 x i8], ptr %str, i64 0, i64 0
  %arraydecay3 = getelementptr inbounds [100 x i8], ptr %str, i64 0, i64 0
  %call4 = call i32 @stringLength(ptr noundef %arraydecay3)
  %call5 = call i32 (ptr, ...) @printf(ptr noundef @.str.30, ptr noundef %arraydecay2, i32 noundef %call4)
  %arraydecay6 = getelementptr inbounds [100 x i8], ptr %str, i64 0, i64 0
  call void @reverseString(ptr noundef %arraydecay6)
  %arraydecay7 = getelementptr inbounds [100 x i8], ptr %str, i64 0, i64 0
  %call8 = call i32 (ptr, ...) @printf(ptr noundef @.str.31, ptr noundef %arraydecay7)
  %arraydecay9 = getelementptr inbounds [100 x i8], ptr %str, i64 0, i64 0
  call void @toUpperCase(ptr noundef %arraydecay9)
  %arraydecay10 = getelementptr inbounds [100 x i8], ptr %str, i64 0, i64 0
  %call11 = call i32 (ptr, ...) @printf(ptr noundef @.str.32, ptr noundef %arraydecay10)
  %arraydecay12 = getelementptr inbounds [100 x i8], ptr %str, i64 0, i64 0
  call void @toLowerCase(ptr noundef %arraydecay12)
  %arraydecay13 = getelementptr inbounds [100 x i8], ptr %str, i64 0, i64 0
  %call14 = call i32 (ptr, ...) @printf(ptr noundef @.str.33, ptr noundef %arraydecay13)
  %arraydecay15 = getelementptr inbounds [100 x i8], ptr %str, i64 0, i64 0
  %arraydecay16 = getelementptr inbounds [100 x i8], ptr %str, i64 0, i64 0
  %call17 = call i32 @stringLength(ptr noundef %arraydecay16)
  %call18 = call i32 (ptr, ...) @printf(ptr noundef @.str.34, ptr noundef %arraydecay15, i32 noundef %call17)
  %arraydecay19 = getelementptr inbounds [100 x i8], ptr %str, i64 0, i64 0
  call void @reverseString(ptr noundef %arraydecay19)
  %arraydecay20 = getelementptr inbounds [100 x i8], ptr %str, i64 0, i64 0
  %call21 = call i32 (ptr, ...) @printf(ptr noundef @.str.35, ptr noundef %arraydecay20)
  ret void
}

; Function Attrs: inlinehint noinline nounwind uwtable
define dso_local i32 @stringLength(ptr noundef %str) #4 !prof !46 {
entry:
  %str.addr = alloca ptr, align 8
  store ptr %str, ptr %str.addr, align 8
  %0 = load ptr, ptr %str.addr, align 8
  %call = call i64 @strlen(ptr noundef %0) #6
  %conv = trunc i64 %call to i32
  ret i32 %conv
}

; Function Attrs: inlinehint noinline nounwind uwtable
define dso_local void @reverseString(ptr noundef %str) #4 !prof !46 {
entry:
  %str.addr = alloca ptr, align 8
  %n = alloca i32, align 4
  %i = alloca i32, align 4
  %temp = alloca i8, align 1
  store ptr %str, ptr %str.addr, align 8
  %0 = load ptr, ptr %str.addr, align 8
  %call = call i64 @strlen(ptr noundef %0) #6
  %conv = trunc i64 %call to i32
  store i32 %conv, ptr %n, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32, ptr %i, align 4
  %2 = load i32, ptr %n, align 4
  %div = sdiv i32 %2, 2
  %cmp = icmp slt i32 %1, %div
  br i1 %cmp, label %for.body, label %for.end, !prof !47

for.body:                                         ; preds = %for.cond
  %3 = load ptr, ptr %str.addr, align 8
  %4 = load i32, ptr %i, align 4
  %idxprom = sext i32 %4 to i64
  %arrayidx = getelementptr inbounds i8, ptr %3, i64 %idxprom
  %5 = load i8, ptr %arrayidx, align 1
  store i8 %5, ptr %temp, align 1
  %6 = load ptr, ptr %str.addr, align 8
  %7 = load i32, ptr %n, align 4
  %8 = load i32, ptr %i, align 4
  %sub = sub nsw i32 %7, %8
  %sub2 = sub nsw i32 %sub, 1
  %idxprom3 = sext i32 %sub2 to i64
  %arrayidx4 = getelementptr inbounds i8, ptr %6, i64 %idxprom3
  %9 = load i8, ptr %arrayidx4, align 1
  %10 = load ptr, ptr %str.addr, align 8
  %11 = load i32, ptr %i, align 4
  %idxprom5 = sext i32 %11 to i64
  %arrayidx6 = getelementptr inbounds i8, ptr %10, i64 %idxprom5
  store i8 %9, ptr %arrayidx6, align 1
  %12 = load i8, ptr %temp, align 1
  %13 = load ptr, ptr %str.addr, align 8
  %14 = load i32, ptr %n, align 4
  %15 = load i32, ptr %i, align 4
  %sub7 = sub nsw i32 %14, %15
  %sub8 = sub nsw i32 %sub7, 1
  %idxprom9 = sext i32 %sub8 to i64
  %arrayidx10 = getelementptr inbounds i8, ptr %13, i64 %idxprom9
  store i8 %12, ptr %arrayidx10, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %16 = load i32, ptr %i, align 4
  %inc = add nsw i32 %16, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !48

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: inlinehint noinline nounwind uwtable
define dso_local void @toUpperCase(ptr noundef %str) #4 !prof !45 {
entry:
  %str.addr = alloca ptr, align 8
  %i = alloca i32, align 4
  store ptr %str, ptr %str.addr, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load ptr, ptr %str.addr, align 8
  %1 = load i32, ptr %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds i8, ptr %0, i64 %idxprom
  %2 = load i8, ptr %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %for.body, label %for.end, !prof !49

for.body:                                         ; preds = %for.cond
  %3 = load ptr, ptr %str.addr, align 8
  %4 = load i32, ptr %i, align 4
  %idxprom2 = sext i32 %4 to i64
  %arrayidx3 = getelementptr inbounds i8, ptr %3, i64 %idxprom2
  %5 = load i8, ptr %arrayidx3, align 1
  %conv4 = sext i8 %5 to i32
  %cmp5 = icmp sge i32 %conv4, 97
  br i1 %cmp5, label %land.lhs.true, label %if.end, !prof !50

land.lhs.true:                                    ; preds = %for.body
  %6 = load ptr, ptr %str.addr, align 8
  %7 = load i32, ptr %i, align 4
  %idxprom7 = sext i32 %7 to i64
  %arrayidx8 = getelementptr inbounds i8, ptr %6, i64 %idxprom7
  %8 = load i8, ptr %arrayidx8, align 1
  %conv9 = sext i8 %8 to i32
  %cmp10 = icmp sle i32 %conv9, 122
  br i1 %cmp10, label %if.then, label %if.end, !prof !50

if.then:                                          ; preds = %land.lhs.true
  %9 = load ptr, ptr %str.addr, align 8
  %10 = load i32, ptr %i, align 4
  %idxprom12 = sext i32 %10 to i64
  %arrayidx13 = getelementptr inbounds i8, ptr %9, i64 %idxprom12
  %11 = load i8, ptr %arrayidx13, align 1
  %conv14 = sext i8 %11 to i32
  %sub = sub nsw i32 %conv14, 32
  %conv15 = trunc i32 %sub to i8
  %12 = load ptr, ptr %str.addr, align 8
  %13 = load i32, ptr %i, align 4
  %idxprom16 = sext i32 %13 to i64
  %arrayidx17 = getelementptr inbounds i8, ptr %12, i64 %idxprom16
  store i8 %conv15, ptr %arrayidx17, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %14 = load i32, ptr %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !51

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: inlinehint noinline nounwind uwtable
define dso_local void @toLowerCase(ptr noundef %str) #4 !prof !45 {
entry:
  %str.addr = alloca ptr, align 8
  %i = alloca i32, align 4
  store ptr %str, ptr %str.addr, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load ptr, ptr %str.addr, align 8
  %1 = load i32, ptr %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds i8, ptr %0, i64 %idxprom
  %2 = load i8, ptr %arrayidx, align 1
  %conv = sext i8 %2 to i32
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %for.body, label %for.end, !prof !49

for.body:                                         ; preds = %for.cond
  %3 = load ptr, ptr %str.addr, align 8
  %4 = load i32, ptr %i, align 4
  %idxprom2 = sext i32 %4 to i64
  %arrayidx3 = getelementptr inbounds i8, ptr %3, i64 %idxprom2
  %5 = load i8, ptr %arrayidx3, align 1
  %conv4 = sext i8 %5 to i32
  %cmp5 = icmp sge i32 %conv4, 65
  br i1 %cmp5, label %land.lhs.true, label %if.end, !prof !50

land.lhs.true:                                    ; preds = %for.body
  %6 = load ptr, ptr %str.addr, align 8
  %7 = load i32, ptr %i, align 4
  %idxprom7 = sext i32 %7 to i64
  %arrayidx8 = getelementptr inbounds i8, ptr %6, i64 %idxprom7
  %8 = load i8, ptr %arrayidx8, align 1
  %conv9 = sext i8 %8 to i32
  %cmp10 = icmp sle i32 %conv9, 90
  br i1 %cmp10, label %if.then, label %if.end, !prof !50

if.then:                                          ; preds = %land.lhs.true
  %9 = load ptr, ptr %str.addr, align 8
  %10 = load i32, ptr %i, align 4
  %idxprom12 = sext i32 %10 to i64
  %arrayidx13 = getelementptr inbounds i8, ptr %9, i64 %idxprom12
  %11 = load i8, ptr %arrayidx13, align 1
  %conv14 = sext i8 %11 to i32
  %add = add nsw i32 %conv14, 32
  %conv15 = trunc i32 %add to i8
  %12 = load ptr, ptr %str.addr, align 8
  %13 = load i32, ptr %i, align 4
  %idxprom16 = sext i32 %13 to i64
  %arrayidx17 = getelementptr inbounds i8, ptr %12, i64 %idxprom16
  store i8 %conv15, ptr %arrayidx17, align 1
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %14 = load i32, ptr %i, align 4
  %inc = add nsw i32 %14, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !52

for.end:                                          ; preds = %for.cond
  ret void
}

; Function Attrs: nounwind willreturn memory(read)
declare i64 @strlen(ptr noundef) #5

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { cold noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind willreturn }
attributes #4 = { inlinehint noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!34}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{i32 1, !"ProfileSummary", !6}
!6 = !{!7, !8, !9, !10, !11, !12, !13, !14, !15, !16}
!7 = !{!"ProfileFormat", !"InstrProf"}
!8 = !{!"TotalCount", i64 545}
!9 = !{!"MaxCount", i64 74}
!10 = !{!"MaxInternalCount", i64 74}
!11 = !{!"MaxFunctionCount", i64 74}
!12 = !{!"NumCounts", i64 35}
!13 = !{!"NumFunctions", i64 16}
!14 = !{!"IsPartialProfile", i64 0}
!15 = !{!"PartialProfileRatio", double 0.000000e+00}
!16 = !{!"DetailedSummary", !17}
!17 = !{!18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33}
!18 = !{i32 10000, i64 74, i32 7}
!19 = !{i32 100000, i64 74, i32 7}
!20 = !{i32 200000, i64 74, i32 7}
!21 = !{i32 300000, i64 74, i32 7}
!22 = !{i32 400000, i64 74, i32 7}
!23 = !{i32 500000, i64 74, i32 7}
!24 = !{i32 600000, i64 74, i32 7}
!25 = !{i32 700000, i64 74, i32 7}
!26 = !{i32 800000, i64 74, i32 7}
!27 = !{i32 900000, i64 74, i32 7}
!28 = !{i32 950000, i64 74, i32 7}
!29 = !{i32 990000, i64 3, i32 13}
!30 = !{i32 999000, i64 1, i32 16}
!31 = !{i32 999900, i64 1, i32 16}
!32 = !{i32 999990, i64 1, i32 16}
!33 = !{i32 999999, i64 1, i32 16}
!34 = !{!"Ubuntu clang version 17.0.6 (++20231209124227+6009708b4367-1~exp1~20231209124336.77)"}
!35 = !{!"function_entry_count", i64 1}
!36 = !{!"branch_weights", i32 0, i32 0, i32 0, i32 3, i32 1}
!37 = !{!"branch_weights", i32 3, i32 1}
!38 = distinct !{!38, !39}
!39 = !{!"llvm.loop.mustprogress"}
!40 = !{!"function_entry_count", i64 0}
!41 = distinct !{!41, !39}
!42 = distinct !{!42, !39}
!43 = distinct !{!43, !39}
!44 = distinct !{!44, !39}
!45 = !{!"function_entry_count", i64 3}
!46 = !{!"function_entry_count", i64 6}
!47 = !{!"branch_weights", i32 74, i32 6}
!48 = distinct !{!48, !39}
!49 = !{!"branch_weights", i32 74, i32 3}
!50 = !{!"branch_weights", i32 74, i32 0}
!51 = distinct !{!51, !39}
!52 = distinct !{!52, !39}
