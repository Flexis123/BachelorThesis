; ModuleID = 'inputs/llvm-ir/for_loop.ll'
source_filename = "inputs/src/for_loop.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@f1 = dso_local global i32 10, align 4
@.str = private unnamed_addr constant [13 x i8] c"ntyutyjujtyu\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local void @f() #0 {
entry:
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %dec = alloca i32, align 4
  %0 = call double @llvm.fabs.f64(double 3.000000e+00)
  %conv = fptosi double %0 to i32
  %call = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %dec)
  %1 = load i32, ptr %dec, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %conv1 = sitofp i32 %conv to double
  %2 = call double @llvm.fabs.f64(double %conv1)
  %conv2 = fptosi double %2 to i32
  %call.i1 = call i32 (ptr, ...) @printf(ptr noundef @.str) #3
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %i.0 = phi i32 [ %conv2, %if.then ], [ %conv, %entry ]
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end
  %i.1 = phi i32 [ %i.0, %if.end ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.1, 100
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %call.i = call i32 (ptr, ...) @printf(ptr noundef @.str) #3
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %inc = add nsw i32 %i.1, 1
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  ret i32 0
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #2

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind }

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
