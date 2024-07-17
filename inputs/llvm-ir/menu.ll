; ModuleID = 'inputs/src/menu.c'
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

; Function Attrs: inlinehint noinline nounwind uwtable
define dso_local i32 @main() #0 !prof !35 {
entry:
  %retval = alloca i32, align 4
  %choice = alloca i32, align 4
  %num = alloca i32, align 4
  %i = alloca i32, align 4
  %fact = alloca i64, align 8
  store i32 0, i32* %retval, align 4
  br label %while.body

while.body:                                       ; preds = %entry, %sw.epilog
  %call = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i64 0, i64 0))
  %call1 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([10 x i8], [10 x i8]* @.str.1, i64 0, i64 0))
  %call2 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0))
  %call3 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0))
  %call4 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i64 0, i64 0))
  %call5 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0), i32* noundef %choice)
  %0 = load i32, i32* %choice, align 4
  switch i32 %0, label %sw.epilog [
    i32 1, label %sw.bb
    i32 2, label %sw.bb9
    i32 3, label %sw.bb32
    i32 4, label %sw.bb42
  ], !prof !36

sw.bb:                                            ; preds = %while.body
  %call6 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0))
  %call7 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0), i32* noundef %num)
  store i64 1, i64* %fact, align 8
  store i32 1, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %sw.bb
  %1 = load i32, i32* %i, align 4
  %2 = load i32, i32* %num, align 4
  %cmp = icmp sle i32 %1, %2
  br i1 %cmp, label %for.body, label %for.end, !prof !37

for.body:                                         ; preds = %for.cond
  %3 = load i64, i64* %fact, align 8
  %4 = load i32, i32* %i, align 4
  %conv = sext i32 %4 to i64
  %mul = mul i64 %3, %conv
  store i64 %mul, i64* %fact, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, i32* %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond, !llvm.loop !38

for.end:                                          ; preds = %for.cond
  %6 = load i32, i32* %num, align 4
  %7 = load i64, i64* %fact, align 8
  %call8 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.7, i64 0, i64 0), i32 noundef %6, i64 noundef %7)
  br label %sw.epilog

sw.bb9:                                           ; preds = %while.body
  %call10 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0))
  %call11 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0), i32* noundef %num)
  %8 = load i32, i32* %num, align 4
  %cmp12 = icmp eq i32 %8, 1
  br i1 %cmp12, label %if.then, label %if.end, !prof !40

if.then:                                          ; preds = %sw.bb9
  %call14 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([36 x i8], [36 x i8]* @.str.8, i64 0, i64 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %sw.bb9
  store i32 2, i32* %i, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc24, %if.end
  %9 = load i32, i32* %i, align 4
  %10 = load i32, i32* %num, align 4
  %cmp16 = icmp slt i32 %9, %10
  br i1 %cmp16, label %for.body18, label %for.end26, !prof !41

for.body18:                                       ; preds = %for.cond15
  %11 = load i32, i32* %num, align 4
  %12 = load i32, i32* %i, align 4
  %rem = srem i32 %11, %12
  %cmp19 = icmp eq i32 %rem, 0
  br i1 %cmp19, label %if.then21, label %if.end23, !prof !42

if.then21:                                        ; preds = %for.body18
  %13 = load i32, i32* %num, align 4
  %call22 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.9, i64 0, i64 0), i32 noundef %13)
  br label %for.end26

if.end23:                                         ; preds = %for.body18
  br label %for.inc24

for.inc24:                                        ; preds = %if.end23
  %14 = load i32, i32* %i, align 4
  %inc25 = add nsw i32 %14, 1
  store i32 %inc25, i32* %i, align 4
  br label %for.cond15, !llvm.loop !43

for.end26:                                        ; preds = %if.then21, %for.cond15
  %15 = load i32, i32* %i, align 4
  %16 = load i32, i32* %num, align 4
  %cmp27 = icmp eq i32 %15, %16
  br i1 %cmp27, label %if.then29, label %if.end31, !prof !44

if.then29:                                        ; preds = %for.end26
  %17 = load i32, i32* %num, align 4
  %call30 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.10, i64 0, i64 0), i32 noundef %17)
  br label %sw.epilog

if.end31:                                         ; preds = %for.end26
  br label %sw.bb32

sw.bb32:                                          ; preds = %while.body, %if.end31
  %call33 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([15 x i8], [15 x i8]* @.str.6, i64 0, i64 0))
  %call34 = call i32 (i8*, ...) @__isoc99_scanf(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.5, i64 0, i64 0), i32* noundef %num)
  %18 = load i32, i32* %num, align 4
  %rem35 = srem i32 %18, 2
  %cmp36 = icmp eq i32 %rem35, 0
  br i1 %cmp36, label %if.then38, label %if.else, !prof !44

if.then38:                                        ; preds = %sw.bb32
  %19 = load i32, i32* %num, align 4
  %call39 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.11, i64 0, i64 0), i32 noundef %19)
  br label %if.end41

if.else:                                          ; preds = %sw.bb32
  %20 = load i32, i32* %num, align 4
  %call40 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str.12, i64 0, i64 0), i32 noundef %20)
  br label %if.end41

if.end41:                                         ; preds = %if.else, %if.then38
  br label %sw.epilog

sw.bb42:                                          ; preds = %while.body
  %call43 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str.13, i64 0, i64 0))
  call void @exit(i32 noundef 0) #3
  unreachable

sw.epilog:                                        ; preds = %while.body, %if.end41, %if.then29, %for.end
  br label %while.body
}

declare i32 @printf(i8* noundef, ...) #1

declare i32 @__isoc99_scanf(i8* noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

attributes #0 = { inlinehint noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5}
!llvm.ident = !{!34}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{i32 1, !"ProfileSummary", !6}
!6 = !{!7, !8, !9, !10, !11, !12, !13, !14, !15, !16}
!7 = !{!"ProfileFormat", !"InstrProf"}
!8 = !{!"TotalCount", i64 38}
!9 = !{!"MaxCount", i64 13}
!10 = !{!"MaxInternalCount", i64 11}
!11 = !{!"MaxFunctionCount", i64 13}
!12 = !{!"NumCounts", i64 11}
!13 = !{!"NumFunctions", i64 1}
!14 = !{!"IsPartialProfile", i64 0}
!15 = !{!"PartialProfileRatio", double 0.000000e+00}
!16 = !{!"DetailedSummary", !17}
!17 = !{!18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33}
!18 = !{i32 10000, i64 0, i32 0}
!19 = !{i32 100000, i64 13, i32 1}
!20 = !{i32 200000, i64 13, i32 1}
!21 = !{i32 300000, i64 13, i32 1}
!22 = !{i32 400000, i64 11, i32 2}
!23 = !{i32 500000, i64 11, i32 2}
!24 = !{i32 600000, i64 11, i32 2}
!25 = !{i32 700000, i64 6, i32 3}
!26 = !{i32 800000, i64 6, i32 3}
!27 = !{i32 900000, i64 1, i32 10}
!28 = !{i32 950000, i64 1, i32 10}
!29 = !{i32 990000, i64 1, i32 10}
!30 = !{i32 999000, i64 1, i32 10}
!31 = !{i32 999900, i64 1, i32 10}
!32 = !{i32 999990, i64 1, i32 10}
!33 = !{i32 999999, i64 1, i32 10}
!34 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!35 = !{!"function_entry_count", i64 1}
!36 = !{!"branch_weights", i32 1, i32 2, i32 2, i32 1, i32 1}
!37 = !{!"branch_weights", i32 13, i32 2}
!38 = distinct !{!38, !39}
!39 = !{!"llvm.loop.mustprogress"}
!40 = !{!"branch_weights", i32 0, i32 2}
!41 = !{!"branch_weights", i32 12, i32 1}
!42 = !{!"branch_weights", i32 1, i32 11}
!43 = distinct !{!43, !39}
!44 = !{!"branch_weights", i32 1, i32 1}
