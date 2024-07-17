; ModuleID = 'inputs/llvm-ir/hash_table.ll'
source_filename = "inputs/src/hash_table.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Node = type { ptr, i32, ptr }

@stderr = external global ptr, align 8
@.str = private unnamed_addr constant [22 x i8] c"Usage: %s <filename>\0A\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"Could not open file %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"%s: %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local ptr @create_node(ptr noundef %word) #0 {
entry:
  %call = call noalias ptr @malloc(i64 noundef 24) #10
  %call1 = call noalias ptr @strdup(ptr noundef %word) #11
  %word2 = getelementptr inbounds %struct.Node, ptr %call, i32 0, i32 0
  store ptr %call1, ptr %word2, align 8, !tbaa !5
  %count = getelementptr inbounds %struct.Node, ptr %call, i32 0, i32 1
  store i32 1, ptr %count, align 8, !tbaa !11
  %next = getelementptr inbounds %struct.Node, ptr %call, i32 0, i32 2
  store ptr null, ptr %next, align 8, !tbaa !12
  ret ptr %call
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #2

; Function Attrs: nounwind
declare noalias ptr @strdup(ptr noundef) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local i32 @hash(ptr noundef %word) #0 {
entry:
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %hash_value.0 = phi i32 [ 0, %entry ], [ %add, %while.body ]
  %word.addr.0 = phi ptr [ %word, %entry ], [ %incdec.ptr, %while.body ]
  %0 = load i8, ptr %word.addr.0, align 1, !tbaa !13
  %tobool = icmp ne i8 %0, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %shl = shl i32 %hash_value.0, 5
  %incdec.ptr = getelementptr inbounds i8, ptr %word.addr.0, i32 1
  %1 = load i8, ptr %word.addr.0, align 1, !tbaa !13
  %conv = sext i8 %1 to i32
  %add = add i32 %shl, %conv
  br label %while.cond, !llvm.loop !14

while.end:                                        ; preds = %while.cond
  %rem = urem i32 %hash_value.0, 100
  ret i32 %rem
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 {
entry:
  %hash_table = alloca [100 x ptr], align 16
  %word = alloca [256 x i8], align 16
  %cmp = icmp ne i32 %argc, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %0 = load ptr, ptr @stderr, align 8, !tbaa !17
  %arrayidx = getelementptr inbounds ptr, ptr %argv, i64 0
  %1 = load ptr, ptr %arrayidx, align 8, !tbaa !17
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %0, ptr noundef @.str, ptr noundef %1)
  br label %return

if.end:                                           ; preds = %entry
  %arrayidx1 = getelementptr inbounds ptr, ptr %argv, i64 1
  %2 = load ptr, ptr %arrayidx1, align 8, !tbaa !17
  %call2 = call noalias ptr @fopen(ptr noundef %2, ptr noundef @.str.1)
  %tobool = icmp ne ptr %call2, null
  br i1 %tobool, label %if.end6, label %if.then3

if.then3:                                         ; preds = %if.end
  %3 = load ptr, ptr @stderr, align 8, !tbaa !17
  %arrayidx4 = getelementptr inbounds ptr, ptr %argv, i64 1
  %4 = load ptr, ptr %arrayidx4, align 8, !tbaa !17
  %call5 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %3, ptr noundef @.str.2, ptr noundef %4)
  br label %cleanup

if.end6:                                          ; preds = %if.end
  call void @llvm.lifetime.start.p0(i64 800, ptr %hash_table) #11
  call void @llvm.memset.p0.i64(ptr align 16 %hash_table, i8 0, i64 800, i1 false)
  call void @llvm.lifetime.start.p0(i64 256, ptr %word) #11
  br label %while.cond

while.cond:                                       ; preds = %if.end62, %if.end6
  %index.0 = phi i32 [ 0, %if.end6 ], [ %index.1, %if.end62 ]
  %call7 = call i32 @fgetc(ptr noundef %call2)
  %cmp8 = icmp ne i32 %call7, -1
  br i1 %cmp8, label %while.body, label %while.end63

while.body:                                       ; preds = %while.cond
  %call9 = call ptr @__ctype_b_loc() #12
  %5 = load ptr, ptr %call9, align 8, !tbaa !17
  %idxprom = sext i32 %call7 to i64
  %arrayidx10 = getelementptr inbounds i16, ptr %5, i64 %idxprom
  %6 = load i16, ptr %arrayidx10, align 2, !tbaa !18
  %conv = zext i16 %6 to i32
  %and = and i32 %conv, 1024
  %tobool11 = icmp ne i32 %and, 0
  br i1 %tobool11, label %if.then12, label %if.else26

if.then12:                                        ; preds = %while.body
  %7 = call i1 @llvm.is.constant.i32(i32 %call7)
  br i1 %7, label %if.then13, label %if.else

if.then13:                                        ; preds = %if.then12
  %cmp14 = icmp slt i32 %call7, -128
  br i1 %cmp14, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then13
  %cmp16 = icmp sgt i32 %call7, 255
  br i1 %cmp16, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %if.then13
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %call18 = call ptr @__ctype_tolower_loc() #12
  %8 = load ptr, ptr %call18, align 8, !tbaa !17
  %idxprom19 = sext i32 %call7 to i64
  %arrayidx20 = getelementptr inbounds i32, ptr %8, i64 %idxprom19
  %9 = load i32, ptr %arrayidx20, align 4, !tbaa !20
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %call7, %cond.true ], [ %9, %cond.false ]
  br label %if.end22

if.else:                                          ; preds = %if.then12
  %call21 = call i32 @tolower(i32 noundef %call7) #13
  br label %if.end22

if.end22:                                         ; preds = %if.else, %cond.end
  %__res.0 = phi i32 [ %cond, %cond.end ], [ %call21, %if.else ]
  %conv23 = trunc i32 %__res.0 to i8
  %inc = add nsw i32 %index.0, 1
  %idxprom24 = sext i32 %index.0 to i64
  %arrayidx25 = getelementptr inbounds [256 x i8], ptr %word, i64 0, i64 %idxprom24
  store i8 %conv23, ptr %arrayidx25, align 1, !tbaa !13
  br label %if.end62

if.else26:                                        ; preds = %while.body
  %cmp27 = icmp sgt i32 %index.0, 0
  br i1 %cmp27, label %if.then29, label %if.end61

if.then29:                                        ; preds = %if.else26
  %idxprom30 = sext i32 %index.0 to i64
  %arrayidx31 = getelementptr inbounds [256 x i8], ptr %word, i64 0, i64 %idxprom30
  store i8 0, ptr %arrayidx31, align 1, !tbaa !13
  %arraydecay = getelementptr inbounds [256 x i8], ptr %word, i64 0, i64 0
  %call33 = call i32 @hash(ptr noundef %arraydecay)
  %idxprom34 = zext i32 %call33 to i64
  %arrayidx35 = getelementptr inbounds [100 x ptr], ptr %hash_table, i64 0, i64 %idxprom34
  %10 = load ptr, ptr %arrayidx35, align 8, !tbaa !17
  br label %while.cond36

while.cond36:                                     ; preds = %while.body44, %if.then29
  %prev.0 = phi ptr [ null, %if.then29 ], [ %current.0, %while.body44 ]
  %current.0 = phi ptr [ %10, %if.then29 ], [ %13, %while.body44 ]
  %cmp37 = icmp ne ptr %current.0, null
  br i1 %cmp37, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond36
  %word39 = getelementptr inbounds %struct.Node, ptr %current.0, i32 0, i32 0
  %11 = load ptr, ptr %word39, align 8, !tbaa !5
  %arraydecay40 = getelementptr inbounds [256 x i8], ptr %word, i64 0, i64 0
  %call41 = call i32 @strcmp(ptr noundef %11, ptr noundef %arraydecay40) #13
  %cmp42 = icmp ne i32 %call41, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond36
  %12 = phi i1 [ false, %while.cond36 ], [ %cmp42, %land.rhs ]
  br i1 %12, label %while.body44, label %while.end

while.body44:                                     ; preds = %land.end
  %next = getelementptr inbounds %struct.Node, ptr %current.0, i32 0, i32 2
  %13 = load ptr, ptr %next, align 8, !tbaa !12
  br label %while.cond36, !llvm.loop !21

while.end:                                        ; preds = %land.end
  %cmp45 = icmp eq ptr %current.0, null
  br i1 %cmp45, label %if.then47, label %if.else58

if.then47:                                        ; preds = %while.end
  %arraydecay48 = getelementptr inbounds [256 x i8], ptr %word, i64 0, i64 0
  %call49 = call ptr @create_node(ptr noundef %arraydecay48)
  %cmp50 = icmp eq ptr %prev.0, null
  br i1 %cmp50, label %if.then52, label %if.else55

if.then52:                                        ; preds = %if.then47
  %idxprom53 = zext i32 %call33 to i64
  %arrayidx54 = getelementptr inbounds [100 x ptr], ptr %hash_table, i64 0, i64 %idxprom53
  store ptr %call49, ptr %arrayidx54, align 8, !tbaa !17
  br label %if.end57

if.else55:                                        ; preds = %if.then47
  %next56 = getelementptr inbounds %struct.Node, ptr %prev.0, i32 0, i32 2
  store ptr %call49, ptr %next56, align 8, !tbaa !12
  br label %if.end57

if.end57:                                         ; preds = %if.else55, %if.then52
  br label %if.end60

if.else58:                                        ; preds = %while.end
  %count = getelementptr inbounds %struct.Node, ptr %current.0, i32 0, i32 1
  %14 = load i32, ptr %count, align 8, !tbaa !11
  %inc59 = add nsw i32 %14, 1
  store i32 %inc59, ptr %count, align 8, !tbaa !11
  br label %if.end60

if.end60:                                         ; preds = %if.else58, %if.end57
  br label %if.end61

if.end61:                                         ; preds = %if.end60, %if.else26
  br label %if.end62

if.end62:                                         ; preds = %if.end61, %if.end22
  %index.1 = phi i32 [ %inc, %if.end22 ], [ %index.0, %if.end61 ]
  br label %while.cond, !llvm.loop !22

while.end63:                                      ; preds = %while.cond
  %cmp64 = icmp sgt i32 %index.0, 0
  br i1 %cmp64, label %if.then66, label %if.end107

if.then66:                                        ; preds = %while.end63
  %idxprom67 = sext i32 %index.0 to i64
  %arrayidx68 = getelementptr inbounds [256 x i8], ptr %word, i64 0, i64 %idxprom67
  store i8 0, ptr %arrayidx68, align 1, !tbaa !13
  %arraydecay70 = getelementptr inbounds [256 x i8], ptr %word, i64 0, i64 0
  %call71 = call i32 @hash(ptr noundef %arraydecay70)
  %idxprom73 = zext i32 %call71 to i64
  %arrayidx74 = getelementptr inbounds [100 x ptr], ptr %hash_table, i64 0, i64 %idxprom73
  %15 = load ptr, ptr %arrayidx74, align 8, !tbaa !17
  br label %while.cond76

while.cond76:                                     ; preds = %while.body86, %if.then66
  %current72.0 = phi ptr [ %15, %if.then66 ], [ %18, %while.body86 ]
  %prev75.0 = phi ptr [ null, %if.then66 ], [ %current72.0, %while.body86 ]
  %cmp77 = icmp ne ptr %current72.0, null
  br i1 %cmp77, label %land.rhs79, label %land.end85

land.rhs79:                                       ; preds = %while.cond76
  %word80 = getelementptr inbounds %struct.Node, ptr %current72.0, i32 0, i32 0
  %16 = load ptr, ptr %word80, align 8, !tbaa !5
  %arraydecay81 = getelementptr inbounds [256 x i8], ptr %word, i64 0, i64 0
  %call82 = call i32 @strcmp(ptr noundef %16, ptr noundef %arraydecay81) #13
  %cmp83 = icmp ne i32 %call82, 0
  br label %land.end85

land.end85:                                       ; preds = %land.rhs79, %while.cond76
  %17 = phi i1 [ false, %while.cond76 ], [ %cmp83, %land.rhs79 ]
  br i1 %17, label %while.body86, label %while.end88

while.body86:                                     ; preds = %land.end85
  %next87 = getelementptr inbounds %struct.Node, ptr %current72.0, i32 0, i32 2
  %18 = load ptr, ptr %next87, align 8, !tbaa !12
  br label %while.cond76, !llvm.loop !23

while.end88:                                      ; preds = %land.end85
  %cmp89 = icmp eq ptr %current72.0, null
  br i1 %cmp89, label %if.then91, label %if.else103

if.then91:                                        ; preds = %while.end88
  %arraydecay93 = getelementptr inbounds [256 x i8], ptr %word, i64 0, i64 0
  %call94 = call ptr @create_node(ptr noundef %arraydecay93)
  %cmp95 = icmp eq ptr %prev75.0, null
  br i1 %cmp95, label %if.then97, label %if.else100

if.then97:                                        ; preds = %if.then91
  %idxprom98 = zext i32 %call71 to i64
  %arrayidx99 = getelementptr inbounds [100 x ptr], ptr %hash_table, i64 0, i64 %idxprom98
  store ptr %call94, ptr %arrayidx99, align 8, !tbaa !17
  br label %if.end102

if.else100:                                       ; preds = %if.then91
  %next101 = getelementptr inbounds %struct.Node, ptr %prev75.0, i32 0, i32 2
  store ptr %call94, ptr %next101, align 8, !tbaa !12
  br label %if.end102

if.end102:                                        ; preds = %if.else100, %if.then97
  br label %if.end106

if.else103:                                       ; preds = %while.end88
  %count104 = getelementptr inbounds %struct.Node, ptr %current72.0, i32 0, i32 1
  %19 = load i32, ptr %count104, align 8, !tbaa !11
  %inc105 = add nsw i32 %19, 1
  store i32 %inc105, ptr %count104, align 8, !tbaa !11
  br label %if.end106

if.end106:                                        ; preds = %if.else103, %if.end102
  br label %if.end107

if.end107:                                        ; preds = %if.end106, %while.end63
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end107
  %i.0 = phi i32 [ 0, %if.end107 ], [ %inc122, %for.inc ]
  %cmp108 = icmp slt i32 %i.0, 100
  br i1 %cmp108, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  br label %for.end

for.body:                                         ; preds = %for.cond
  %idxprom111 = sext i32 %i.0 to i64
  %arrayidx112 = getelementptr inbounds [100 x ptr], ptr %hash_table, i64 0, i64 %idxprom111
  %20 = load ptr, ptr %arrayidx112, align 8, !tbaa !17
  br label %while.cond113

while.cond113:                                    ; preds = %while.body116, %for.body
  %current110.0 = phi ptr [ %20, %for.body ], [ %23, %while.body116 ]
  %cmp114 = icmp ne ptr %current110.0, null
  br i1 %cmp114, label %while.body116, label %while.end121

while.body116:                                    ; preds = %while.cond113
  %word117 = getelementptr inbounds %struct.Node, ptr %current110.0, i32 0, i32 0
  %21 = load ptr, ptr %word117, align 8, !tbaa !5
  %count118 = getelementptr inbounds %struct.Node, ptr %current110.0, i32 0, i32 1
  %22 = load i32, ptr %count118, align 8, !tbaa !11
  %call119 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %21, i32 noundef %22)
  %next120 = getelementptr inbounds %struct.Node, ptr %current110.0, i32 0, i32 2
  %23 = load ptr, ptr %next120, align 8, !tbaa !12
  br label %while.cond113, !llvm.loop !24

while.end121:                                     ; preds = %while.cond113
  br label %for.inc

for.inc:                                          ; preds = %while.end121
  %inc122 = add nsw i32 %i.0, 1
  br label %for.cond, !llvm.loop !25

for.end:                                          ; preds = %for.cond.cleanup
  br label %for.cond124

for.cond124:                                      ; preds = %for.inc139, %for.end
  %i123.0 = phi i32 [ 0, %for.end ], [ %inc140, %for.inc139 ]
  %cmp125 = icmp slt i32 %i123.0, 100
  br i1 %cmp125, label %for.body128, label %for.cond.cleanup127

for.cond.cleanup127:                              ; preds = %for.cond124
  br label %for.end141

for.body128:                                      ; preds = %for.cond124
  %idxprom130 = sext i32 %i123.0 to i64
  %arrayidx131 = getelementptr inbounds [100 x ptr], ptr %hash_table, i64 0, i64 %idxprom130
  %24 = load ptr, ptr %arrayidx131, align 8, !tbaa !17
  br label %while.cond132

while.cond132:                                    ; preds = %while.body135, %for.body128
  %current129.0 = phi ptr [ %24, %for.body128 ], [ %25, %while.body135 ]
  %cmp133 = icmp ne ptr %current129.0, null
  br i1 %cmp133, label %while.body135, label %while.end138

while.body135:                                    ; preds = %while.cond132
  %next136 = getelementptr inbounds %struct.Node, ptr %current129.0, i32 0, i32 2
  %25 = load ptr, ptr %next136, align 8, !tbaa !12
  %word137 = getelementptr inbounds %struct.Node, ptr %current129.0, i32 0, i32 0
  %26 = load ptr, ptr %word137, align 8, !tbaa !5
  call void @free(ptr noundef %26) #11
  call void @free(ptr noundef %current129.0) #11
  br label %while.cond132, !llvm.loop !26

while.end138:                                     ; preds = %while.cond132
  br label %for.inc139

for.inc139:                                       ; preds = %while.end138
  %inc140 = add nsw i32 %i123.0, 1
  br label %for.cond124, !llvm.loop !27

for.end141:                                       ; preds = %for.cond.cleanup127
  %call142 = call i32 @fclose(ptr noundef %call2)
  call void @llvm.lifetime.end.p0(i64 256, ptr %word) #11
  call void @llvm.lifetime.end.p0(i64 800, ptr %hash_table) #11
  br label %cleanup

cleanup:                                          ; preds = %for.end141, %if.then3
  %retval.0 = phi i32 [ 0, %for.end141 ], [ -1, %if.then3 ]
  br label %return

return:                                           ; preds = %cleanup, %if.then
  %retval.1 = phi i32 [ 1, %if.then ], [ %retval.0, %cleanup ]
  ret i32 %retval.1
}

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #4

declare noalias ptr @fopen(ptr noundef, ptr noundef) #4

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

declare i32 @fgetc(ptr noundef) #4

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #6

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare i1 @llvm.is.constant.i32(i32) #7

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_tolower_loc() #6

; Function Attrs: inlinehint nounwind willreturn memory(read) uwtable
define available_externally i32 @tolower(i32 noundef %__c) #8 {
entry:
  %cmp = icmp sge i32 %__c, -128
  br i1 %cmp, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %cmp1 = icmp slt i32 %__c, 256
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %call = call ptr @__ctype_tolower_loc() #12
  %0 = load ptr, ptr %call, align 8, !tbaa !17
  %idxprom = sext i32 %__c to i64
  %arrayidx = getelementptr inbounds i32, ptr %0, i64 %idxprom
  %1 = load i32, ptr %arrayidx, align 4, !tbaa !20
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ %__c, %cond.false ]
  ret i32 %cond
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #9

declare i32 @printf(ptr noundef, ...) #4

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

declare i32 @fclose(ptr noundef) #4

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind allocsize(0) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #6 = { nounwind willreturn memory(none) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { convergent nocallback nofree nosync nounwind willreturn memory(none) }
attributes #8 = { inlinehint nounwind willreturn memory(read) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind willreturn memory(read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nounwind allocsize(0) }
attributes #11 = { nounwind }
attributes #12 = { nounwind willreturn memory(none) }
attributes #13 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 17.0.6 (++20231209124227+6009708b4367-1~exp1~20231209124336.77)"}
!5 = !{!6, !7, i64 0}
!6 = !{!"Node", !7, i64 0, !10, i64 8, !7, i64 16}
!7 = !{!"any pointer", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!6, !10, i64 8}
!12 = !{!6, !7, i64 16}
!13 = !{!8, !8, i64 0}
!14 = distinct !{!14, !15, !16}
!15 = !{!"llvm.loop.mustprogress"}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = !{!7, !7, i64 0}
!18 = !{!19, !19, i64 0}
!19 = !{!"short", !8, i64 0}
!20 = !{!10, !10, i64 0}
!21 = distinct !{!21, !15, !16}
!22 = distinct !{!22, !15, !16}
!23 = distinct !{!23, !15, !16}
!24 = distinct !{!24, !15, !16}
!25 = distinct !{!25, !15, !16}
!26 = distinct !{!26, !15, !16}
!27 = distinct !{!27, !15, !16}
