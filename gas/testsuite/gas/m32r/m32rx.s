# Test new instructions
branchpoint:
	
	.text
	.global bcl
bcl:
	bcl branchpoint

	.text
	.global bncl
bncl:
	bncl branchpoint

	.text
	.global cmpz
cmpz:
	cmpz fp

	.text
	.global cmpeq
cmpeq:
	cmpeq fp, fp

	.text
	.global machl1
machl1:
	machl1 fp, fp
	
	.text
	.global macsl0
msblo:
	msblo fp, fp
	
	.text
	.global mulwu1
mulwu1:
	mulwu1 fp, fp
	
	.text
	.global macwu1
macwu1:
	macwu1 fp, fp
	
	.text
	.global sadd
sadd:
	sadd
	
	.text
	.global satb
satb:
	satb fp, fp

	
	.text
	.global mulhi
mulhi:
	mulhi fp, fp, a1
	
	.text
	.global mullo
mullo:
	mullo fp, fp, a0
	
	.text
	.global mulwhi
mulwhi:
	mulwhi fp, fp, a1
	
	.text
	.global mulwlo
mulwlo:
	mulwlo fp, fp, a0
	
	.text
	.global machi
machi:
	machi fp, fp, a1
	
	.text
	.global maclo
maclo:
	maclo fp, fp, a0
	
	.text
	.global macwhi
macwhi:
	macwhi fp, fp, a1
	
	.text
	.global macwlo
macwlo:
	macwlo fp, fp, a0
	
	.text
	.global mvfachi
mvfachi:
	mvfachi fp, a1
	
	.text
	.global mvfacmi
mvfacmi:
	mvfacmi fp, a1
	
	.text
	.global mvfaclo
mvfaclo:
	mvfaclo fp, a0
	
	.text
	.global mvtachi
mvtachi:
	mvtachi fp, a1
	
	.text
	.global mvtaclo
mvtaclo:
	mvtaclo fp, a0
	
	.text
	.global rac
rac:
	rac a1
	
	.text
	.global rach
rach:
	rach a1
	
# Test explicitly parallel and implicitly parallel instructions
# Including apparent instruction sequence reordering.
	.text
	.global bc__add
bc__add:
	bc branchpoint || add fp, fp
	bc branchpoint
	add fp, fp

	.text
	.global bcl__addi
bcl__addi:	
	bcl branchpoint || addi fp, #77
	addi fp, #77
	bcl branchpoint

	.text
	.global bl__addv
bl__addv:
	bl branchpoint || addv fp, fp
	addv fp, fp
	bl branchpoint
	
	.text
	.global bnc__addx
bnc__addx:
	bnc branchpoint || addx fp, fp
	bnc branchpoint
	addx fp, fp

	.text
	.global bncl__and
bncl__and:
	bncl branchpoint || and fp, fp
	bncl branchpoint
	and fp, fp

	.text
	.global bra__cmp
bra__cmp:
	bra branchpoint || cmp fp, fp
	cmp fp, fp
	bra branchpoint
	
	.text
	.global jl__cmpeq
jl__cmpeq:
	jl fp || cmpeq fp, fp
	cmpeq fp, fp
	jl fp
	
	.text
	.global jmp__cmpu
jmp__cmpu:
	jmp fp || cmpu fp, fp
	cmpu fp, fp
	jmp fp
	
	.text
	.global ld__cmpz
ld__cmpz:
	ld fp, @fp || cmpz r1
	cmpz r1
	ld fp, @fp 
	
	.text
	.global ld__ldi
ld__ldi:
	ld fp, @r1+ || ldi r2, #77
	ld fp, @r1+ 
	ldi r2, #77
	
	.text
	.global ldb__mv
ldb__mv:
	ldb fp, @fp || mv r2, fp
	ldb fp, @fp 
	mv r2, fp

	.text
	.global ldh__neg
ldh__neg:
	ldh fp, @fp || neg r2, fp
	ldh fp, @fp
	neg r2, fp

	.text
	.global ldub__nop
ldub__nop:
	ldub fp, @fp || nop
	ldub fp, @fp 
	nop

	.text
	.global lduh__not
lduh__not:
	lduh fp, @fp || not r2, fp
	lduh fp, @fp
	not r2, fp

	.text
	.global lock__or
lock__or:
	lock fp, @fp || or r2, fp
	lock fp, @fp
	or r2, fp

	.text
	.global mvfc__sub
mvfc__sub:
	mvfc fp, cr1 || sub r2, fp
	mvfc fp, cr1
	sub r2, fp

	.text
	.global mvtc__subv
mvtc__subv:
	mvtc fp, cr0 || subv r2, fp
	mvtc fp, cr0
	subv r2, fp

	.text
	.global rte__subx
rte__subx:
	rte || subx r2, fp
	rte
	subx r2, fp

	.text
	.global sll__xor
sll__xor:
	sll fp, r1 || xor r2, fp
	sll fp, r1
	xor r2, fp

	.text
	.global slli__machi
slli__machi:
	slli fp, #22 || machi r2, fp
	slli fp, #22
	machi r2, fp

	.text
	.global sra__machl1
sra__machl1:
	sra fp, fp || machl1 r2, fp
	sra fp, fp
	machl1 r2, fp

	.text
	.global srai__maclo
srai__maclo:
	srai fp, #22 || maclo r2, fp
	srai fp, #22
	maclo r2, fp

	.text
	.global srl__macwhi
srl__macwhi:
	srl fp, fp || macwhi r2, fp
	srl fp, fp
	macwhi r2, fp

	.text
	.global srli__macwlo
srli__macwlo:
	srli fp, #22 || macwlo r2, fp
	srli fp, #22
	macwlo r2, fp
	
	.text
	.global st__macwu1
st__macwu1:
	st fp, @fp || macwu1 r2, fp
	st fp, @fp
	macwu1 r2, fp

	.text
	.global st__msblo
st__msblo:
	st fp, @+fp || msblo r2, fp
	st fp, @+fp 
	msblo r2, fp

	.text
	.global st__mul
st__mul:
	st fp, @-fp || mul r2, fp
	st fp, @-fp
	mul r2, fp

	.text
	.global stb__mulhi
stb__mulhi:
	stb fp, @fp || mulhi r2, fp
	stb fp, @fp
	mulhi r2, fp
	
	.text
	.global sth__mullo
sth__mullo:
	sth fp, @fp || mullo r2, fp
	sth fp, @fp 
	mullo r2, fp

	.text
	.global trap__mulwhi
trap__mulwhi:
	trap 2 || mulwhi r2, fp
	trap 2
	mulwhi r2, fp

	.text
	.global unlock__mulwlo
unlock__mulwlo:
	unlock fp, @fp || mulwlo r2, fp
	unlock fp, @fp
	mulwlo r2, fp

	.text
	.global add__mulwu1
add__mulwu1:
	add fp, fp || mulwu1 r2, fp
	add fp, fp
	mulwu1 r2, fp

	.text
	.global addi__mvfachi
addi__mvfachi:
	addi fp, #77 || mvfachi r2, a0
	addi fp, #77
	mvfachi r2, a0

	.text
	.global addv__mvfaclo
addv__mvfaclo:
	addv fp, fp || mvfaclo r2, a1
	addv fp, fp
	mvfaclo r2, a1

	.text
	.global addx__mvfacmi
addx__mvfacmi:
	addx fp, fp || mvfacmi r2, a0
	addx fp, fp
	mvfacmi r2, a0

	.text
	.global and__mvtachi
and__mvtachi:
	and fp, fp || mvtachi r2, a0
	and fp, fp
	mvtachi r2, a0
	
	.text
	.global cmp__mvtaclo
cmp__mvtaclo:
	cmp fp, fp || mvtaclo r2, a0
	cmp fp, fp
	mvtaclo r2, a0

	.text
	.global cmpeq__rac
cmpeq__rac:
	cmpeq fp, fp || rac a1
	cmpeq fp, fp
	rac a1

	.text
	.global cmpu__rach
cmpu__rach:
	cmpu fp, fp || rach a0
	cmpu fp, fp
	rach a0

	.text
	.global cmpz__sadd
cmpz__sadd:
	cmpz fp || sadd
	cmpz fp
	sadd


	
# Test private instructions	
	.text
	.global sc
sc:
	sc
	sadd
	
	.text
	.global snc
snc:
	snc
	sadd 
	
	.text
	.global jc
jc:
	jc fp
	
	.text
	.global jnc
jnc:
	jnc fp
		
	.text
	.global pcmpbz
pcmpbz:
	pcmpbz fp
	
	.text
	.global sat
sat:
	sat fp, fp
	
	.text
	.global sath
sath:
	sath fp, fp 


# Test parallel versions of the private instructions
	
	.text
	.global jc__pcmpbz
jc__pcmpbz:
	jc fp || pcmpbz fp
	jc fp 
	pcmpbz fp
	
	.text
	.global jnc__ldi
jnc__ldi:
	jnc fp || ldi fp, #77
	jnc fp
	ldi fp, #77
	
	.text
	.global sc__mv
sc__mv:
	sc || mv fp, r2
	sc 
	mv fp, r2

	.text
	.global snc__neg
snc__neg:
	snc || neg fp, r2
	snc 
	neg fp, r2
	
	
	

	