; ModuleID = 'inputs/llvm-ir/average.ll'
source_filename = "inputs/src/average.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, ptr, ptr }

; Function Attrs: nounwind uwtable
define dso_local i32 @main() #0 {
entry:
  %ap.i = alloca [1 x %struct.__va_list_tag], align 16
  call void @llvm.lifetime.start.p0(i64 24, ptr %ap.i) #4
  call void @llvm.va_start(ptr %ap.i)
  br label %for.cond.i

for.cond.i:                                       ; preds = %vaarg.end.i, %entry
  %j.0.i = phi i32 [ 0, %entry ], [ %inc.i, %vaarg.end.i ]
  %tot.0.i = phi double [ 0.000000e+00, %entry ], [ %add.i, %vaarg.end.i ]
  %cmp.i = icmp slt i32 %j.0.i, 5
  br i1 %cmp.i, label %for.body.i, label %average.exit

for.body.i:                                       ; preds = %for.cond.i
  %fp_offset_p.i = getelementptr inbounds %struct.__va_list_tag, ptr %ap.i, i32 0, i32 1
  %fp_offset.i = load i32, ptr %fp_offset_p.i, align 4
  %fits_in_fp.i = icmp ule i32 %fp_offset.i, 160
  br i1 %fits_in_fp.i, label %vaarg.in_reg.i, label %vaarg.in_mem.i

vaarg.in_reg.i:                                   ; preds = %for.body.i
  %0 = getelementptr inbounds %struct.__va_list_tag, ptr %ap.i, i32 0, i32 3
  %reg_save_area.i = load ptr, ptr %0, align 16
  %1 = getelementptr i8, ptr %reg_save_area.i, i32 %fp_offset.i
  %2 = add i32 %fp_offset.i, 16
  store i32 %2, ptr %fp_offset_p.i, align 4
  br label %vaarg.end.i

vaarg.in_mem.i:                                   ; preds = %for.body.i
  %overflow_arg_area_p.i = getelementptr inbounds %struct.__va_list_tag, ptr %ap.i, i32 0, i32 2
  %overflow_arg_area.i = load ptr, ptr %overflow_arg_area_p.i, align 8
  %overflow_arg_area.next.i = getelementptr i8, ptr %overflow_arg_area.i, i32 8
  store ptr %overflow_arg_area.next.i, ptr %overflow_arg_area_p.i, align 8
  br label %vaarg.end.i

vaarg.end.i:                                      ; preds = %vaarg.in_mem.i, %vaarg.in_reg.i
  %vaarg.addr.i = phi ptr [ %1, %vaarg.in_reg.i ], [ %overflow_arg_area.i, %vaarg.in_mem.i ]
  %3 = load double, ptr %vaarg.addr.i, align 8
  %add.i = fadd double %tot.0.i, %3
  %inc.i = add nsw i32 %j.0.i, 1
  br label %for.cond.i, !llvm.loop !5

average.exit:                                     ; preds = %for.cond.i
  call void @llvm.va_end(ptr %ap.i)
  %div.i = fdiv double %tot.0.i, 5.000000e+00
  call void @llvm.lifetime.end.p0(i64 24, ptr %ap.i) #4
  %conv = fptosi double %div.i to i32
  ret i32 %conv
}

; Function Attrs: inlinehint nounwind uwtable
define available_externally double @average(i32 noundef %count, ...) #1 {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  call void @llvm.lifetime.start.p0(i64 24, ptr %ap) #4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0
  call void @llvm.va_start(ptr %arraydecay)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %j.0 = phi i32 [ 0, %entry ], [ %inc, %for.inc ]
  %tot.0 = phi double [ 0.000000e+00, %entry ], [ %add, %for.inc ]
  %cmp = icmp slt i32 %j.0, %count
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay1 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0
  %fp_offset_p = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay1, i32 0, i32 1
  %fp_offset = load i32, ptr %fp_offset_p, align 4
  %fits_in_fp = icmp ule i32 %fp_offset, 160
  br i1 %fits_in_fp, label %vaarg.in_reg, label %vaarg.in_mem

vaarg.in_reg:                                     ; preds = %for.body
  %0 = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay1, i32 0, i32 3
  %reg_save_area = load ptr, ptr %0, align 16
  %1 = getelementptr i8, ptr %reg_save_area, i32 %fp_offset
  %2 = add i32 %fp_offset, 16
  store i32 %2, ptr %fp_offset_p, align 4
  br label %vaarg.end

vaarg.in_mem:                                     ; preds = %for.body
  %overflow_arg_area_p = getelementptr inbounds %struct.__va_list_tag, ptr %arraydecay1, i32 0, i32 2
  %overflow_arg_area = load ptr, ptr %overflow_arg_area_p, align 8
  %overflow_arg_area.next = getelementptr i8, ptr %overflow_arg_area, i32 8
  store ptr %overflow_arg_area.next, ptr %overflow_arg_area_p, align 8
  br label %vaarg.end

vaarg.end:                                        ; preds = %vaarg.in_mem, %vaarg.in_reg
  %vaarg.addr = phi ptr [ %1, %vaarg.in_reg ], [ %overflow_arg_area, %vaarg.in_mem ]
  %3 = load double, ptr %vaarg.addr, align 8
  %add = fadd double %tot.0, %3
  br label %for.inc

for.inc:                                          ; preds = %vaarg.end
  %inc = add nsw i32 %j.0, 1
  br label %for.cond, !llvm.loop !5

for.end:                                          ; preds = %for.cond
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %ap, i64 0, i64 0
  call void @llvm.va_end(ptr %arraydecay2)
  %conv = sitofp i32 %count to double
  %div = fdiv double %tot.0, %conv
  call void @llvm.lifetime.end.p0(i64 24, ptr %ap) #4
  ret double %div
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start(ptr) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end(ptr) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inlinehint nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nosync nounwind willreturn }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 17.0.6 (++20231209124227+6009708b4367-1~exp1~20231209124336.77)"}
!5 = distinct !{!5, !6, !7}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!"llvm.loop.unroll.disable"}
