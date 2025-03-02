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
name = "41214x"
command = ~B,D,F,x
time = 22
[Command]
name = "41214y"
command = ~B,D,F,y
time = 22
[Command]
name = "41214z"
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

;ガード
[state -1, Guard]
type = ChangeState
value = 120
triggerall = AILevel
triggerall = roundstate = 2
triggerall = !var(59)
triggerall = (ctrl || (stateno = [120,149]))
trigger1 = numhelper(50000)
Trigger1 = inguarddist || ((helper(50000),inguarddist = 1) || p2bodydist x >= 100&&(p2movetype=A))|| (enemynear,numproj > 0)
Trigger1 = 1

;236h
[State -1, 1000]
type = ChangeState
trigger1 = stateno = 40 && time = 0
trigger1 = random % 2 = 0
value = 0
ctrl = 1

;236h
[State -1, 1000]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = power >= 1000
trigger1 = (ctrl || (stateno = [120,149]))
trigger1 = Inguarddist && p2movetype = A
trigger1 = random < 50
trigger1 = p2bodydist x < 80
trigger1 = p2bodydist y > -80
value = 3100

;214h
[State -1, 1000]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = power >= 1000
triggerall = numhelper(3250) = 0
trigger1 = (ctrl || (stateno = [120,149]))
trigger1 = random < 4
value = 3200

;KIMO ダッシュ
[State -1, 1000]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
trigger1 = (ctrl || (stateno = [120,149]))
trigger1 = random < 36
trigger1 = p2bodydist x > 60
value = 1200

;強化技
[State -1, 1000]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = !((Var(1)&2**0) && (var(1)&2**1) && (var(1)&2**2))
trigger1 = (ctrl || (stateno = [120,149]))
trigger1 = random < 22 + (NumHelper(1005))*20 + (p2statetype = L)*30
trigger1 = p2bodydist x > 120 - (p2statetype = L)*60
trigger2 = (ctrl || (stateno = [120,149]))
trigger2 = NumHelper(1005)
trigger2 = p2bodydist x > 60
trigger2 = random < 300 + ((var(1)&2**1) = 0) * 300
trigger3 = p2bodydist x > 100
trigger3 = stateno = 1230 && animtime = -1 && movehit
trigger4 = stateno = 2150 && var(4)
value = 1100

;ロケパン
[State -1, 1000]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
triggerall = NumHelper(1005) = 0
trigger1 = (ctrl || (stateno = [120,149]))
trigger1 = random < 50 + (p2statetype = L)*30
trigger1 = p2bodydist x > 80 - (p2statetype = L)*60
value = 1000

;5S
[State -1, 1200]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
trigger1 = (ctrl || (stateno = [120,149]))
trigger1 = random < 25 + ((var(1)&2**2) = 1)* 45
trigger1 = p2bodydist x > 60
value = 2000

;2S
[State -1, 1200]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
trigger1 = p2bodydist x < 90
trigger1 = (ctrl || (stateno = [120,149]))
trigger1 = !inguarddist
trigger1 = random < 20 + ((var(1)&2**1)=1)*25
value = 2100

;JS
[State -1, 1200]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = statetype = A
trigger1 = (ctrl || (stateno = [120,149]))
trigger1 = random < 24
trigger1 = p2bodydist x < 60
value = 2200

[State -1, assault]
type = ChangeState
value = 700
triggerall = AILevel && RoundState = 2 && !var(59)
triggerall = statetype != A
triggerall = p2statetype != A && p2statetype != L
trigger1 = (ctrl || (stateno = [120,149]))
trigger1 = p2bodydist x > 70
trigger1 = random < 25
trigger2 = (stateno = 200||stateno = 210||stateno = 215||stateno = 220||stateno = 400||stateno = 410||stateno = 420) && var(4)
trigger2 = moveguarded = 1
trigger2 = random < 180

;投げ
[State -1, 1000]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = p2statetype != A && p2statetype != L
trigger1 = (ctrl || (stateno = [120,149]))
trigger1 = random < 22
trigger1 = p2bodydist x < 15
value = 800

[State -1, 立ちc]
type = ChangeState
value = 220
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
trigger1 = (ctrl || (stateno = [120,149]))
trigger1 = random < 22
trigger1 = p2bodydist x = [50, 80]

[State -1, 屈c]
type = ChangeState
value = 400
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
triggerall = p2statetype != A
trigger1 = (ctrl || (stateno = [120,149]))
trigger1 = random < 80 + (enemynear,gethitvar(hittime) > 5)* 200
trigger1 = p2bodydist x = [-5, 65]

[State -1, 屈c]
type = ChangeState
value = 410
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
triggerall = p2statetype != A
trigger1 = (ctrl || (stateno = [120,149]))
trigger1 = random < 32
trigger1 = p2bodydist x = [45, 70]

[State -1, 屈c]
type = ChangeState
value = 420
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
triggerall = p2statetype != A
trigger1 = (ctrl || (stateno = [120,149]))
trigger1 = random < 15
trigger1 = p2bodydist x = [65, 110]

[State -1, ジャンプc]
type = ChangeState
value = 620
triggerall = AILevel && roundstate = 2
triggerall = statetype = A
triggerall = random < 240 && p2bodydist x < 100 + (p2movetype=H)*24 && p2bodydist y > -40 - (p2movetype=H)*24
triggerall = prevstateno != 2050
triggerall = !(pos y < -120)
trigger1 = (ctrl || (stateno = [120,149]))
trigger2 = stateno = 700 && time = 25

[State -1, ジャンプc]
type = ChangeState
value = 620
triggerall = AILevel && roundstate = 2
triggerall = statetype = A
trigger1 = stateno = 700 && time = 25

[State -1, 走る]
type = ChangeState
triggerall = AILevel && roundstate = 2
trigger1 = statetype != A
trigger1 = (ctrl || (stateno = [120,149]))
trigger1 = random < 10
value = 100

[State -1, バックステップ]
type = ChangeState
value = 105
triggerall = AILevel && roundstate = 2
trigger1 = statetype != A
trigger1 = (ctrl || (stateno = [120,149]))
trigger1 = p2bodydist x < 40 && backedgebodydist > 30 && random < 50

;==============================================================================
; コンボ
;==============================================================================

[State -1, 屈c]
type = ChangeState
value = 410
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
triggerall = (stateno = 200 || stateno = 400) && var(4)
trigger1 = movecontact = 1

[State -1, 5c]
type = ChangeState
value = 220
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
triggerall = (stateno = 210 || stateno = 410) && var(4)
trigger1 = movecontact = 1

;5S
[State -1, 1200]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = (stateno = 220 || stateno = 420) && var(4)
trigger1 = movehit = 1
trigger2 = movecontact = 1 && random % 2 = 0
value = 2000

;JS
[State -1, 1200]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = roundstate = 2
triggerall = statetype = A
triggerall = ctrl && pos y < -120
trigger1 = p2bodydist y > 0
value = 2200

;2S
[State -1, 1200]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = roundstate = 2
triggerall = statetype != A
trigger1 = ctrl && p2stateno = 5115 && enemynear,vel y < 0
value = 2100

;KIMO ダッシュ
[State -1, 1000]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
triggerall = (stateno = 220 || stateno = 420 || stateno = 2000) && var(4)
trigger1 = movehit = 2
trigger1 = fvar(10) >= 7.5
trigger2 = moveguarded = 2 && random % 2 = 0
value = 1200

[State -1, 1000]
type = ChangeState
triggerall = AILevel && roundstate = 2
triggerall = statetype != A
triggerall = power >= 1000
triggerall = p2bodydist x < 50
trigger1 = (stateno = 1000 || (stateno = [1200, 1250])) && var(4)
trigger1 = p2bodydist y >= -40
trigger1 = movehit
trigger2 = (stateno = 2000) && var(4)
trigger2 = movehit
value = 3100

;CPUここまで
;==============================================================================
; 超必殺技
;==============================================================================
;GHA
[State -1, 1000]
type = ChangeState
triggerall = AILevel = 0
triggerall = roundstate = 2
;triggerall = statetype != A
triggerall = command = "c"
triggerall = power >= 3000
trigger1 = ctrl
trigger2 = (stateno = [200, 699]) && var(4) && !var(8)
trigger3 = (stateno = 1000 || (stateno = [1200, 1250])) && var(4)
trigger4 = ((stateno = [2000, 2050]) || (stateno = [2100, 2150]) || (stateno = [2200, 2250])) && var(4)
trigger5 = stateno = 52 && var(8) > 1
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
trigger2 = (stateno = [200, 499]) && var(4)
trigger3 = (stateno = 1000 || (stateno = [1200, 1250])) && var(4)
trigger4 = ((stateno = [2000, 2050]) || (stateno = [2100, 2150]) || (stateno = [2200, 2250])) && var(4)
trigger5 = stateno = 52 && var(8) > 1
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
trigger2 = (stateno = [200, 499]) && var(4)
trigger3 = (stateno = 1000 || (stateno = [1200, 1250])) && var(4)
trigger4 = ((stateno = [2000, 2050]) || (stateno = [2100, 2150]) || (stateno = [2200, 2250])) && var(4)
trigger5 = stateno = 52 && var(8) > 1
value = 3200

;==============================================================================
; 必殺技
;==============================================================================
;KIMO ダッシュ
[State -1, 1000]
type = ChangeState
triggerall = AILevel = 0
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = command = "41214x" || command = "41214y" || command = "41214z"
trigger1 = ctrl
trigger2 = (stateno = [200, 499]) && var(4)
trigger3 = ((stateno = [2000, 2050]) || (stateno = [2100, 2150]) || stateno = 2205) && var(4)
trigger4 = stateno = 52 && var(8) > 1
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
trigger2 = (stateno = [200, 499]) && var(4)
trigger3 = ((stateno = [2000, 2050]) || (stateno = [2100, 2150]) || stateno = 2205) && var(4)
trigger4 = stateno = 52 && var(8) > 1
value = 1000

;強化技
[State -1, 1000]
type = ChangeState
triggerall = AILevel = 0
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = command = "22x" || command = "22y" || command = "22z"
trigger1 = ctrl
trigger2 = (stateno = [200, 499]) && var(4)
trigger3 = ((stateno = [2000, 2050]) || (stateno = [2100, 2150]) || stateno = 2205) && var(4)
trigger4 = stateno = 52 && var(8) > 1
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

[State -1, JCan]
type = Null;ChangeState
value = 40
triggerall = !AILevel
triggerall = command = "holdup"
trigger1 = stateno = 215 && var(4) = 1

;==============================================================================
; S技
;==============================================================================
[State -1, assault]
type = ChangeState
value = 700
triggerall = command = "holdfwd"
triggerall = (command = "x" && command = "y") || (command = "b")
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200, 499]) && var(4)

;5S
[State -1, 1200]
type = ChangeState
triggerall = AILevel = 0
triggerall = roundstate = 2
triggerall = statetype != A
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = ctrl
trigger2 = (stateno = [200, 499]) && var(4)
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
trigger2 = (stateno = [200, 499]) && var(4)
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
trigger2 = (stateno = [600, 699]) && var(4)
trigger3 = (stateno = 810) && time > 90
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
trigger1 = stateno = [150,153]
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
trigger2 = stateno != 215
trigger2 = (stateno = [200, 499]) && var(4)

[State -1, j2c]
type = ChangeState
value = 625
triggerall = AILevel = 0
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype = A
trigger1 = ctrl
trigger2 = var(8) = 0
trigger2 = (stateno = [600,620]) && var(4)

;==============================================================================
; 通常攻撃技
;==============================================================================
[State -1, a]
type = ChangeState
value = 200
triggerall = AILevel = 0
triggerall = command = "x"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 400) && var(4)

[State -1, b]
type = ChangeState
value = 210
triggerall = AILevel = 0
triggerall = command = "y"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 400) && var(4)

[State -1, c]
type = ChangeState
value = 220
triggerall = AILevel = 0
triggerall = command = "z"
triggerall = command != "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 210 || stateno = 400 || stateno = 410) && var(4)

[State -1, 2a]
type = ChangeState
value = 400
triggerall = AILevel = 0
triggerall = command = "x"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200||stateno = 400) && var(4)

[State -1, 2b]
type = ChangeState
value = 410
triggerall = AILevel = 0
triggerall = command = "y"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 400) && var(4)

[State -1, 2c]
type = ChangeState
value = 420
triggerall = AILevel = 0
triggerall = command = "z"
triggerall = command = "holddown"
triggerall = statetype != A
trigger1 = ctrl
trigger2 = (stateno = 200 || stateno = 210 || stateno = 400 || stateno = 410) && var(4)

[State -1, ジャンプa]
type = ChangeState
value = 600
triggerall = !AILevel
triggerall = command = "x"
triggerall = statetype = A
trigger1 = ctrl

[State -1, ジャンプb]
type = ChangeState
value = 610
triggerall = !AILevel
triggerall = statetype = A
trigger1 = command = "y"
trigger1 = ctrl
trigger2 = command = "y"
trigger2 = var(8) = 0
trigger2 = stateno = 600 && var(4)
trigger3 = (command = "y" || command = "holdy") || ((command = "x" || command = "holdx") && stateno = 700)
trigger3 = stateno = 700 && time >= 20

[State -1, ジャンプc]
type = ChangeState
value = 620
triggerall = !AILevel
triggerall = statetype = A
trigger1 = command = "z"
trigger1 = ctrl
trigger2 = command = "z"
trigger2 = var(8) = 0
trigger2 = (stateno = [600,610]) && var(4)
trigger3 = (command = "z" || command = "holdz")
trigger3 = stateno = 700 && time >= 20


;------------------------------------------------------------------------------

[State -1, taunt]
type = ChangeState
value = 195
triggerall = AILevel = 0
triggerall = command = "start"
trigger1 = statetype != A
trigger1 = ctrl
