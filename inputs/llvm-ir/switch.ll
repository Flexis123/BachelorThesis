; ModuleID = 'inputs/src/switch.c'
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

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @wazza(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %5 = call i64 @time(ptr noundef null) #4
  %6 = trunc i64 %5 to i32
  call void @srand(i32 noundef %6) #4
  %7 = call i32 @rand() #4
  %8 = srem i32 %7, 2
  store i32 %8, ptr %3, align 4
  %9 = load i32, ptr %3, align 4
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %12

11:                                               ; preds = %1
  call void @exit(i32 noundef 0) #5
  unreachable

12:                                               ; preds = %1
  %13 = load i32, ptr %3, align 4
  %14 = load i32, ptr %2, align 4
  %15 = add nsw i32 %13, %14
  store i32 %15, ptr %4, align 4
  %16 = load i32, ptr %4, align 4
  ret i32 %16
}

; Function Attrs: nounwind
declare void @srand(i32 noundef) #1

; Function Attrs: nounwind
declare i64 @time(ptr noundef) #1

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #2

; Function Attrs: noinline nounwind uwtable
define dso_local void @bazza(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %4 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  ret void
}

declare i32 @printf(ptr noundef, ...) #3

; Function Attrs: noinline nounwind uwtable
define dso_local void @mata() #0 {
  %1 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  %2 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  call void @bazza(i32 noundef 10)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [3 x [3 x i32]], align 16
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  %6 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %3)
  %7 = getelementptr inbounds [3 x [3 x i32]], ptr %2, i64 0, i64 0
  %8 = load i32, ptr %3, align 4
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds [3 x i32], ptr %7, i64 0, i64 %9
  store i32 1, ptr %10, align 4
  %11 = getelementptr inbounds [3 x [3 x i32]], ptr %2, i64 0, i64 2
  %12 = getelementptr inbounds [3 x i32], ptr %11, i64 0, i64 2
  store i32 10, ptr %12, align 8
  %13 = load ptr, ptr @stdout, align 8
  %14 = call i32 @setvbuf(ptr noundef %13, ptr noundef null, i32 noundef 2, i64 noundef 0) #4
  store i32 10, ptr %4, align 4
  br label %15

15:                                               ; preds = %32, %0
  %16 = load i32, ptr %4, align 4
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %18, label %33

18:                                               ; preds = %15
  %19 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %20 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %4)
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %22 = load i32, ptr %4, align 4
  switch i32 %22, label %30 [
    i32 1, label %23
    i32 2, label %28
    i32 3, label %29
  ]

23:                                               ; preds = %18
  %24 = load i32, ptr %4, align 4
  %25 = call i32 @wazza(i32 noundef %24)
  store i32 %25, ptr %5, align 4
  %26 = load i32, ptr %5, align 4
  %27 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, i32 noundef %26)
  call void @mata()
  br label %32

28:                                               ; preds = %18
  call void @bazza(i32 noundef 10)
  br label %32

29:                                               ; preds = %18
  call void @bazza(i32 noundef 5)
  br label %32

30:                                               ; preds = %18
  %31 = call i32 (ptr, ...) @printf(ptr noundef @.str.7)
  br label %32

32:                                               ; preds = %30, %29, %28, %23
  br label %15, !llvm.loop !8

33:                                               ; preds = %15
  ret i32 0
}

declare i32 @__isoc99_scanf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare i32 @setvbuf(ptr noundef, ptr noundef, i32 noundef, i64 noundef) #1

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4, !5, !6}
!llvm.ident = !{!7}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{i32 1, !"ThinLTO", i32 0}
!6 = !{i32 1, !"EnableSplitLTOUnit", i32 1}
!7 = !{!"Ubuntu clang version 17.0.6 (++20231209124227+6009708b4367-1~exp1~20231209124336.77)"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.mustprogress"}

^0 = module: (path: "", hash: (0, 0, 0, 0, 0))
^1 = gv: (name: ".str.4", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 1792662458547667856
^2 = gv: (name: "mata", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 4, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^8, relbf: 512), (callee: ^14, relbf: 256)), refs: (^11)))) ; guid = 2031432195662780700
^3 = gv: (name: ".str.7", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 2742728457233452236
^4 = gv: (name: "time") ; guid = 3946912059654523911
^5 = gv: (name: "__isoc99_scanf") ; guid = 4972326971632665613
^6 = gv: (name: ".str.5", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 5904466303741097597
^7 = gv: (name: "rand") ; guid = 7206085285791387956
^8 = gv: (name: "printf") ; guid = 7383291119112528047
^9 = gv: (name: ".str.3", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 11162752365297748439
^10 = gv: (name: "exit") ; guid = 11176115373368037362
^11 = gv: (name: ".str.2", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 11248774582183525572
^12 = gv: (name: ".str.6", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 12320900272532970724
^13 = gv: (name: ".str", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 13780934726227643368
^14 = gv: (name: "bazza", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 7, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^8, relbf: 1024)), refs: (^13, ^18, ^11)))) ; guid = 14671233245904283460
^15 = gv: (name: "wazza", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 21, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^4, relbf: 256), (callee: ^17, relbf: 256), (callee: ^7, relbf: 256), (callee: ^10))))) ; guid = 15557681245842809711
^16 = gv: (name: "main", summaries: (function: (module: ^0, flags: (linkage: external, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), insts: 42, funcFlags: (readNone: 0, readOnly: 0, noRecurse: 0, returnDoesNotAlias: 0, noInline: 1, alwaysInline: 0, noUnwind: 1, mayThrow: 0, hasUnknownCall: 0, mustBeUnreachable: 0), calls: ((callee: ^5, relbf: 8192), (callee: ^20, relbf: 256), (callee: ^8, relbf: 19776), (callee: ^15, relbf: 1952), (callee: ^2, relbf: 1952), (callee: ^14, relbf: 3968)), refs: (^9, ^19, ^1, ^6, ^12, ^3)))) ; guid = 15822663052811949562
^17 = gv: (name: "srand") ; guid = 16361127236386863736
^18 = gv: (name: ".str.1", summaries: (variable: (module: ^0, flags: (linkage: private, visibility: default, notEligibleToImport: 1, live: 0, dsoLocal: 1, canAutoHide: 0), varFlags: (readonly: 1, writeonly: 0, constant: 1)))) ; guid = 17071063749435967790
^19 = gv: (name: "stdout") ; guid = 17868584848121082468
^20 = gv: (name: "setvbuf") ; guid = 18081091436902918848
^21 = flags: 8
^22 = blockcount: 0
