[Remap]
x = x      ;Ｘボタンの入力判定を実際に押すボタンに割り当てる。
y = y      ;Ｙボタン　　　　　　　　　〃
z = z      ;Ｚボタン　　　　　　　　　〃
a = a      ;Ａボタン　　　　　　　　　〃
b = b      ;Ｂボタン　　　　　　　　　〃
c = c      ;Ｃボタン　　　　　　　　　〃
s = s      ;スタートボタン　　　　　　〃

;-| 超必殺技 |-----------------------------------------------------------------
[Command]
name = "6246aa"
command = ~D, B, F, x+y
time = 20
[Command]
name = "6246aa"
command = ~D, B, F, x+z
time = 20
[Command]
name = "6246aa"
command = ~D, B, F, y+z
time = 20

[Command]
name = "236aa"
command = ~D,DF,F,x+y
time = 16
[Command]
name = "236aa"
command = ~D,DF,F,y+z
time = 16
[Command]
name = "236aa"
command = ~D,DF,F,x+z
time = 16
[Command]
name = "236b"
command = ~D,DF,F,b
time = 16

[Command]
name = "214aa"
command = ~D,DB,B,x+y
time = 16
[Command]
name = "214aa"
command = ~D,DB,B,y+z
time = 16
[Command]
name = "214aa"
command = ~D,DB,B,x+z
time = 16
[Command]
name = "214b"
command = ~D,DB,B,b
time = 16

;-| 必殺技 |-------------------------------------------------------------------
[Command]
name = "41236x"
command = ~B,D,F,x
time = 22
[Command]
name = "41236y"
command = ~B,D,F,y
time = 22
[Command]
name = "41236z"
command = ~B,D,F,z
time = 22

[Command]
name = "214x"
command = ~D,DB,B,x
time = 12
[Command]
name = "214x"
command = ~D,DB,B,~x
time = 12

[Command]
name = "214y"
command = ~D,DB,B,y
time = 12
[Command]
name = "214y"
command = ~D,DB,B,~y
time = 12

[Command]
name = "214z"
command = ~D,DB,B,z
time = 12
[Command]
name = "214z"
command = ~D,DB,B,~z
time = 12

[Command]
name = "236b"
command = ~D,DF,F,b
time = 12
[Command]
name = "236b"
command = ~D,DF,F,~b
time = 12

[Command]
name = "214b"
command = ~D,DB,B,b
time = 12
[Command]
name = "214b"
command = ~D,DB,B,~b
time = 12

[Command]
name = "22x"
command = ~D, D, x
time = 15
[Command]
name = "22y"
command = ~D, D, y
time = 15
[Command]
name = "22z"
command = ~D, D, z
time = 15

[Command]
name = "ExJump"
command = D, U
time = 15

;------------------------------------------------------------------------------
;-| キー２回連続入力 |---------------------------------------------------------

[Command]
name = "FF"       ;必須コマンド名
command = F, F
time = 10

[Command]
name = "BB"       ;必須コマンド名
command = B, B
time = 10

;------------------------------------------------------------------------------
;-| 同時押し |-----------------------------------------------------------------

[Command]
name = "recovery" ;必須コマンド名
command = a+b
time = 1

[Command]
name = "recovery" ;必須コマンド名
command = x+y
time = 1

[Command]
name = "AirDush" ;必須コマンド名
command = x+y
time = 1
[Command]
name = "AirDush" ;必須コマンド名
command = y+z
time = 1
[Command]
name = "AirDush" ;必須コマンド名
command = x+z
time = 1

;------------------------------------------------------------------------------
;-| 方向キー＋ボタン |---------------------------------------------------------

[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;------------------------------------------------------------------------------

[Command]
name = "holdx"	   ;必須コマンド名
command = /x
time = 1

[Command]
name = "holdy"	   ;必須コマンド名
command = /y
time = 1

[Command]
name = "holdz"	   ;必須コマンド名
command = /z
time = 1

[Command]
name = "holda"	   ;必須コマンド名
command = /a
time = 1

[Command]
name = "holdb"	   ;必須コマンド名
command = /b
time = 1

[Command]
name = "holds"
command = /s
time = 1

;------------------------------------------------------------------------------
;-| ボタン単発 |---------------------------------------------------------------

[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;------------------------------------------------------------------------------
;-| 方向キー |-----------------------------------------------------------------

[Command]
name = "holdfwd"   ;必須コマンド名
command = /$F
time = 1

[Command]
name = "holdback"  ;必須コマンド名
command = /$B
time = 1

[Command]
name = "holdup"    ;必須コマンド名
command = /$U
time = 1

[Command]
name = "holddown"  ;必須コマンド名
command = /$D
time = 1

[Statedef -1] ;←この行は絶対に消さないでね。必須項目です。

;==============================================================================
;こっからCPU

;重力及び摩擦係数の変数代入記述
[State ]
type = null
triggerall = AILevel

;重力代入（通常時）
trigger1 = Enemynear(var(48)),StateType = A
trigger1 = P2Movetype != H 
Trigger1 = fvar(30) := Enemynear(var(48)),const(movement.yaccel)

;重力代入（ヒット中）
trigger2 = P2Movetype = H
trigger2 = Enemynear(var(48)),StateType = A
trigger2 = fvar(30) := ifelse(Enemynear(var(48)),GetHitVar(yaccel) = 0, .45, EnemyNear(var(48)),GetHitVar(yaccel))

;AI判別
[State -1, end]
type = varset
trigger1 = AILevel
var(59) = enemynear(var(48)),AILevel > 0

[State -1, end]
type = varset
trigger1 = AILevel
var(21) = (ctrl ||stateno = 11 || stateno = 21 || (stateno = 52 && time >= 3 && !var(8)) || (stateno = [120,149]) || (stateno = 100 && animelemtime(2)>=0) || (stateno = 1230 && animelemtime(3) >= 5) || (stateno = 2050 && time >= 24))

[State -1, end]
type = turn
triggerall = AILevel
trigger1 = statetype != A
trigger1 = p2dist x < -20
trigger1 = var(21)

;GHA
[State -1, 1000]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = power >= 3000

trigger1 = var(21)
trigger1 = P2StateType = A
trigger1 = (P2MoveType = A)
trigger1 = P2bodydist X < 95
trigger1 = P2bodydist Y = [-120,-40]
trigger1 = Random < 30 + (var(59)>0)*50
value = 3000

;236h
[State -1, 1000]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
triggerall = power >= 1000

triggerall = (p2statetype != L && p2stateno = 5120)
triggerall = p2bodydist x < 120
triggerall = p2bodydist y > -90
triggerall = (var(21))
triggerall = var(58) = 0
;超反
;;trigger1 = p2movetype != H
trigger1 = p2movetype != H
trigger1 = (var(59)=1)
trigger1 = Inguarddist && p2movetype = A
trigger1 = random < 40 + (enemynear(var(48)),animtime>=-7-1)*30 + (life < 200 && power = [1000, 2500])*50 + (p2life < 200)* 50
;重いとき
trigger2 = stateno=2000 && p2life < 200 && !(var(1)&2**0) && fvar(20) >= 3
trigger2 = movehit = 1
value = 3100

;214h
[State -1, 1000]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
triggerall = power >= 1000
triggerall = numhelper(3250) = 0

triggerall = (var(21))
trigger1 = p2bodydist x > 100
trigger1 = random < (TeamMode = Simul)*10 + (p2bodydist x > 180)* 5 + (power > 4000)*20 + (p2life < 150)*5
value = 3200

;強化
[state -1, set]
type = changestate
triggerall = AILevel && RoundState = 2
triggerall = statetype != A

triggerall = var(58) = 0
triggerall = var(1) != 7

triggerall = var(1) = 0 || random < (var(1)&2**0)*40 + (var(1)&2**2)*40 + (!(var(1)&2**0) && !(var(1)&2**2))*80
;相手跳ねてる
trigger1 = var(21) || (stateno = 2205 && var(4))
trigger1 = (p2stateno = [5114,5115]); && (p2bodydist x > 100 || enemynear(var(48)),vel y <= 0)
;ロケパン直後
trigger2 = stateno = 1000 && !animtime;var(21)
trigger2 = p2bodydist x > 110 || (p2statetype = L && p2bodydist x > 60)
trigger2 = numhelper(1005)
trigger2 = helper(1005),rootdist x > -120
;combo
trigger3 = stateno=2000 && !(p2life < 200 && power >= 1000) && !(p2life < 400 && power >= 3000)
trigger3 = movehit = 1
;投げ後
trigger4 = stateno=810 && time = 100
trigger4 = frontEdgeBodyDist > 90
;こいつ後
trigger5 = stateno=1210 && movehit && !animtime && p2statetype = A && p2movetype = H
trigger5 = frontEdgeBodyDist > 90
;236H後
trigger6 = stateno=52 && time = 3 && prevstateno = 3111
trigger6 = random %2 = 0
;
value = 1100

;KM Dush(こいつ)
[State -1, KM_Koitsu]
type = VarSet
triggerall = AILevel && roundstate = 2
triggerall = statetype != A

triggerall = (p2statetype != L || p2stateno = 5120)
triggerall = var(58) = 0
;N
trigger1 = (var(21)) || ((var(4) = [1, 2]) && moveguarded = 1 || stateno = 2205)
trigger1 = !inguarddist
trigger1 = p2bodydist x >= 70 || moveguarded
trigger1 = (p2statetype != A || p2bodydist y > -80)
trigger1 = p2stateno != [4400, 4500]
trigger1 = random < 35 + (moveguarded = 1 || stateno = 2205)*60
;combo
trigger2 = movehit = 1
trigger2 = stateno = 2000 && !(var(1)&2**0)
;break
trigger2 = var(4) = 5
trigger2 = stateno = 710
trigger2 = !(var(1)&2**0)
var(58) = 1210

[State -1, KM_kyori]
type = Varset
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
triggerall = var(58) = 0
;N
trigger1 = (var(21)) || ((var(4) = [1, 2]) && moveguarded = 1 || stateno = 2205)
trigger1 = !inguarddist
trigger1 = p2bodydist x >= 70 || moveguarded
trigger1 = backedgebodydist > 45
trigger1 = random < 8 + (moveguarded = 1 || stateno = 2205)*50
var(58) = 1220

[State -1, KM_mise]
type = Varset
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
triggerall = var(58) = 0
;N
trigger1 = (var(21)) || ((var(4) = [1, 2]) && moveguarded = 1 || stateno = 2205)
trigger1 = !inguarddist
trigger1 = p2bodydist x >= 70 || moveguarded
trigger1 = enemynear(var(48)),backedgebodydist > 80
trigger1 = random < 8 + (moveguarded = 1 || stateno = 2205)*50
var(58) = 1222

[State -1, KM_shunshin]
type = Null
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
;triggerall = (p2statetype != L || p2stateno = 5120)
triggerall = !inguarddist
triggerall = var(58) = 0
;目の前でA
trigger1 = (var(21)) || ((var(4) = [1, 2]) && moveguarded = 1 || stateno = 2205)
trigger1 = p2bodydist x >= 70 || moveguarded
trigger1 = random < 5 + (var(59) = 0) * 8 + (moveguarded = 1 || stateno = 2205)*18
trigger1 = var(58) := 1230
;遠目でB
trigger2 = (var(21)) || ((var(4) = [1, 2]) && moveguarded = 1 || stateno = 2205)
trigger2 = p2bodydist x >= 70 || moveguarded
trigger2 = random < 5 + (var(59) = 0) * 8 + (moveguarded = 1 || stateno = 2205)*24
trigger2 = var(58) := 1231
;目の前でB
trigger3 = (var(21)) || ((var(4) = [1, 2]) && moveguarded = 1 || stateno = 2205)
trigger3 = p2bodydist x >= 70 || moveguarded
trigger3 = enemynear(var(48)),backedgebodydist > 45
trigger3 = random < 5 + (var(59) = 0) * 12 + (moveguarded = 1 || stateno = 2205)*24
trigger3 = var(58) := 1236
;コーラ
trigger4 = (var(21)) || ((var(4) = [1, 2]) && moveguarded = 1 || stateno = 2205)
trigger4 = p2bodydist x >= 70 || moveguarded
trigger4 = random < 4 + (moveguarded = 1 || stateno = 2205)*10 - (var(59) = 1)*10
trigger4 = var(58) := 1232
;コーラ(近くで)
trigger5 = var(59) = 0
trigger5 = (var(21)) || ((var(4) = [1, 2]) && moveguarded = 1 || stateno = 2205)
trigger5 = p2bodydist x >= 70 || moveguarded
trigger5 = random < 4 + (moveguarded = 1 || stateno = 2205)*10
trigger5 = var(58) := 1237

[State -1, KM_zipperA]
type = Null
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
;triggerall = (p2statetype != L || p2stateno = 5120)
triggerall = var(58) = 0
trigger1 = (var(21)) || ((var(4) = [1, 2]) && moveguarded = 1 || stateno = 2205)
trigger1 = enemynear(var(48)),backedgebodydist > 30
trigger1 = !inguarddist
trigger1 = random < 10 + (numhelper(1005)) * 11 + (var(59) = 0 && p2bodydist x = [100, 140])* 18 + (moveguarded = 1 || stateno = 2205)*90
trigger1 = var(58) := 1240 + (p2dist x < 34 || random % 3 = 0) * 5

[State -1, KM_zipperB]
type = Null
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
;triggerall = (p2statetype != L || p2stateno = 5120)
triggerall = var(58) = 0
trigger1 = (var(21)) || ((var(4) = [1, 2]) && moveguarded = 1 || stateno = 2205)
trigger1 = !inguarddist
trigger1 = backedgebodydist < 20
trigger1 = random < 30 + (var(59) = 0) * 30 + (moveguarded = 1 || stateno = 2205)*50
trigger1 = var(58) := 1241


[State -1, arm]
type = ChangeState
value = 1000
triggerall = AILevel && RoundState = 2
triggerall = Statetype !=A
triggerall = NumHelper(1005) = 0

triggerall = var(58) = 0
;;trigger1 = p2movetype != H
trigger1 = (p2statetype != A || p2bodydist y > -100)
trigger1 = var(21) || ((var(4) = [1, 2]) && moveguarded = 1 || stateno = 2205)
trigger1 = p2bodydist x > 100 || p2statetype = L || moveguarded
trigger1 = random < 27 + (var(1)=0)*20 + (!(Var(1)&2**0))*10 + (!(Var(1)&2**2))*10 + (p2statetype = L)*20 + (moveguarded = 1) * (200 + (var(59))*100)

;5S
[State -1, 1200]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = statetype != A

triggerall = var(58) = 0
triggerall = (p2statetype != L)
trigger1 = var(21) || ((var(4) = [1, 3]) && moveguarded = 1)
trigger1 = (p2statetype != A || p2bodydist y > -90)
trigger1 = p2bodydist x < 180
trigger1 = !(inguarddist && p2bodydist x < 55)
trigger1 = random < 33 + (var(1)&2**0)* 23 + (p2bodydist x = [85, 130])*10 - (inguarddist)* 30
;繋ぎ
trigger2 = stateno=220 || stateno=420
trigger2 = movecontact = 1
trigger2 = movehit || (random %3 = 0)
;疾走拾い
trigger3 = (var(21))
trigger3 = p2movetype = H && p2statetype = A
trigger3 = p2bodydist x < 180
trigger3 = Enemynear(var(48)),Pos Y+Enemynear(var(48)),Vel Y * 21 + fvar(30) * 21 * (21 + 1) / 2 = [-40, 5]
value = 2000

;2S
[State -1, 1200]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = statetype != A

triggerall = var(58) = 0
triggerall = (p2statetype != L)
trigger1 = (var(21)) || ((var(4) = [1, 2]) && moveguarded = 1)
trigger1 = p2movetype != H
trigger1 = (p2statetype != A || p2bodydist y > -100)
trigger1 = p2bodydist x < 90
trigger1 = !(inguarddist && p2bodydist x < 30)
trigger1 = random < 15 + (var(1)&2**1)* 8 + (p2statetype = A)*20 + (var(1)&2**1 && moveguarded = 1)*60
value = 2100

[State -1, js]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = statetype = A

triggerall = var(58) = 0
triggerall = (p2statetype != L)
triggerall = statetype = A
triggerall = !var(8)
trigger1 = var(4) = 1 && moveguarded = 1
trigger1 = random %3 = 0
value = 2200

[State -1, assault]
type = ChangeState
value = 700
triggerall = AILevel && RoundState = 2
triggerall = statetype != A
triggerall = p2statetype != L

triggerall = var(58) = 0
trigger1 = (var(21)) || ((var(4) = [1, 3]) && moveguarded = 1)
trigger1 = (p2statetype != A)
trigger1 = p2bodydist x = [-5, 140]
trigger1 = random < 15 + (p2bodydist x = [60, 140]) * 5 + (var(59)=0) * 9 + (moveguarded = 1)*70
trigger2 = stateno = 710 && (var(4) = 5 || var(4) = 80)
trigger2 = power >= 1000

[State -1, break]
type = ChangeState
value = 710
triggerall = AILevel && RoundState = 2
triggerall = statetype != A
triggerall = p2statetype != L

triggerall = var(58) = 0
trigger1 = (var(21)) || ((var(4) = [1, 3]) && moveguarded = 1)
trigger1 = (p2statetype != A)
trigger1 = !inguarddist
trigger1 = p2bodydist x = [-5, 80]
trigger1 = random < 15 + (power >= 1000)* 34 + (moveguarded = 1)*100

;投げ
[State -1, 1000]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = roundstate = 2
triggerall = statetype != A

triggerall = var(58) = 0
trigger1 = (var(21))
trigger1 = p2movetype != H
trigger1 = p2statetype != A && p2statetype != L
trigger1 = random < 100 + (var(59)=1)*150
trigger1 = p2bodydist x < 20
value = 800

[State -1, 5a]
type = ChangeState
value = 200
triggerall = AILevel && roundstate = 2
triggerall = statetype != A

triggerall = var(58) = 0
triggerall = p2statetype != L
trigger1 = (var(21))
Trigger1 = !(inguarddist && var(59)=1)
Trigger1 = p2statetype != A
;;trigger1 = p2movetype != H
trigger1 = random < 30 + (p2movetype = H)*100
trigger1 = p2bodydist x = [-5, 55]
;拾い
trigger2 = (var(21))
trigger2 = p2movetype = H && p2statetype = A
trigger2 = p2bodydist x < 50
trigger2 = Enemynear(var(48)),Pos Y+Enemynear(var(48)),Vel Y * 5 + fvar(30) * 5 * (5 + 1) / 2 = [-60, 5]
trigger2 = random < 100
;
trigger3 = (var(21))
trigger3 = p2movetype = H
trigger3 = (p2statetype != A)
trigger3 = enemynear(var(48)),gethitvar(hittime) > 5
trigger3 = random < 200 || enemynear(var(48)),gethitvar(hittime) = 6
trigger3 = p2bodydist x = [-5, 55]
;後スキ狙い
trigger4 = (var(21))
trigger4 = (p2statetype != A)
trigger4 = p2movetype != H
trigger4 = p2bodydist x = [-5, 55]
trigger4 = helper(50000),var(15) = 2 && helper(50000),var(16) = p2stateno
trigger4 = enemynear(var(48)),animtime <= -6;(発生+1)

[State -1, 5b]
type = ChangeState
value = 210
triggerall = AILevel && roundstate = 2
triggerall = statetype != A

triggerall = var(58) = 0
triggerall = p2statetype != L
triggerall = (p2statetype != A || p2bodydist y > -40)
;後スキ狙い
trigger1 = (var(21))
trigger1 = (p2statetype != A)
trigger1 = p2movetype != H
trigger1 = p2bodydist x = [-5, 45]
trigger1 = enemynear(var(48)),animtime>=-8-1
trigger1 = random < 200
;
trigger2 = (var(21))
trigger2 = (p2statetype != A)
trigger2 = p2movetype = H
trigger2 = enemynear(var(48)),gethitvar(hittime) > 8
trigger2 = p2bodydist x = [-5, 60]
trigger2 = random < 200
;combo
trigger3 = movecontact = 1
trigger3 = (stateno = 200 || stateno = 400) && var(4)
trigger3 = random%3 = 0 || p2bodydist x < 40

[State -1, 5b]
type = ChangeState
value = 215
triggerall = AILevel && roundstate = 2
triggerall = statetype != A

triggerall = var(58) = 0
triggerall = p2statetype != L

trigger1 = (var(21))
trigger1 = (p2statetype != A)
Trigger1 = !(inguarddist && var(59)=1)
;;trigger1 = p2movetype != H
trigger1 = random < 20 + (p2movetype = H)*100
trigger1 = p2bodydist x = [-5, 55]
;拾い
trigger2 = (var(21))
trigger2 = p2movetype = H && p2statetype = A
trigger2 = p2bodydist x < 45
trigger2 = Enemynear(var(48)),Pos Y+Enemynear(var(48)),Vel Y * 5 + fvar(30) * 5 * (5 + 1) / 2 = [-100, 5]
trigger2 = random < 100
;追撃
trigger3 = (var(21))
trigger3 = p2movetype = H
trigger3 = p2statetype != A
trigger3 = p2bodydist x = [-5, 44]
trigger3 = enemynear(var(48)),gethitvar(hittime) > 6
trigger3 = random < 200
;対空
trigger4 = (var(21))
trigger4 = p2movetype != H
trigger4 = p2statetype = A
trigger4 = p2bodydist x = [-5, 60]
trigger4 = Enemynear(var(48)),Pos Y+Enemynear(var(48)),Vel Y * 6 + fvar(30) * 6 * (6 + 1) / 2 >= -125
trigger4 = random < 30 + (var(59)=1) * 30

[State -1, 5c]
type = ChangeState
value = 220
triggerall = AILevel && roundstate = 2
triggerall = statetype != A

triggerall = var(58) = 0
triggerall = p2statetype != L
triggerall = (p2statetype != A || p2bodydist y > -70)
trigger1 = (var(21))
trigger1 = (p2statetype != A)
;;trigger1 = p2movetype != H
trigger1 = (var(59)=1)
trigger1 = random < 12 + (p2movetype = H)*60
trigger1 = p2bodydist x = [50, 80]
;combo
trigger2 = movecontact = 1
trigger2 = (stateno = 200 || stateno = 400 || stateno = 210 || stateno = 410) && var(4)

[State -1, 2a]
type = ChangeState
value = 400
triggerall = AILevel && roundstate = 2
triggerall = statetype != A

triggerall = var(58) = 0
triggerall = p2statetype != L
triggerall = p2statetype != A
trigger1 = (var(21))
;;trigger1 = p2movetype != H
trigger1 = p2bodydist x = [-5, 65]
trigger1 = random < 50 + (var(59)=0)*40
;
trigger2 = (var(21))
trigger2 = p2movetype = H
trigger2 = enemynear(var(48)),gethitvar(hittime) > 6
trigger2 = p2bodydist x = [-5, 65]
trigger2 = random < 200 || enemynear(var(48)),gethitvar(hittime) = 7
;後スキ狙い
trigger3 = (var(21))
trigger3 = p2movetype != H
trigger3 = p2bodydist x = [-5, 45]
Trigger3 = enemynear(var(48)),animtime>=-6-1
Trigger3 = random%3 = 0

[State -1, 屈c]
type = ChangeState
value = 410
triggerall = AILevel && roundstate = 2
triggerall = statetype != A

triggerall = var(58) = 0
triggerall = p2statetype != L
triggerall = p2statetype != A
Trigger1 = !(inguarddist && var(59)=1)
trigger1 = (var(21))
;;trigger1 = p2movetype != H
trigger1 = random < 15 + (var(59)=0)*20
trigger1 = p2bodydist x = [55, 80]

[State -1, 屈c]
type = ChangeState
value = 420
triggerall = AILevel && roundstate = 2
triggerall = statetype != A

triggerall = var(58) = 0
triggerall = p2statetype != L
triggerall = p2statetype != A
trigger1 = (var(21))
;;trigger1 = p2movetype != H
trigger1 = random < 33 + (var(59)=0)*20
trigger1 = p2bodydist x = [45, 125]

[State -1, jb]
type = ChangeState
value = 600
triggerall = AILevel && roundstate = 2
triggerall = statetype = A

triggerall = var(58) = 0
triggerall = p2statetype != L
trigger1 = (var(21))
trigger1 = p2bodydist x < 60
trigger1 = p2bodydist y < -40
trigger1 = random < 60

[State -1, jb]
type = ChangeState
value = 610
triggerall = AILevel && roundstate = 2
triggerall = statetype = A

triggerall = var(58) = 0
triggerall = p2statetype != L
trigger1 = (var(21))
trigger1 = p2bodydist x < 60
trigger1 = p2bodydist y < -40
trigger1 = random < 100
;アサルト
trigger2 = stateno = 700 && time >= 17
trigger2 = p2bodydist y < -40

[State -1, jc]
type = ChangeState
value = 620
triggerall = AILevel && roundstate = 2
triggerall = statetype = A

triggerall = var(58) = 0
triggerall = p2statetype != L
trigger1 = (var(21))
trigger1 = p2bodydist x < 80
trigger1 = p2bodydist y > -40
trigger1 = random < 100
;アサルト
trigger2 = stateno = 700 && time >= 17
trigger2 = p2bodydist y >= -40

[State -1, j2b]
type = ChangeState
value = 625
triggerall = AILevel && roundstate = 2
triggerall = statetype = A

triggerall = var(58) = 0
triggerall = p2statetype != L
trigger1 = (var(21))
;;trigger1 = p2movetype != H
trigger1 = random < 30

[State -1, 走る]
type = ChangeState
triggerall = AILevel && roundstate = 2
trigger1 = statetype != A
trigger1 = (var(21))
trigger1 = random < 15 + (p2bodydist x > 150)*10 + (numhelper(1000) || numhelper(3250))*15
trigger1 = stateno != 100
value = 100

[State -1, バックステップ]
type = ChangeState
value = 105
triggerall = AILevel && roundstate = 2
triggerall = statetype != A

triggerall = var(58) = 0
trigger1 = (var(21))
trigger1 = p2bodydist x < 50 && backedgebodydist > 30 && random < 20 + (var(59)=1)*20

;---------------------------------------------------------------------------
;トリッシュ

;8tau
[State -1, soccor2]
type = ChangeState
value = 320
triggerall = AILevel && roundstate = 2
triggerall = numhelper(3250)
trigger1 = var(21)
trigger1 = helper(3250),rootdist x = [-60, 30]
trigger1 = (helper(3250),stateno = 3251 && helper(3250),time > 50) || random < 20
trigger1 = random < 30+(helper(3250),movetype = H)*50

;6tau
[State -1, soccor2]
type = ChangeState
value = 310
triggerall = AILevel && roundstate = 2
triggerall = numhelper(3250)
trigger1 = var(21)
trigger1 = p2bodydist x < 160 || random %4 = 0
trigger1 = helper(3250),rootdist x = [-130, 15]
trigger1 = helper(3250),rootdist y < 30
trigger1 = (helper(3250),stateno = 3251 && helper(3250),time > 50) || random < 30
trigger1 = random < 50+(helper(3250),movetype = H)*100

;4tau
[State -1, soccor2]
type = ChangeState
value = 300
triggerall = AILevel && roundstate = 2
triggerall = numhelper(3250)
trigger1 = var(21)
trigger1 = helper(3250),rootdist x = [-80, 15]
trigger1 = helper(3250),rootdist y < 30
trigger1 = (helper(3250),stateno = 3251 && helper(3250),time > 50) || random < 20
trigger1 = random < 30+(helper(3250),movetype = H)*100

;---------------------------------------------------------------------------
;movesets
;---------------------------------------------------------------------------
[state -1, end]
type = varset
trigger1 = var(58) = [1, 10000)
trigger1 = movetype = H
var(58) = 0

;---------------------------------------------------------------------------
;KM Dush～

[State 200, leave]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = statetype != A

triggerall = var(58) = [1210, 1299]
trigger1 = var(21)
trigger2 = (stateno = [200, 499]) && var(4)
trigger3 = ((stateno = [2000, 2050]) || (stateno = [2100, 2150]) || stateno = 2205) && var(4)
trigger4 = stateno = 52 && var(8) >= 10
value = 1200

[State 200, leave]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = stateno = 1200 && anim = 1200
triggerall = time >= 15
trigger1 = var(58) = 1210
trigger1 = p2bodydist x < 110
value = 1210

[State 1000, end]
type = Varset
triggerall = AILevel
triggerall = var(58) = [1210,1219]
trigger1 = stateno = 1210
trigger1 = Time = 1
var(58) = 0

[State 200, leave]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = stateno = 1200 && anim = 1200
triggerall = time >= 15
trigger1 = var(58) = [1220, 1222]
trigger1 = p2bodydist x < 80 || inguarddist
value = 1220

[State 1000, end]
type = Varset
triggerall = var(58) = [1220,1229]
trigger1 = stateno = 1220
trigger1 = Time = 1
var(58) = 0

;瞬身
[State 200, leave]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = stateno = 1200 && anim = 1200
triggerall = time >= 15
trigger1 = var(58) = 1230 || var(58) = 1236
trigger1 = p2bodydist x < 35
trigger2 = var(58) = 1231
trigger2 = p2bodydist x < 120
;コーラ
trigger3 = var(58) = 1237
trigger3 = p2bodydist x < 35
trigger4 = var(58) = 1232
trigger4 = p2bodydist x < 90
value = 1230

[State 1000, end]
type = Varset
triggerall = AILevel
triggerall = var(58) = 1232 || var(58) = 1237
trigger1 = stateno = 1230
trigger1 = Time = 1
var(58) = 0

[State 1000, end]
type = Varset
triggerall = var(58) = [1230, 1239]
trigger1 = stateno = 1230 && animelemtime(3) = 5
var(58) = IfElse(random%3=0&&var(59)=0&&(p2dist x=[-50,50]), 800, IfElse((p2bodydist x = [40, 110])&&random%3=0&&var(1)&2**2,2100,620))

[State -1, jc]
type = ChangeState
value = IFElse((p2bodydist x = [0, 110]), 620, 625)
triggerall = AILevel && roundstate = 2
triggerall = statetype = A

triggerall = var(58) = 620
trigger1 = (var(21))
trigger1 = pos y > -120
trigger1 = 1||var(58) := 0

;ジッパーA
[State 200, leave]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = stateno = 1200 && anim = 1200
triggerall = time >= 15
trigger1 = var(58) = 1240
trigger1 = p2bodydist x < 130
trigger2 = var(58) = 1245
trigger2 = p2dist x < 85
value = 1240

[State 1000, end]
type = Varset
triggerall = AILevel && roundstate = 2
triggerall = var(58) = 1240 || var(58) = 1245
trigger1 = stateno = 1240
trigger1 = Time = 1
trigger1 = random % 2 = 0
var(58) = 800

[State -1, throw]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = var(58) = 800
triggerall = statetype != A
trigger1 = var(21)
trigger1 = 1||var(58) := 0
value = 800

;ジッパーB
[State 200, leave]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = stateno = 1200 && anim = 1200
triggerall = time >= 15
trigger1 = var(58) = 1241
trigger1 = p2bodydist x < 70 || inguarddist
value = 1240

[State 1000, end]
type = Varset
triggerall = AILevel
triggerall = var(58) = [1240, 1249]
trigger1 = stateno = 1240
trigger1 = Time = 1
var(58) = 0

[state -1, end]
type = varset
triggerall = var(58) = 1241
trigger1 = enemynear(var(48)),backedgebodydist < 15
var(58) = 1240

[state -1, end]
type = varset
triggerall = var(58) = 620
triggerall = stateno != [1200, 1299]
trigger1 = statetype != A
var(58) = 0

[state -1, end]
type = varset
triggerall = var(58) = 800
triggerall = stateno != [1200, 1299]
trigger1 = p2statetype = A
trigger2 = p2dist x != [-50, 50]
var(58) = 0

;---------------------------------------------------------------------------
;起きバクステ予約
[State -1, j]
type = Null
triggerall = AILevel && roundstate = 2
triggerall = var(58) = 0
trigger1 = stateno = 5120
trigger1 = (!backedgebodydist < 40)
trigger1 = p2bodydist x = [-5, 50]
trigger1 = random < 50
trigger1 = var(58) := -105

[State -1, j2b]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = var(58) = -105
trigger1 = var(21)
trigger1 = statetype != A
trigger1 = 1||var(58) := 0
value = 105

[state -1, end]
type = varset
trigger1 = var(58) = -105
trigger1 = (backedgebodydist < 15)
var(58) = 0

;---------------------------------------------------------------------------
;起き236H予約
[State -1, j]
type = Null
triggerall = AILevel && roundstate = 2
triggerall = var(58) = 0
trigger1 = power >= 1000
trigger1 = stateno = 5120
trigger1 = p2bodydist x = [-5, 90]
trigger1 = p2bodydist y > -60
trigger1 = random < 10 + (backedgebodydist < 15)*7 + (var(59)=0)*5 + (power > 4000)*10
trigger1 = var(58) := -3100

[State -1, j2b]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = var(58) = -3100
trigger1 = var(21)
trigger1 = statetype != A
trigger1 = power >= 1000
trigger1 = 1||var(58) := 0
value = 3100

[state -1, end]
type = varset
trigger1 = var(58) = -3100
trigger1 = !(p2bodydist x = [-5, 90]) || !(p2bodydist y > -60) || power < 1000
var(58) = 0

;---------------------------------------------------------------------------
;上りジラーレ > J
[State -1, j]
type = Null
triggerall = AILevel && roundstate = 2
triggerall = var(58) = 0
triggerall = statetype != A
triggerall = var(21)
trigger1 = p2statetype != A
trigger1 = p2statetype != L || p2stateno = 5120
trigger1 = random < 15
trigger1 = var(58) := -625

[State -1, j]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
triggerall = var(58) = -625
trigger1 = var(21)
value = 41

[State -1, j2b]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = var(58) = -625
triggerall = statetype = A
triggerall = var(21)
trigger1 = 1||var(58) := -6250
value = 625

[State -1, atk]
type = ChangeState
value = IfElse(var(1)&2**2, 2200, 600)
triggerall = AILevel && roundstate = 2
triggerall = statetype = A

triggerall = var(58) = -6250
trigger1 = var(21)
trigger1 = p2bodydist x < 70
trigger1 = 1||var(58) := 0

[state -1, end]
type = varset
trigger1 = var(58) = -6250 ||  var(58) = -625
trigger1 = statetype != A && stateno != [40,49]
var(58) = 0

;---------------------------------------------------------------------------
;めくりジラーレ
[State -1, j]
type = Null
triggerall = AILevel && roundstate = 2
triggerall = var(58) = 0
triggerall = statetype != A
triggerall = var(21)
trigger1 = p2statetype != A
trigger1 = p2bodydist x = [5, 45]
trigger1 = p2statetype != L || p2stateno = 5120
trigger1 = !(enemynear(var(48)),backedgebodydist < 20)
trigger1 = random < 40 + (backedgebodydist < 20 && !inguarddist)*40
trigger1 = var(58) := -626

[State -1, j]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
triggerall = var(58) = -626
trigger1 = var(21)
value = 41

[State -1, j2b]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = var(58) = -626
triggerall = statetype = A
triggerall = var(21)
trigger1 = vel y > 1
trigger1 = 1||var(58) := 0
value = 625

;---------------------------------------------------------------------------
;ジャンプペガソ
[State -1, j]
type = Null
triggerall = AILevel && roundstate = 2
triggerall = var(58) = 0
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = p2statetype != L || p2stateno = 5120
trigger1 = var(21)
trigger1 = p2bodydist x < 100
trigger1 = random < 19 + (var(1)&2**2)*18 + (var(59)=1)* 10
trigger1 = var(58) := -2200
trigger2 = stateno = 400 && moveguarded = 1
trigger2 = random < 120 + (var(1)&2**2)*100 + (var(59)=1)* 50
trigger2 = var(58) := -2200

[State -1, j]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
triggerall = var(58) = -2200
trigger1 = var(21)
value = 41

[State -1, j2b]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = var(58) = -2200
triggerall = statetype = A
triggerall = !var(8)
triggerall = var(21)
trigger1 = (p2bodydist x > 100 || vel y > -2) && pos y < -30
trigger1 = 1||var(58) := -2200
value = 2200

[state -1, end]
type = varset
trigger1 = var(58) = -2200
trigger1 = statetype != A && stateno != [40,49]
var(58) = 0

;---------------------------------------------------------------------------
;アサルトすかし
[State -1, j]
type = Null
triggerall = AILevel && roundstate = 2
triggerall = var(58) = 0
triggerall = statetype != A
triggerall = p2statetype != A
triggerall = p2statetype != L || p2stateno = 5120
triggerall = var(59) = 0
trigger1 = var(21)
trigger1 = p2bodydist x < 150
trigger1 = random < 10
trigger1 = var(58) := -78
trigger2 = (var(4) = 1 && moveguarded = 1)
trigger2 = random < 40
trigger2 = var(58) := -78

[State -1, j]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
triggerall = var(58) = -78
trigger1 = var(21) || ((stateno = [200, 420]) && var(4))
trigger1 = 1||var(58) := -79
value = 700

[State -1, set]
type = Null
triggerall = AILevel && roundstate = 2
trigger1 = var(58) = -79
trigger1 = statetype != A
trigger1 = var(21)
trigger1 = var(58) := -80

[State -1, j2b]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = var(58) = -80
triggerall = statetype != A
trigger1 = var(21)
trigger1 = 1||var(58) := 0
value = 800

[state -1, end]
type = varset
trigger1 = var(58) = [-80, -78]
trigger1 = p2statetype = A
trigger2 = var(58) = -80
trigger2 = p2bodydist x != [-5, 20]
var(58) = 0

;---------------------------------------------------------------------------
;complex combos
;---------------------------------------------------------------------------
[state -1, end]
type = varset
trigger1 = var(58) = [10000, 18000)
trigger1 = p2movetype != H || p2statetype = L
trigger1 = (p2stateno != [5114,5115])
var(58) = 0
[state -1, end]
type = varset
trigger1 = var(58) = [18000, 20000)
trigger1 = p2movetype != H
var(58) = 0

;---------------------------------------------------------------------------
;アッパーhit > 
[state -1, set]
type = Null
triggerall = AILevel && RoundState = 2
triggerall = (var(58) = [0, 10000))

triggerall = movehit = 1 && p2statetype = A
triggerall = stateno = 215

trigger1 = var(58) := 215

[State -1, kick hold]
type = ChangeState
value = 700
triggerall = AILevel && RoundState = 2
triggerall = statetype != A

triggerall = var(58) = 215
trigger1 = stateno = 215 && var(4) || var(21)
trigger1 = Enemynear(var(48)),Vel y || p2bodydist y = 0
Trigger1 = Enemynear(var(48)),Pos Y+Enemynear(var(48)),Vel Y * 28 + fvar(30) * 28 * (28 + 1) / 2 >= -130
trigger1 = 1||var(58) := 0

;---------------------------------------------------------------------------
;アサルトairhit > 
[state -1, set]
type = Null
triggerall = AILevel && RoundState = 2
triggerall = (var(58) = [0, 10000))

triggerall = var(8)
triggerall = movehit = 1 && p2statetype = A
triggerall = stateno = [610,620]

trigger1 = var(58) := 726

[State -1, kick hold]
type = ChangeState
value = 2000
triggerall = AILevel && RoundState = 2
triggerall = statetype != A

triggerall = var(58) = 726
trigger1 = var(21)
Trigger1 = Enemynear(var(48)),Pos Y+Enemynear(var(48)),Vel Y * 21 + fvar(30) * 21 * (21 + 1) / 2 >= -45
trigger1 = 1||var(58) := 0

;---------------------------------------------------------------------------
;ライジングリーダーhit >
[state -1, set]
type = Null
triggerall = AILevel && RoundState = 2
triggerall = (var(58) = [0, 10000))

triggerall = movehit = 1
triggerall = stateno = 2050

trigger1 = var(58) := 11010

[State -1, kick hold]
type = ChangeState
value = 625
triggerall = AILevel && RoundState = 2
triggerall = statetype = A

triggerall = var(58) = 11010
trigger1 = var(21)
trigger1 = p2dist x < -5
trigger1 = 1||var(58) := 0

[State -1, kick hold]
type = ChangeState
value = 2200
triggerall = AILevel && RoundState = 2
triggerall = statetype = A
triggerall = !var(8)

triggerall = var(58) = 11010
trigger1 = var(21)
trigger1 = (fvar(20) > 5 && p2bodydist y > 10) || (Enemynear(var(48)),Vel Y && Enemynear(var(48)),Vel Y > -3 && p2bodydist y > -10) || vel y > 0
trigger1 = 1||var(58) := 0

;---------------------------------------------------------------------------
;ペガソ派生に追撃 2S
[state -1, set]
type = Null
triggerall = AILevel && RoundState = 2
triggerall = (var(58) = [0, 10000))

triggerall = stateno = 2250 || (stateno = 2205 && prevstateno = 2250)
triggerall = p2stateno = [5114, 5115]

trigger1 = (var(1)&2**1) ;シュート可能
trigger1 = var(58) := 2100

[State -1, kick hold]
type = ChangeState
value = 2100
triggerall = AILevel && RoundState = 2
triggerall = statetype != A

triggerall = var(58) = 2100
trigger1 = var(21)
Trigger1 = Enemynear(var(48)),Pos Y+Enemynear(var(48)),Vel Y * 25 + fvar(30) * 25 * (25 + 1) / 2 >= -80
trigger1 = 1||var(58):= 0

;---------------------------------------------------------------------------
;シュート hit > 
[state -1, set]
type = Null
triggerall = AILevel && RoundState = 2
triggerall = (var(58) = [0, 10000))

triggerall = stateno = 2150
triggerall = movehit && animelemtime(2) >= 2
Trigger1 = !(power >= 3000) && !(power > 1000 && p2life < 200) && !(p2life < 50) 
Trigger1 = var(1)=0 || (random %2 = 0)
trigger1 = var(58) := 12250
trigger2 = (var(58) = [0, 10000))
trigger2 = var(58) := 12251

[State -1, kick hold]
type = ChangeState
value = 1100
triggerall = AILevel && RoundState = 2
triggerall = statetype != A

triggerall = var(58) = 12250
trigger1 = stateno = 2150 && var(4)
trigger1 = 1||var(58) = 0

[State -1, kick hold]
type = ChangeState
value = 1200
triggerall = AILevel && RoundState = 2
triggerall = statetype != A

triggerall = var(58) = 12251
trigger1 = stateno = 2150 && var(4)
trigger1 = 1||var(58) := 12000

;---------------------------------------------------------------------------
;KM Dush後の判断 > Cで追撃
[state -1, set]
type = Null
triggerall = AILevel && RoundState = 2
triggerall = (var(58) = [0, 10000))

triggerall = stateno = 1200 && anim = 1200 && time = 15
trigger1 = p2movetype = H && p2statetype = A
trigger1 = var(58) := 12000

[State -1, c]
type = ChangeState
value = 1210
triggerall = AILevel && RoundState = 2

triggerall = var(58) = 12000
trigger1 = stateno = 1200 && anim = 1200 && time >= 15
Trigger1 = Enemynear(var(48)),Pos Y+Enemynear(var(48)),Vel Y * 8 + fvar(30) * 8 * (8 + 1) / 2 >= -40
trigger1 = 1||var(58) := 0

;---------------------------------------------------------------------------
;こいつ or カーズ ＞
[state -1, set]
type = Null
triggerall = AILevel && RoundState = 2
triggerall = (var(58) = [0, 10000))

triggerall = (stateno = 1210 && var(4)) || (stateno = 2000 && !(var(1)&2**0) && fvar(20) < 5)
triggerall = movehit = 1
trigger1 = enemynear(var(48)),backedgebodydist < 30 && p2bodydist x < 60
trigger1 = var(58) :=  IfElse(power > 3000, 13000, IfElse((power=[1000, 2500])||p2life<200, 13100, 0))
trigger2 = enemynear(var(48)),backedgebodydist < 30 && p2bodydist x < 15
trigger2 = var(58) :=  IfElse(power > 3000, 13000, IfElse((power=[1000, 2500])||p2life<200, 13100, 0))

;GHA
[State -1, finish]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
triggerall = power >= 3000
triggerall = var(58) = 13000
triggerall = Var(4)
triggerall = movehit
trigger1 = stateno = 1210
trigger2 = stateno = 2000
value = IfElse(p2life > 150, 3000, 3100)

;236H
[State -1, finish]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
triggerall = power >= 1000
triggerall = var(58) = 13100
triggerall = Var(4)
triggerall = movehit
Triggerall = Enemynear(var(48)),Pos Y+Enemynear(var(48)),Vel Y * 8 + fvar(30) * 8 * (8 + 1) / 2 >= -15
trigger1 = stateno = 1210
trigger2 = stateno = 2000
value = 3100


;ガード
[state -1, Guard]
type = ChangeState
value = 120
triggerall = AILevel
triggerall = roundstate = 2
triggerall = var(21) || stateno = 52
triggerall = var(58) = 0
trigger1 = numhelper(50000)
Trigger1 = inguarddist || ((helper(50000),inguarddist = 1) || p2bodydist x >= 100&&(p2movetype=A))|| (enemynear,numproj > 0)
Trigger1 = 1


;CPUここまで
;==============================================================================
; Supers
;==============================================================================
;GHA
[State -1, 1000]
type = ChangeState
triggerall = AILevel = 0
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = command = "c"
triggerall = power >= 3000
trigger1 = ctrl
trigger2 = stateno != [3000, 3999]
trigger2 = (var(4) = [1, 10]) || (var(4) = 80)
trigger3 = stateno = 52 && var(8) >= 10
value = 3000

;236h
[State -1, 1000]
type = ChangeState
triggerall = AILevel = 0
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = command = "236aa" || command = "236b"
triggerall = power >= 1000
trigger1 = ctrl
trigger2 = stateno != [3000, 3999]
trigger2 = (var(4) = [1, 10]) || (var(4) = 80)
trigger3 = stateno = 52 && var(8) >= 10
value = 3100

;214h
[State -1, 1000]
type = ChangeState
triggerall = AILevel = 0
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = command = "214aa" || command = "214b"
triggerall = power >= 1000
triggerall = numhelper(3250) = 0
trigger1 = ctrl
trigger2 = stateno != [3000, 3999]
trigger2 = (var(4) = [1, 10]) || (var(4) = 80)
trigger3 = stateno = 52 && var(8) >= 10
value = 3200

;==============================================================================
; Specials
;==============================================================================
;KM Dush
[State -1, 1000]
type = ChangeState
triggerall = AILevel = 0
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = command = "41236x" || command = "41236y" || command = "41236z"
trigger1 = ctrl
trigger2 = (var(4) = [1, 5]) || (var(4) = 80)
trigger3 = stateno = 52 && var(8) >= 10
value = 1200

;ude
[State -1, 1000]
type = ChangeState
triggerall = AILevel = 0
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = command = "214x" || command = "214y" || command = "214z"
triggerall = NumHelper(1005) = 0
trigger1 = ctrl
trigger2 = (var(4) = [1, 5]) || (var(4) = 80)
trigger3 = stateno = 52 && var(8) >= 10
value = 1000

;enhaunce
[State -1, 1000]
type = ChangeState
triggerall = AILevel = 0
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = command = "22x" || command = "22y" || command = "22z"
trigger1 = ctrl
trigger2 = (var(4) = [1, 5]) || (var(4) = 80)
trigger3 = stateno = 52 && var(8) >= 10
value = 1100

;==============================================================================
; 移動関連
;==============================================================================
[State -1, 走る]
type = ChangeState
triggerall = AILevel = 0
trigger1 = command = "FF"
trigger1 = statetype != A
trigger1 = ctrl
value = 100

[State -1, バックステップ]
type = ChangeState
value = 105
triggerall = AILevel = 0
triggerall = statetype != A
triggerall = ctrl
trigger1 = command = "BB"

;==============================================================================
; Skills
;==============================================================================
[State -1, assault]
type = ChangeState
value = 700
triggerall = !AILevel
triggerall = (command = "x" && command = "y")
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (var(4) = [1, 4])
trigger3 = stateno = 710 && (var(4) = 5 || var(4) = 80)
trigger3 = power >= 1000

[State -1, break]
type = ChangeState
value = 710
triggerall = !AILevel
triggerall = (command = "x" && command = "y")
triggerall = command = "holdback"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (var(4) = [1, 4])

;5S
[State -1, 1200]
type = ChangeState
triggerall = AILevel = 0
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = (var(4) = [1, 4])
value = 2000

;2S
[State -1, 1200]
type = ChangeState
triggerall = AILevel = 0
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = ctrl
trigger2 = (var(4) = [1, 4])
value = 2100

;JS
[State -1, 1200]
type = ChangeState
triggerall = AILevel = 0
triggerall = roundstate = 2
triggerall = statetype = A
triggerall = command = "b"
trigger1 = ctrl
trigger2 = !var(8)
trigger2 = (var(4) = [1, 4])
trigger3 = stateno = 1230 && animelemtime(3) >= 5
value = 2200

;==============================================================================
; 特殊技
;==============================================================================
;投げ
[State -1, throw]
type = ChangeState
triggerall = AILevel = 0
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = command = "a"
trigger1 = ctrl
value = 800

;GC
[State -1, 1000]
type = ChangeState
triggerall = AILevel = 0
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = command = "holdfwd"
triggerall = command != "holddown"
triggerall = command = "a"
triggerall = power >= 1000
trigger1 = stateno = [150, 153]
trigger1 = time > 0
value = 720

[State -1, soccor2]
type = ChangeState
value = 320
triggerall = AILevel = 0
triggerall = numhelper(3250)
triggerall = command = "start"
triggerall = command = "holdup"
trigger1 = ctrl || stateno = 40

[State -1, soccer1]
type = ChangeState
value = 300
triggerall = AILevel = 0
triggerall = numhelper(3250)
triggerall = command = "start"
triggerall = command = "holdback"
trigger1 = ctrl

[State -1, soccor2]
type = ChangeState
value = 310
triggerall = AILevel = 0
triggerall = numhelper(3250)
triggerall = command = "start"
triggerall = command = "holdfwd" || statetype = A
trigger1 = ctrl

[State -1, 3b]
type = ChangeState
value = 215
triggerall = AILevel = 0
triggerall = command = "y"
triggerall = command = "holdfwd"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(4) = [1, 3]

[State -1, j2c]
type = ChangeState
value = 625
triggerall = AILevel = 0
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = !var(8)
trigger2 = var(4) = [1, 3]
trigger3 = stateno = 1230 && animelemtime(3) >= 5

;==============================================================================
; normals
;==============================================================================
[State -1, a]
type = ChangeState
value = 200
triggerall = AILevel = 0
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(4) = 1

[State -1, b]
type = ChangeState
value = 210
triggerall = AILevel = 0
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(4) = 1

[State -1, c]
type = ChangeState
value = 220
triggerall = AILevel = 0
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(4) = [1, 2]

[State -1, 2a]
type = ChangeState
value = 400
triggerall = AILevel = 0
triggerall = command = "x"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(4) = 1

[State -1, 2b]
type = ChangeState
value = 410
triggerall = AILevel = 0
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(4) = 1

[State -1, 2c]
type = ChangeState
value = 420
triggerall = AILevel = 0
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = var(4) = [1, 2]

[State -1, ジャンプa]
type = ChangeState
value = 600
triggerall = !AILevel
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = stateno = 1230 && animelemtime(3) >= 5

[State -1, ジャンプb]
type = ChangeState
value = 610
triggerall = !AILevel
triggerall = statetype = A
trigger1 = command = "y"
trigger1 = ctrl
trigger2 = command = "y"
trigger2 = var(8) = 0
trigger2 = var(4) = 1
trigger3 = (command = "y" || command = "holdy") || ((command = "x" || command = "holdx") && stateno = 700)
trigger3 = stateno = 700 && time >= 17
trigger4 = command = "y"
trigger4 = stateno = 1230 && animelemtime(3) >= 5

[State -1, ジャンプc]
type = ChangeState
value = 620
triggerall = !AILevel
triggerall = statetype = A
trigger1 = command = "z"
trigger1 = ctrl
trigger2 = command = "z"
trigger2 = var(8) = 0
trigger2 = var(4) = [1, 2]
trigger3 = (command = "z" || command = "holdz")
trigger3 = stateno = 700 && time >= 17
trigger4 = command = "z"
trigger4 = stateno = 1230 && animelemtime(3) >= 5

;------------------------------------------------------------------------------

[State -1, taunt]
type = ChangeState
value = 195
triggerall = AILevel = 0
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl
