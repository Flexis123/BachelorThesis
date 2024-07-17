; ModuleID = 'inputs/src/hash_table.c'
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
  %word.addr = alloca ptr, align 8
  %new_node = alloca ptr, align 8
  store ptr %word, ptr %word.addr, align 8, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 8, ptr %new_node) #10
  %call = call noalias ptr @malloc(i64 noundef 24) #11
  store ptr %call, ptr %new_node, align 8, !tbaa !5
  %0 = load ptr, ptr %word.addr, align 8, !tbaa !5
  %call1 = call noalias ptr @strdup(ptr noundef %0) #10
  %1 = load ptr, ptr %new_node, align 8, !tbaa !5
  %word2 = getelementptr inbounds %struct.Node, ptr %1, i32 0, i32 0
  store ptr %call1, ptr %word2, align 8, !tbaa !9
  %2 = load ptr, ptr %new_node, align 8, !tbaa !5
  %count = getelementptr inbounds %struct.Node, ptr %2, i32 0, i32 1
  store i32 1, ptr %count, align 8, !tbaa !12
  %3 = load ptr, ptr %new_node, align 8, !tbaa !5
  %next = getelementptr inbounds %struct.Node, ptr %3, i32 0, i32 2
  store ptr null, ptr %next, align 8, !tbaa !13
  %4 = load ptr, ptr %new_node, align 8, !tbaa !5
  call void @llvm.lifetime.end.p0(i64 8, ptr %new_node) #10
  ret ptr %4
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
  %word.addr = alloca ptr, align 8
  %hash_value = alloca i32, align 4
  store ptr %word, ptr %word.addr, align 8, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 4, ptr %hash_value) #10
  store i32 0, ptr %hash_value, align 4, !tbaa !14
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %0 = load ptr, ptr %word.addr, align 8, !tbaa !5
  %1 = load i8, ptr %0, align 1, !tbaa !15
  %tobool = icmp ne i8 %1, 0
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %2 = load i32, ptr %hash_value, align 4, !tbaa !14
  %shl = shl i32 %2, 5
  %3 = load ptr, ptr %word.addr, align 8, !tbaa !5
  %incdec.ptr = getelementptr inbounds i8, ptr %3, i32 1
  store ptr %incdec.ptr, ptr %word.addr, align 8, !tbaa !5
  %4 = load i8, ptr %3, align 1, !tbaa !15
  %conv = sext i8 %4 to i32
  %add = add i32 %shl, %conv
  store i32 %add, ptr %hash_value, align 4, !tbaa !14
  br label %while.cond, !llvm.loop !16

while.end:                                        ; preds = %while.cond
  %5 = load i32, ptr %hash_value, align 4, !tbaa !14
  %rem = urem i32 %5, 100
  call void @llvm.lifetime.end.p0(i64 4, ptr %hash_value) #10
  ret i32 %rem
}

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca ptr, align 8
  %file = alloca ptr, align 8
  %cleanup.dest.slot = alloca i32, align 4
  %hash_table = alloca [100 x ptr], align 16
  %word = alloca [256 x i8], align 16
  %index = alloca i32, align 4
  %c = alloca i32, align 4
  %__res = alloca i32, align 4
  %__c = alloca i32, align 4
  %tmp = alloca i32, align 4
  %index32 = alloca i32, align 4
  %current = alloca ptr, align 8
  %prev = alloca ptr, align 8
  %new_node = alloca ptr, align 8
  %index69 = alloca i32, align 4
  %current72 = alloca ptr, align 8
  %prev75 = alloca ptr, align 8
  %new_node92 = alloca ptr, align 8
  %i = alloca i32, align 4
  %current110 = alloca ptr, align 8
  %i123 = alloca i32, align 4
  %current129 = alloca ptr, align 8
  %temp = alloca ptr, align 8
  store i32 0, ptr %retval, align 4
  store i32 %argc, ptr %argc.addr, align 4, !tbaa !14
  store ptr %argv, ptr %argv.addr, align 8, !tbaa !5
  %0 = load i32, ptr %argc.addr, align 4, !tbaa !14
  %cmp = icmp ne i32 %0, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %1 = load ptr, ptr @stderr, align 8, !tbaa !5
  %2 = load ptr, ptr %argv.addr, align 8, !tbaa !5
  %arrayidx = getelementptr inbounds ptr, ptr %2, i64 0
  %3 = load ptr, ptr %arrayidx, align 8, !tbaa !5
  %call = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1, ptr noundef @.str, ptr noundef %3)
  store i32 1, ptr %retval, align 4
  br label %return

if.end:                                           ; preds = %entry
  call void @llvm.lifetime.start.p0(i64 8, ptr %file) #10
  %4 = load ptr, ptr %argv.addr, align 8, !tbaa !5
  %arrayidx1 = getelementptr inbounds ptr, ptr %4, i64 1
  %5 = load ptr, ptr %arrayidx1, align 8, !tbaa !5
  %call2 = call noalias ptr @fopen(ptr noundef %5, ptr noundef @.str.1)
  store ptr %call2, ptr %file, align 8, !tbaa !5
  %6 = load ptr, ptr %file, align 8, !tbaa !5
  %tobool = icmp ne ptr %6, null
  br i1 %tobool, label %if.end6, label %if.then3

if.then3:                                         ; preds = %if.end
  %7 = load ptr, ptr @stderr, align 8, !tbaa !5
  %8 = load ptr, ptr %argv.addr, align 8, !tbaa !5
  %arrayidx4 = getelementptr inbounds ptr, ptr %8, i64 1
  %9 = load ptr, ptr %arrayidx4, align 8, !tbaa !5
  %call5 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %7, ptr noundef @.str.2, ptr noundef %9)
  store i32 -1, ptr %retval, align 4
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup

if.end6:                                          ; preds = %if.end
  call void @llvm.lifetime.start.p0(i64 800, ptr %hash_table) #10
  call void @llvm.memset.p0.i64(ptr align 16 %hash_table, i8 0, i64 800, i1 false)
  call void @llvm.lifetime.start.p0(i64 256, ptr %word) #10
  call void @llvm.lifetime.start.p0(i64 4, ptr %index) #10
  store i32 0, ptr %index, align 4, !tbaa !14
  call void @llvm.lifetime.start.p0(i64 4, ptr %c) #10
  br label %while.cond

while.cond:                                       ; preds = %if.end62, %if.end6
  %10 = load ptr, ptr %file, align 8, !tbaa !5
  %call7 = call i32 @fgetc(ptr noundef %10)
  store i32 %call7, ptr %c, align 4, !tbaa !14
  %cmp8 = icmp ne i32 %call7, -1
  br i1 %cmp8, label %while.body, label %while.end63

while.body:                                       ; preds = %while.cond
  %call9 = call ptr @__ctype_b_loc() #12
  %11 = load ptr, ptr %call9, align 8, !tbaa !5
  %12 = load i32, ptr %c, align 4, !tbaa !14
  %idxprom = sext i32 %12 to i64
  %arrayidx10 = getelementptr inbounds i16, ptr %11, i64 %idxprom
  %13 = load i16, ptr %arrayidx10, align 2, !tbaa !19
  %conv = zext i16 %13 to i32
  %and = and i32 %conv, 1024
  %tobool11 = icmp ne i32 %and, 0
  br i1 %tobool11, label %if.then12, label %if.else26

if.then12:                                        ; preds = %while.body
  call void @llvm.lifetime.start.p0(i64 4, ptr %__res) #10
  %14 = load i32, ptr %c, align 4, !tbaa !14
  %15 = call i1 @llvm.is.constant.i32(i32 %14)
  br i1 %15, label %if.then13, label %if.else

if.then13:                                        ; preds = %if.then12
  call void @llvm.lifetime.start.p0(i64 4, ptr %__c) #10
  %16 = load i32, ptr %c, align 4, !tbaa !14
  store i32 %16, ptr %__c, align 4, !tbaa !14
  %17 = load i32, ptr %__c, align 4, !tbaa !14
  %cmp14 = icmp slt i32 %17, -128
  br i1 %cmp14, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.then13
  %18 = load i32, ptr %__c, align 4, !tbaa !14
  %cmp16 = icmp sgt i32 %18, 255
  br i1 %cmp16, label %cond.true, label %cond.false

cond.true:                                        ; preds = %lor.lhs.false, %if.then13
  %19 = load i32, ptr %__c, align 4, !tbaa !14
  br label %cond.end

cond.false:                                       ; preds = %lor.lhs.false
  %call18 = call ptr @__ctype_tolower_loc() #12
  %20 = load ptr, ptr %call18, align 8, !tbaa !5
  %21 = load i32, ptr %__c, align 4, !tbaa !14
  %idxprom19 = sext i32 %21 to i64
  %arrayidx20 = getelementptr inbounds i32, ptr %20, i64 %idxprom19
  %22 = load i32, ptr %arrayidx20, align 4, !tbaa !14
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %19, %cond.true ], [ %22, %cond.false ]
  store i32 %cond, ptr %__res, align 4, !tbaa !14
  call void @llvm.lifetime.end.p0(i64 4, ptr %__c) #10
  br label %if.end22

if.else:                                          ; preds = %if.then12
  %23 = load i32, ptr %c, align 4, !tbaa !14
  %call21 = call i32 @tolower(i32 noundef %23) #13
  store i32 %call21, ptr %__res, align 4, !tbaa !14
  br label %if.end22

if.end22:                                         ; preds = %if.else, %cond.end
  %24 = load i32, ptr %__res, align 4, !tbaa !14
  store i32 %24, ptr %tmp, align 4, !tbaa !14
  call void @llvm.lifetime.end.p0(i64 4, ptr %__res) #10
  %25 = load i32, ptr %tmp, align 4, !tbaa !14
  %conv23 = trunc i32 %25 to i8
  %26 = load i32, ptr %index, align 4, !tbaa !14
  %inc = add nsw i32 %26, 1
  store i32 %inc, ptr %index, align 4, !tbaa !14
  %idxprom24 = sext i32 %26 to i64
  %arrayidx25 = getelementptr inbounds [256 x i8], ptr %word, i64 0, i64 %idxprom24
  store i8 %conv23, ptr %arrayidx25, align 1, !tbaa !15
  br label %if.end62

if.else26:                                        ; preds = %while.body
  %27 = load i32, ptr %index, align 4, !tbaa !14
  %cmp27 = icmp sgt i32 %27, 0
  br i1 %cmp27, label %if.then29, label %if.end61

if.then29:                                        ; preds = %if.else26
  %28 = load i32, ptr %index, align 4, !tbaa !14
  %idxprom30 = sext i32 %28 to i64
  %arrayidx31 = getelementptr inbounds [256 x i8], ptr %word, i64 0, i64 %idxprom30
  store i8 0, ptr %arrayidx31, align 1, !tbaa !15
  call void @llvm.lifetime.start.p0(i64 4, ptr %index32) #10
  %arraydecay = getelementptr inbounds [256 x i8], ptr %word, i64 0, i64 0
  %call33 = call i32 @hash(ptr noundef %arraydecay)
  store i32 %call33, ptr %index32, align 4, !tbaa !14
  call void @llvm.lifetime.start.p0(i64 8, ptr %current) #10
  %29 = load i32, ptr %index32, align 4, !tbaa !14
  %idxprom34 = zext i32 %29 to i64
  %arrayidx35 = getelementptr inbounds [100 x ptr], ptr %hash_table, i64 0, i64 %idxprom34
  %30 = load ptr, ptr %arrayidx35, align 8, !tbaa !5
  store ptr %30, ptr %current, align 8, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 8, ptr %prev) #10
  store ptr null, ptr %prev, align 8, !tbaa !5
  br label %while.cond36

while.cond36:                                     ; preds = %while.body44, %if.then29
  %31 = load ptr, ptr %current, align 8, !tbaa !5
  %cmp37 = icmp ne ptr %31, null
  br i1 %cmp37, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond36
  %32 = load ptr, ptr %current, align 8, !tbaa !5
  %word39 = getelementptr inbounds %struct.Node, ptr %32, i32 0, i32 0
  %33 = load ptr, ptr %word39, align 8, !tbaa !9
  %arraydecay40 = getelementptr inbounds [256 x i8], ptr %word, i64 0, i64 0
  %call41 = call i32 @strcmp(ptr noundef %33, ptr noundef %arraydecay40) #13
  %cmp42 = icmp ne i32 %call41, 0
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond36
  %34 = phi i1 [ false, %while.cond36 ], [ %cmp42, %land.rhs ]
  br i1 %34, label %while.body44, label %while.end

while.body44:                                     ; preds = %land.end
  %35 = load ptr, ptr %current, align 8, !tbaa !5
  store ptr %35, ptr %prev, align 8, !tbaa !5
  %36 = load ptr, ptr %current, align 8, !tbaa !5
  %next = getelementptr inbounds %struct.Node, ptr %36, i32 0, i32 2
  %37 = load ptr, ptr %next, align 8, !tbaa !13
  store ptr %37, ptr %current, align 8, !tbaa !5
  br label %while.cond36, !llvm.loop !21

while.end:                                        ; preds = %land.end
  %38 = load ptr, ptr %current, align 8, !tbaa !5
  %cmp45 = icmp eq ptr %38, null
  br i1 %cmp45, label %if.then47, label %if.else58

if.then47:                                        ; preds = %while.end
  call void @llvm.lifetime.start.p0(i64 8, ptr %new_node) #10
  %arraydecay48 = getelementptr inbounds [256 x i8], ptr %word, i64 0, i64 0
  %call49 = call ptr @create_node(ptr noundef %arraydecay48)
  store ptr %call49, ptr %new_node, align 8, !tbaa !5
  %39 = load ptr, ptr %prev, align 8, !tbaa !5
  %cmp50 = icmp eq ptr %39, null
  br i1 %cmp50, label %if.then52, label %if.else55

if.then52:                                        ; preds = %if.then47
  %40 = load ptr, ptr %new_node, align 8, !tbaa !5
  %41 = load i32, ptr %index32, align 4, !tbaa !14
  %idxprom53 = zext i32 %41 to i64
  %arrayidx54 = getelementptr inbounds [100 x ptr], ptr %hash_table, i64 0, i64 %idxprom53
  store ptr %40, ptr %arrayidx54, align 8, !tbaa !5
  br label %if.end57

if.else55:                                        ; preds = %if.then47
  %42 = load ptr, ptr %new_node, align 8, !tbaa !5
  %43 = load ptr, ptr %prev, align 8, !tbaa !5
  %next56 = getelementptr inbounds %struct.Node, ptr %43, i32 0, i32 2
  store ptr %42, ptr %next56, align 8, !tbaa !13
  br label %if.end57

if.end57:                                         ; preds = %if.else55, %if.then52
  call void @llvm.lifetime.end.p0(i64 8, ptr %new_node) #10
  br label %if.end60

if.else58:                                        ; preds = %while.end
  %44 = load ptr, ptr %current, align 8, !tbaa !5
  %count = getelementptr inbounds %struct.Node, ptr %44, i32 0, i32 1
  %45 = load i32, ptr %count, align 8, !tbaa !12
  %inc59 = add nsw i32 %45, 1
  store i32 %inc59, ptr %count, align 8, !tbaa !12
  br label %if.end60

if.end60:                                         ; preds = %if.else58, %if.end57
  store i32 0, ptr %index32, align 4, !tbaa !14
  call void @llvm.lifetime.end.p0(i64 8, ptr %prev) #10
  call void @llvm.lifetime.end.p0(i64 8, ptr %current) #10
  call void @llvm.lifetime.end.p0(i64 4, ptr %index32) #10
  br label %if.end61

if.end61:                                         ; preds = %if.end60, %if.else26
  br label %if.end62

if.end62:                                         ; preds = %if.end61, %if.end22
  br label %while.cond, !llvm.loop !22

while.end63:                                      ; preds = %while.cond
  %46 = load i32, ptr %index, align 4, !tbaa !14
  %cmp64 = icmp sgt i32 %46, 0
  br i1 %cmp64, label %if.then66, label %if.end107

if.then66:                                        ; preds = %while.end63
  %47 = load i32, ptr %index, align 4, !tbaa !14
  %idxprom67 = sext i32 %47 to i64
  %arrayidx68 = getelementptr inbounds [256 x i8], ptr %word, i64 0, i64 %idxprom67
  store i8 0, ptr %arrayidx68, align 1, !tbaa !15
  call void @llvm.lifetime.start.p0(i64 4, ptr %index69) #10
  %arraydecay70 = getelementptr inbounds [256 x i8], ptr %word, i64 0, i64 0
  %call71 = call i32 @hash(ptr noundef %arraydecay70)
  store i32 %call71, ptr %index69, align 4, !tbaa !14
  call void @llvm.lifetime.start.p0(i64 8, ptr %current72) #10
  %48 = load i32, ptr %index69, align 4, !tbaa !14
  %idxprom73 = zext i32 %48 to i64
  %arrayidx74 = getelementptr inbounds [100 x ptr], ptr %hash_table, i64 0, i64 %idxprom73
  %49 = load ptr, ptr %arrayidx74, align 8, !tbaa !5
  store ptr %49, ptr %current72, align 8, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 8, ptr %prev75) #10
  store ptr null, ptr %prev75, align 8, !tbaa !5
  br label %while.cond76

while.cond76:                                     ; preds = %while.body86, %if.then66
  %50 = load ptr, ptr %current72, align 8, !tbaa !5
  %cmp77 = icmp ne ptr %50, null
  br i1 %cmp77, label %land.rhs79, label %land.end85

land.rhs79:                                       ; preds = %while.cond76
  %51 = load ptr, ptr %current72, align 8, !tbaa !5
  %word80 = getelementptr inbounds %struct.Node, ptr %51, i32 0, i32 0
  %52 = load ptr, ptr %word80, align 8, !tbaa !9
  %arraydecay81 = getelementptr inbounds [256 x i8], ptr %word, i64 0, i64 0
  %call82 = call i32 @strcmp(ptr noundef %52, ptr noundef %arraydecay81) #13
  %cmp83 = icmp ne i32 %call82, 0
  br label %land.end85

land.end85:                                       ; preds = %land.rhs79, %while.cond76
  %53 = phi i1 [ false, %while.cond76 ], [ %cmp83, %land.rhs79 ]
  br i1 %53, label %while.body86, label %while.end88

while.body86:                                     ; preds = %land.end85
  %54 = load ptr, ptr %current72, align 8, !tbaa !5
  store ptr %54, ptr %prev75, align 8, !tbaa !5
  %55 = load ptr, ptr %current72, align 8, !tbaa !5
  %next87 = getelementptr inbounds %struct.Node, ptr %55, i32 0, i32 2
  %56 = load ptr, ptr %next87, align 8, !tbaa !13
  store ptr %56, ptr %current72, align 8, !tbaa !5
  br label %while.cond76, !llvm.loop !23

while.end88:                                      ; preds = %land.end85
  %57 = load ptr, ptr %current72, align 8, !tbaa !5
  %cmp89 = icmp eq ptr %57, null
  br i1 %cmp89, label %if.then91, label %if.else103

if.then91:                                        ; preds = %while.end88
  call void @llvm.lifetime.start.p0(i64 8, ptr %new_node92) #10
  %arraydecay93 = getelementptr inbounds [256 x i8], ptr %word, i64 0, i64 0
  %call94 = call ptr @create_node(ptr noundef %arraydecay93)
  store ptr %call94, ptr %new_node92, align 8, !tbaa !5
  %58 = load ptr, ptr %prev75, align 8, !tbaa !5
  %cmp95 = icmp eq ptr %58, null
  br i1 %cmp95, label %if.then97, label %if.else100

if.then97:                                        ; preds = %if.then91
  %59 = load ptr, ptr %new_node92, align 8, !tbaa !5
  %60 = load i32, ptr %index69, align 4, !tbaa !14
  %idxprom98 = zext i32 %60 to i64
  %arrayidx99 = getelementptr inbounds [100 x ptr], ptr %hash_table, i64 0, i64 %idxprom98
  store ptr %59, ptr %arrayidx99, align 8, !tbaa !5
  br label %if.end102

if.else100:                                       ; preds = %if.then91
  %61 = load ptr, ptr %new_node92, align 8, !tbaa !5
  %62 = load ptr, ptr %prev75, align 8, !tbaa !5
  %next101 = getelementptr inbounds %struct.Node, ptr %62, i32 0, i32 2
  store ptr %61, ptr %next101, align 8, !tbaa !13
  br label %if.end102

if.end102:                                        ; preds = %if.else100, %if.then97
  call void @llvm.lifetime.end.p0(i64 8, ptr %new_node92) #10
  br label %if.end106

if.else103:                                       ; preds = %while.end88
  %63 = load ptr, ptr %current72, align 8, !tbaa !5
  %count104 = getelementptr inbounds %struct.Node, ptr %63, i32 0, i32 1
  %64 = load i32, ptr %count104, align 8, !tbaa !12
  %inc105 = add nsw i32 %64, 1
  store i32 %inc105, ptr %count104, align 8, !tbaa !12
  br label %if.end106

if.end106:                                        ; preds = %if.else103, %if.end102
  call void @llvm.lifetime.end.p0(i64 8, ptr %prev75) #10
  call void @llvm.lifetime.end.p0(i64 8, ptr %current72) #10
  call void @llvm.lifetime.end.p0(i64 4, ptr %index69) #10
  br label %if.end107

if.end107:                                        ; preds = %if.end106, %while.end63
  call void @llvm.lifetime.start.p0(i64 4, ptr %i) #10
  store i32 0, ptr %i, align 4, !tbaa !14
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end107
  %65 = load i32, ptr %i, align 4, !tbaa !14
  %cmp108 = icmp slt i32 %65, 100
  br i1 %cmp108, label %for.body, label %for.cond.cleanup

for.cond.cleanup:                                 ; preds = %for.cond
  store i32 8, ptr %cleanup.dest.slot, align 4
  call void @llvm.lifetime.end.p0(i64 4, ptr %i) #10
  br label %for.end

for.body:                                         ; preds = %for.cond
  call void @llvm.lifetime.start.p0(i64 8, ptr %current110) #10
  %66 = load i32, ptr %i, align 4, !tbaa !14
  %idxprom111 = sext i32 %66 to i64
  %arrayidx112 = getelementptr inbounds [100 x ptr], ptr %hash_table, i64 0, i64 %idxprom111
  %67 = load ptr, ptr %arrayidx112, align 8, !tbaa !5
  store ptr %67, ptr %current110, align 8, !tbaa !5
  br label %while.cond113

while.cond113:                                    ; preds = %while.body116, %for.body
  %68 = load ptr, ptr %current110, align 8, !tbaa !5
  %cmp114 = icmp ne ptr %68, null
  br i1 %cmp114, label %while.body116, label %while.end121

while.body116:                                    ; preds = %while.cond113
  %69 = load ptr, ptr %current110, align 8, !tbaa !5
  %word117 = getelementptr inbounds %struct.Node, ptr %69, i32 0, i32 0
  %70 = load ptr, ptr %word117, align 8, !tbaa !9
  %71 = load ptr, ptr %current110, align 8, !tbaa !5
  %count118 = getelementptr inbounds %struct.Node, ptr %71, i32 0, i32 1
  %72 = load i32, ptr %count118, align 8, !tbaa !12
  %call119 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %70, i32 noundef %72)
  %73 = load ptr, ptr %current110, align 8, !tbaa !5
  %next120 = getelementptr inbounds %struct.Node, ptr %73, i32 0, i32 2
  %74 = load ptr, ptr %next120, align 8, !tbaa !13
  store ptr %74, ptr %current110, align 8, !tbaa !5
  br label %while.cond113, !llvm.loop !24

while.end121:                                     ; preds = %while.cond113
  call void @llvm.lifetime.end.p0(i64 8, ptr %current110) #10
  br label %for.inc

for.inc:                                          ; preds = %while.end121
  %75 = load i32, ptr %i, align 4, !tbaa !14
  %inc122 = add nsw i32 %75, 1
  store i32 %inc122, ptr %i, align 4, !tbaa !14
  br label %for.cond, !llvm.loop !25

for.end:                                          ; preds = %for.cond.cleanup
  call void @llvm.lifetime.start.p0(i64 4, ptr %i123) #10
  store i32 0, ptr %i123, align 4, !tbaa !14
  br label %for.cond124

for.cond124:                                      ; preds = %for.inc139, %for.end
  %76 = load i32, ptr %i123, align 4, !tbaa !14
  %cmp125 = icmp slt i32 %76, 100
  br i1 %cmp125, label %for.body128, label %for.cond.cleanup127

for.cond.cleanup127:                              ; preds = %for.cond124
  store i32 13, ptr %cleanup.dest.slot, align 4
  call void @llvm.lifetime.end.p0(i64 4, ptr %i123) #10
  br label %for.end141

for.body128:                                      ; preds = %for.cond124
  call void @llvm.lifetime.start.p0(i64 8, ptr %current129) #10
  %77 = load i32, ptr %i123, align 4, !tbaa !14
  %idxprom130 = sext i32 %77 to i64
  %arrayidx131 = getelementptr inbounds [100 x ptr], ptr %hash_table, i64 0, i64 %idxprom130
  %78 = load ptr, ptr %arrayidx131, align 8, !tbaa !5
  store ptr %78, ptr %current129, align 8, !tbaa !5
  br label %while.cond132

while.cond132:                                    ; preds = %while.body135, %for.body128
  %79 = load ptr, ptr %current129, align 8, !tbaa !5
  %cmp133 = icmp ne ptr %79, null
  br i1 %cmp133, label %while.body135, label %while.end138

while.body135:                                    ; preds = %while.cond132
  call void @llvm.lifetime.start.p0(i64 8, ptr %temp) #10
  %80 = load ptr, ptr %current129, align 8, !tbaa !5
  store ptr %80, ptr %temp, align 8, !tbaa !5
  %81 = load ptr, ptr %current129, align 8, !tbaa !5
  %next136 = getelementptr inbounds %struct.Node, ptr %81, i32 0, i32 2
  %82 = load ptr, ptr %next136, align 8, !tbaa !13
  store ptr %82, ptr %current129, align 8, !tbaa !5
  %83 = load ptr, ptr %temp, align 8, !tbaa !5
  %word137 = getelementptr inbounds %struct.Node, ptr %83, i32 0, i32 0
  %84 = load ptr, ptr %word137, align 8, !tbaa !9
  call void @free(ptr noundef %84) #10
  %85 = load ptr, ptr %temp, align 8, !tbaa !5
  call void @free(ptr noundef %85) #10
  call void @llvm.lifetime.end.p0(i64 8, ptr %temp) #10
  br label %while.cond132, !llvm.loop !26

while.end138:                                     ; preds = %while.cond132
  call void @llvm.lifetime.end.p0(i64 8, ptr %current129) #10
  br label %for.inc139

for.inc139:                                       ; preds = %while.end138
  %86 = load i32, ptr %i123, align 4, !tbaa !14
  %inc140 = add nsw i32 %86, 1
  store i32 %inc140, ptr %i123, align 4, !tbaa !14
  br label %for.cond124, !llvm.loop !27

for.end141:                                       ; preds = %for.cond.cleanup127
  %87 = load ptr, ptr %file, align 8, !tbaa !5
  %call142 = call i32 @fclose(ptr noundef %87)
  store i32 0, ptr %retval, align 4
  store i32 1, ptr %cleanup.dest.slot, align 4
  call void @llvm.lifetime.end.p0(i64 4, ptr %c) #10
  call void @llvm.lifetime.end.p0(i64 4, ptr %index) #10
  call void @llvm.lifetime.end.p0(i64 256, ptr %word) #10
  call void @llvm.lifetime.end.p0(i64 800, ptr %hash_table) #10
  br label %cleanup

cleanup:                                          ; preds = %for.end141, %if.then3
  call void @llvm.lifetime.end.p0(i64 8, ptr %file) #10
  br label %return

return:                                           ; preds = %cleanup, %if.then
  %88 = load i32, ptr %retval, align 4
  ret i32 %88
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
  %__c.addr = alloca i32, align 4
  store i32 %__c, ptr %__c.addr, align 4, !tbaa !14
  %0 = load i32, ptr %__c.addr, align 4, !tbaa !14
  %cmp = icmp sge i32 %0, -128
  br i1 %cmp, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, ptr %__c.addr, align 4, !tbaa !14
  %cmp1 = icmp slt i32 %1, 256
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true
  %call = call ptr @__ctype_tolower_loc() #12
  %2 = load ptr, ptr %call, align 8, !tbaa !5
  %3 = load i32, ptr %__c.addr, align 4, !tbaa !14
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds i32, ptr %2, i64 %idxprom
  %4 = load i32, ptr %arrayidx, align 4, !tbaa !14
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %entry
  %5 = load i32, ptr %__c.addr, align 4, !tbaa !14
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %4, %cond.true ], [ %5, %cond.false ]
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
attributes #10 = { nounwind }
attributes #11 = { nounwind allocsize(0) }
attributes #12 = { nounwind willreturn memory(none) }
attributes #13 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 17.0.6 (++20231209124227+6009708b4367-1~exp1~20231209124336.77)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !6, i64 0}
!10 = !{!"Node", !6, i64 0, !11, i64 8, !6, i64 16}
!11 = !{!"int", !7, i64 0}
!12 = !{!10, !11, i64 8}
!13 = !{!10, !6, i64 16}
!14 = !{!11, !11, i64 0}
!15 = !{!7, !7, i64 0}
!16 = distinct !{!16, !17, !18}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!"llvm.loop.unroll.disable"}
!19 = !{!20, !20, i64 0}
!20 = !{!"short", !7, i64 0}
!21 = distinct !{!21, !17, !18}
!22 = distinct !{!22, !17, !18}
!23 = distinct !{!23, !17, !18}
!24 = distinct !{!24, !17, !18}
!25 = distinct !{!25, !17, !18}
!26 = distinct !{!26, !17, !18}
!27 = distinct !{!27, !17, !18}
