; ModuleID = 'inputs/llvm-ir/switch.ll'
source_filename = "inputs/src/switch.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"bazza\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"pula\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"mata\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1
@stdout = external global ptr, align 8
@.str.4 = private unnamed_addr constant [17 x i8] c"Enter a number: \00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.6 = private unnamed_addr constant [27 x i8] c"this shit is so stupid %d\0A\00", align 1
@.str.7 = private unnamed_addr constant [22 x i8] c"default as shit bruh\0A\00", align 1

; Function Attrs: inlinehint noinline nounwind uwtable
define dso_local i32 @wazza(i32 noundef %f) #0 !prof !35 {
entry:
  %f.addr = alloca i32, align 4
  %r = alloca i32, align 4
  %res = alloca i32, align 4
  store i32 %f, ptr %f.addr, align 4
  %call = call i64 @time(ptr noundef null) #4
  %conv = trunc i64 %call to i32
  call void @srand(i32 noundef %conv) #4
  %call1 = call i32 @rand() #4
  %rem = srem i32 %call1, 2
  store i32 %rem, ptr %r, align 4
  %0 = load i32, ptr %r, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end, !prof !36

if.then:                                          ; preds = %entry
  call void @exit(i32 noundef 0) #5
  unreachable

if.end:                                           ; preds = %entry
  %1 = load i32, ptr %r, align 4
  %2 = load i32, ptr %f.addr, align 4
  %add = add nsw i32 %1, %2
  store i32 %add, ptr %res, align 4
  %3 = load i32, ptr %res, align 4
  ret i32 %3
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: inlinehint noinline nounwind uwtable
define dso_local void @bazza(i32 noundef %i) #0 !prof !37 {
entry:
  %i.addr = alloca i32, align 4
  store i32 %i, ptr %i.addr, align 4
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %call2 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %call3 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: inlinehint noinline nounwind uwtable
define dso_local void @mata() #0 !prof !38 {
entry:
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %call1 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @bazza(i32 noundef 10)
  ret void
}

; Function Attrs: inlinehint noinline nounwind uwtable
define dso_local i32 @main() #0 !prof !38 {
entry:
  %retval = alloca i32, align 4
  %nums = alloca [3 x [3 x i32]], align 16
  %d = alloca i32, align 4
  %i = alloca i32, align 4
  %f = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  %call = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %d)
  %arrayidx = getelementptr inbounds [3 x [3 x i32]], ptr %nums, i64 0, i64 0
  %0 = load i32, ptr %d, align 4
  %idxprom = sext i32 %0 to i64
  %arrayidx1 = getelementptr inbounds [3 x i32], ptr %arrayidx, i64 0, i64 %idxprom
  store i32 1, ptr %arrayidx1, align 4
  %arrayidx2 = getelementptr inbounds [3 x [3 x i32]], ptr %nums, i64 0, i64 2
  %arrayidx3 = getelementptr inbounds [3 x i32], ptr %arrayidx2, i64 0, i64 2
  store i32 10, ptr %arrayidx3, align 8
  %1 = load ptr, ptr @stdout, align 8
  %call4 = call i32 @setvbuf(ptr noundef %1, ptr noundef null, i32 noundef 2, i64 noundef 0) #4
  store i32 10, ptr %i, align 4
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %2 = load i32, ptr %i, align 4
  %cmp = icmp ne i32 %2, 0
  br i1 %cmp, label %while.body, label %while.end, !prof !39

while.body:                                       ; preds = %while.cond
  %call5 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %call6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %i)
  %call7 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %3 = load i32, ptr %i, align 4
  switch i32 %3, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb10
    i32 3, label %sw.bb11
  ], !prof !40

sw.bb:                                            ; preds = %while.body
  %4 = load i32, ptr %i, align 4
  %call8 = call i32 @wazza(i32 noundef %4)
  store i32 %call8, ptr %f, align 4
  %5 = load i32, ptr %f, align 4
  %call9 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %5)
  call void @mata()
  br label %sw.epilog

sw.bb10:                                          ; preds = %while.body
  call void @bazza(i32 noundef 10)
  br label %sw.epilog

sw.bb11:                                          ; preds = %while.body
  call void @bazza(i32 noundef 5)
  br label %sw.epilog

sw.default:                                       ; preds = %while.body
  %call12 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.default, %sw.bb11, %sw.bb10, %sw.bb
  br label %while.cond, !llvm.loop !41

while.end:                                        ; preds = %while.cond
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare i32 @setvbuf(ptr noundef, ptr noundef, i32 noundef, i64 noundef) #1

attributes #0 = { inlinehint noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

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
!9 = !{!"MaxCount", i64 16}
!10 = !{!"MaxInternalCount", i64 5}
!11 = !{!"MaxFunctionCount", i64 16}
!12 = !{!"NumCounts", i64 9}
!13 = !{!"NumFunctions", i64 4}
!14 = !{!"IsPartialProfile", i64 0}
!15 = !{!"PartialProfileRatio", double 0.000000e+00}
!16 = !{!"DetailedSummary", !17}
!17 = !{!18, !19, !20, !21, !22, !23, !24, !25, !26, !27, !28, !29, !30, !31, !32, !33}
!18 = !{i32 10000, i64 0, i32 0}
!19 = !{i32 100000, i64 16, i32 1}
!20 = !{i32 200000, i64 16, i32 1}
!21 = !{i32 300000, i64 16, i32 1}
!22 = !{i32 400000, i64 16, i32 1}
!23 = !{i32 500000, i64 10, i32 2}
!24 = !{i32 600000, i64 10, i32 2}
!25 = !{i32 700000, i64 10, i32 2}
!26 = !{i32 800000, i64 5, i32 3}
!27 = !{i32 900000, i64 2, i32 5}
!28 = !{i32 950000, i64 1, i32 8}
!29 = !{i32 990000, i64 1, i32 8}
!30 = !{i32 999000, i64 1, i32 8}
!31 = !{i32 999900, i64 1, i32 8}
!32 = !{i32 999990, i64 1, i32 8}
!33 = !{i32 999999, i64 1, i32 8}
!34 = !{!"Ubuntu clang version 17.0.6 (++20231209124227+6009708b4367-1~exp1~20231209124336.77)"}
!35 = !{!"function_entry_count", i64 2}
!36 = !{!"branch_weights", i32 1, i32 1}
!37 = !{!"function_entry_count", i64 16}
!38 = !{!"function_entry_count", i64 1}
!39 = !{!"branch_weights", i32 17, i32 1}
!40 = !{!"branch_weights", i32 0, i32 2, i32 10, i32 5}
!41 = distinct !{!41, !42}
!42 = !{!"llvm.loop.mustprogress"}
