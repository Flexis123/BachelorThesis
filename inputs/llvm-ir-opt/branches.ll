; ModuleID = 'inputs/llvm-ir/branches.ll'
source_filename = "inputs/src/branches.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"lol\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"i is 10\00", align 1
@.str.2 = private unnamed_addr constant [9 x i8] c"thtrhhrt\00", align 1
@.str.3 = private unnamed_addr constant [14 x i8] c"i is not even\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"lololol\00", align 1

; Function Attrs: cold noinline nounwind uwtable
define dso_local void @wazza(i32 noundef %i) #0 !prof !35 {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, ptr %i.addr, align 4
  %0 = load i32, ptr %i.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end8

if.then:                                          ; preds = %entry
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %1 = load i32, ptr %i.addr, align 4
  %call1 = call i32 @abs(i32 noundef %1) #4
  %2 = load i32, ptr %i.addr, align 4
  %cmp = icmp eq i32 %2, 10
  br i1 %cmp, label %if.then2, label %if.else

if.then2:                                         ; preds = %if.then
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  br label %if.end7

if.else:                                          ; preds = %if.then
  %3 = load i32, ptr %i.addr, align 4
  %cmp4 = icmp eq i32 %3, 5
  br i1 %cmp4, label %if.then5, label %if.end

if.then5:                                         ; preds = %if.else
  %call6 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %if.end

if.end:                                           ; preds = %if.then5, %if.else
  br label %if.end7

if.end7:                                          ; preds = %if.end, %if.then2
  br label %if.end8

if.end8:                                          ; preds = %if.end7, %entry
  %call9 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: nounwind willreturn memory(none)
declare i32 @abs(i32 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #3 !prof !36 {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %c = alloca i32, align 4
  %i1 = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  store i32 10, ptr %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp ne i32 %0, 0
  br i1 %cmp, label %while.body, label %while.end, !prof !37

while.body:                                       ; preds = %while.cond
  %call = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.4, ptr noundef %i)
  %1 = load i32, ptr %i, align 4
  %rem = srem i32 %1, 2
  store i32 %rem, ptr %c, align 4
  %2 = load i32, ptr %c, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.then, label %if.end, !prof !38

if.then:                                          ; preds = %while.body
  br label %if.end

if.end:                                           ; preds = %if.then, %while.body
  br label %while.cond, !llvm.loop !39

while.end:                                        ; preds = %while.cond
  store i32 0, ptr %i1, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %while.end
  %3 = load i32, ptr %i1, align 4
  %cmp2 = icmp slt i32 %3, 15
  br i1 %cmp2, label %for.body, label %for.end, !prof !41

for.body:                                         ; preds = %for.cond
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32, ptr %i1, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, ptr %i1, align 4
  br label %for.cond, !llvm.loop !42

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

attributes #0 = { cold noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind willreturn memory(none) }

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
!8 = !{!"TotalCount", i64 38}
!9 = !{!"MaxCount", i64 15}
!10 = !{!"MaxInternalCount", i64 15}
!11 = !{!"MaxFunctionCount", i64 12}
!12 = !{!"NumCounts", i64 8}
!13 = !{!"NumFunctions", i64 2}
!14 = !{!"IsPartialProfile", i64 0}
!15 = !{!"PartialProfileRatio", double 0.000000e+00}
!16 = !{!"DetailedSummary", !17}
!17 = !{!18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33}
!18 = !{i32 10000, i64 0, i32 0}
!19 = !{i32 100000, i64 15, i32 1}
!20 = !{i32 200000, i64 15, i32 1}
!21 = !{i32 300000, i64 15, i32 1}
!22 = !{i32 400000, i64 15, i32 1}
!23 = !{i32 500000, i64 12, i32 2}
!24 = !{i32 600000, i64 12, i32 2}
!25 = !{i32 700000, i64 12, i32 2}
!26 = !{i32 800000, i64 10, i32 3}
!27 = !{i32 900000, i64 10, i32 3}
!28 = !{i32 950000, i64 10, i32 3}
!29 = !{i32 990000, i64 10, i32 3}
!30 = !{i32 999000, i64 10, i32 3}
!31 = !{i32 999900, i64 10, i32 3}
!32 = !{i32 999990, i64 10, i32 3}
!33 = !{i32 999999, i64 10, i32 3}
!34 = !{!"Ubuntu clang version 17.0.6 (++20231209124227+6009708b4367-1~exp1~20231209124336.77)"}
!35 = !{!"function_entry_count", i64 0}
!36 = !{!"function_entry_count", i64 1}
!37 = !{!"branch_weights", i32 12, i32 1}
!38 = !{!"branch_weights", i32 10, i32 2}
!39 = distinct !{!39, !40}
!40 = !{!"llvm.loop.mustprogress"}
!41 = !{!"branch_weights", i32 15, i32 1}
!42 = distinct !{!42, !40}
