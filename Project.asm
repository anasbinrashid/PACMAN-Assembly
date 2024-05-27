include irvine32.inc
includelib winmm.lib

PlaySound proto, pszsound:ptr byte, hmod:dword, fdwsound:dword

.data

    deviceconnect db "DeviceConnect",0
    snd_alias dd 00010000h
    soundfile db "Add your Path\Pac-Man-Theme-Song.wav",0
    
    filename db "PlayerScores.txt"
    filehandle handle ?
    lengthofstring dd ?

    pacmanintro1 db " ________     ________      ________      ______ ______      ________      _________     ", 0ah, 0
    pacmanintro2 db "|\   __  \   |\   __  \    |\   ____\    |\   _ \   _  \    |\   __  \    |\   ___  \    ", 0ah, 0
    pacmanintro3 db "\ \  \|\  \  \ \  \|\  \   \ \  \___|    \ \  \\ \__\\  \   \ \  \|\  \   \ \  \\ \  \   ", 0ah, 0
    pacmanintro4 db " \ \   ____\  \ \   __  \   \ \  \        \ \  \\|__| \  \   \ \   __  \   \ \  \\ \  \  ", 0ah, 0
    pacmanintro5 db "  \ \  \___|   \ \  \ \  \   \ \  \____    \ \  \    \ \  \   \ \  \ \  \   \ \  \\ \  \ ", 0ah, 0
    pacmanintro6 db "   \ \__\       \ \__\ \__\   \ \_______\   \ \__\    \ \__\   \ \__\ \__\   \ \__\\ \__\", 0ah, 0
    pacmanintro7 db "    \|__|        \|__|\|__|    \|_______|    \|__|     \|__|    \|__|\|__|    \|__| \|__|", 0ah, 0

    level11 db " ___      _______  __   __  _______  ___        ____  ", 0ah, 0
    level12 db "|   |    |    ___||  | |  ||    ___||   |      |    | ", 0ah, 0
    level13 db "|   |    |   |___ |  |_|  ||   |___ |   |       |   | ", 0ah, 0
    level14 db "|   |___ |    ___||       ||    ___||   |___    |   | ", 0ah, 0
    level15 db "|       ||   |___  |     | |   |___ |       |   |   | ", 0ah, 0
    level16 db "|_______||_______|  |___|  |_______||_______|   |___| ", 0ah, 0

    level21 db " ___      _______  __   __  _______  ___        _______ ", 0ah, 0
    level22 db "|   |    |    ___||  | |  ||    ___||   |      |____   |", 0ah, 0
    level23 db "|   |    |   |___ |  |_|  ||   |___ |   |       ____|  |", 0ah, 0
    level24 db "|   |___ |    ___||       ||    ___||   |___   | ______|", 0ah, 0
    level25 db "|       ||   |___  |     | |   |___ |       |  | |_____ ", 0ah, 0
    level26 db "|_______||_______|  |___|  |_______||_______|  |_______|", 0ah, 0

    level31 db " ___      _______  __   __  _______  ___        _______ ", 0ah, 0
    level32 db "|   |    |    ___||  | |  ||    ___||   |      |___    |", 0ah, 0
    level33 db "|   |    |   |___ |  |_|  ||   |___ |   |       ___|   |", 0ah, 0
    level34 db "|   |___ |    ___||       ||    ___||   |___   |___    |", 0ah, 0
    level35 db "|       ||   |___  |     | |   |___ |       |   ___|   |", 0ah, 0
    level36 db "|_______||_______|  |___|  |_______||_______|  |_______|", 0ah, 0

    levelc1 db "    __    _______    __________       ________    _________    ____  __________ ", 0ah, 0
    levelc2 db "   / /   / ____/ |  / / ____/ /      / ____/ /   / ____/   |  / __ \/ ____/ __ \", 0ah, 0
    levelc3 db "  / /   / __/  | | / / __/ / /      / /   / /   / __/ / /| | / /_/ / __/ / / / /", 0ah, 0
    levelc4 db " / /___/ /___  | |/ / /___/ /___   / /___/ /___/ /___/ ___ |/ _, _/ /___/ /_/ / ", 0ah, 0
    levelc5 db "/_____/_____/  |___/_____/_____/   \____/_____/_____/_/  |_/_/ |_/_____/_____/  ", 0ah, 0
                                                                 
    youwin1 db " /$$     /$$ /$$$$$$  /$$   /$$       /$$      /$$ /$$$$$$ /$$   /$$", 0ah, 0
    youwin2 db "|  $$   /$$//$$__  $$| $$  | $$      | $$  /$ | $$|_  $$_/| $$$ | $$", 0ah, 0
    youwin3 db " \  $$ /$$/| $$  \ $$| $$  | $$      | $$ /$$$| $$  | $$  | $$$$| $$", 0ah, 0
    youwin4 db "  \  $$$$/ | $$  | $$| $$  | $$      | $$/$$ $$ $$  | $$  | $$ $$ $$", 0ah, 0
    youwin5 db "   \  $$/  | $$  | $$| $$  | $$      | $$$$_  $$$$  | $$  | $$  $$$$", 0ah, 0
    youwin6 db "    | $$   | $$  | $$| $$  | $$      | $$$/ \  $$$  | $$  | $$\  $$$", 0ah, 0
    youwin7 db "    | $$   |  $$$$$$/|  $$$$$$/      | $$/   \  $$ /$$$$$$| $$ \  $$", 0ah, 0
    youwin8 db "    |__/    \______/  \______/       |__/     \__/|______/|__/  \__/", 0ah, 0
                                                     
    advance db "Press Any Key to Advance", 0ah, 0                                                                                       

    gameover1 db " _____ _____ _____ _____ _________ _____ _____ _____ _____ ", 0ah, 0
    gameover2 db "|| G ||| A ||| M ||| E |||       ||| O ||| V ||| E ||| R ||", 0ah, 0
    gameover3 db "||___|||___|||___|||___|||_______|||___|||___|||___|||___||", 0ah, 0
    gameover4 db "|/___\|/___\|/___\|/___\|/_______\|/___\|/___\|/___\|/___\|", 0ah, 0

    choice1 db "1.  START GAME", 0ah, 0
    choice2 db "2.  INSTRUCTIONS", 0ah, 0
    choice3 db "3.  HIGHSCORES", 0ah, 0
    choice4 db "4.  EXIT GAME", 0ah, 0
    choiceask db "Enter Your Choice:  ", 0
    
    instruction db "~*~*~ INSTRUCTIONS ~*~*~", 0ah, 0
    instruction1 db "1. Use W, A, S, D keys to move around the area.", 0ah, 0
    instruction2 db "2. Press X at any point of the game to exit.", 0ah, 0
    instruction3 db "3. Stay between the walls as you try to eat all the coins.", 0ah, 0
    instruction4 db "4. Beware of all the enemies, they don't like you at all!", 0ah, 0
    returnask db "Press 1 to START GAME and 2 to go back to MAIN MENU:  ", 0
    
    pausestring db "~*~*~ GAME PAUSED ~*~*~", 0ah, 0
    pause1 db "1.  RESUME GAME", 0ah, 0
    pause2 db "2.  RESTART GAME", 0ah, 0
    pause3 db "3.  EXIT GAME", 0ah, 0
    
    startinput db ?

    hsstring db "~*~*~ HIGHSCORES ~*~*~", 0ah, 0

    nameinput db "Enter your name:  ", 0
    username db 16 dup (?)
    
    buffer db 100 dup (?)
    namestring db "Player Name: ", 0
    exitstring db "Press Any Key to Exit", 0

    ground db "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~", 0
    ground1 db "|",0ah,0
    ground2 db "|",0

    wall1 db "##########", 0

    wall2 db "#", 0

    temp db ?

    scorestring db "Score: ",0
    score db 0
    blank db " ",0

    livesstring db "Lives: ",0
    lives db 3

    fruitxcoordinate db 60
    fruitycoordinate db 14

    heartxcoordinate db 118
    heartycoordinate db 25

    deathxcoordinate db 74
    deathycoordinate db 11

    xcoordinate db 2
    ycoordinate db 20

    xcoordinateghost db 116
    ycoordinateghost db 10

    xcoordinateghost2 db 16
    ycoordinateghost2 db 27

    xcoordinateghost3 db 2
    ycoordinateghost3 db 2

    portalxcoordinate db ?
    portalycoordinate db ?

    freezexcoordinate db ?
    freezeycoordinate db ?

    xcoordinatecoin db 50 dup (?)
    ycoordinatecoin db 50 dup (?)

    input db ?

    level db ?

    freezetimer sbyte 0

.code

takeinput PROC

    call clrscr

    mov eax, yellow
    call settextcolor

    mov dl, 15
    mov dh, 3
    call gotoxy

    mov edx, offset pacmanintro1
    call writestring

    mov dl, 15
    mov dh, 4
    call gotoxy

    mov eax, 400
    call delay

    mov edx, offset pacmanintro2
    call writestring

    mov dl, 15
    mov dh, 5
    call gotoxy

    mov eax, 400
    call delay

    mov edx, offset pacmanintro3
    call writestring

    mov dl, 15
    mov dh, 6
    call gotoxy

    mov eax, 400
    call delay

    mov edx, offset pacmanintro4
    call writestring

    mov dl, 15
    mov dh, 7
    call gotoxy

    mov eax, 400
    call delay

    mov edx, offset pacmanintro5
    call writestring

    mov dl, 15
    mov dh, 8
    call gotoxy

    mov eax, 400
    call delay

    mov edx, offset pacmanintro6
    call writestring

    mov dl, 15
    mov dh, 9
    call gotoxy

    mov eax, 400
    call delay

    mov edx, offset pacmanintro7
    call writestring

    mov eax, white
    call settextcolor

    mov eax, 200
    call delay

    mov dl, 45
    mov dh, 14
    call gotoxy

    mov edx, offset nameinput
    call writestring

    mov edx, offset username 
    mov ecx, lengthof username 
    call readstring

    ret

takeinput ENDP

drawwalls PROC

    ; draw ground at (0,29)

    mov eax,blue                     
    call settextcolor
    
    mov dl,0
    mov dh,29
    call gotoxy
    
    mov edx, offset ground
    call writestring
    
    mov dl,0
    mov dh,1
    call gotoxy
    
    mov edx, offset ground
    call writestring

    mov ecx,27
    mov dh,2
    mov temp, dh

    l1:

        mov dl,0
        mov dh, temp
        call gotoxy
    
        mov edx, offset ground1
        call writestring
        
        inc temp
    
    loop l1

    mov ecx,27
    mov dh,2
    mov temp,dh
    
    l2:
     
        mov dh,temp
        mov dl,119
        call gotoxy
        
        mov edx, offset ground2
        call writestring
        
        inc temp
    
    loop l2

    ret

drawwalls ENDP

drawobstacles1 PROC

    mov dl,5
    mov dh,5
    call gotoxy
    
    mov edx,offset wall1
    call writestring

    mov dl,30
    mov dh,5
    call gotoxy
    
    mov edx,offset wall1
    call writestring

    mov dl,55
    mov dh,5
    call gotoxy
    
    mov edx,offset wall1
    call writestring

    mov dl,80
    mov dh,5
    call gotoxy
    
    mov edx,offset wall1
    call writestring

    mov dl,105
    mov dh,5
    call gotoxy
    
    mov edx,offset wall1
    call writestring

    mov dl,5
    mov dh,12
    call gotoxy
    
    mov edx,offset wall1
    call writestring
    
    mov dl,30
    mov dh,12
    call gotoxy
    
    mov edx,offset wall1
    call writestring
    
    mov dl,55
    mov dh,12
    call gotoxy
    
    mov edx,offset wall1
    call writestring
    
    mov dl,80
    mov dh,12
    call gotoxy
    
    mov edx,offset wall1
    call writestring
    
    mov dl,105
    mov dh,12
    call gotoxy
    
    mov edx,offset wall1
    call writestring
    
    mov dl,5
    mov dh,19
    call gotoxy
    
    mov edx,offset wall1
    call writestring
    
    mov dl,30
    mov dh,19
    call gotoxy
    
    mov edx,offset wall1
    call writestring
    
    mov dl,55
    mov dh,19
    call gotoxy
    
    mov edx,offset wall1
    call writestring
    
    mov dl,80
    mov dh,19
    call gotoxy
    
    mov edx,offset wall1
    call writestring
    
    mov dl,105
    mov dh,19
    call gotoxy
    
    mov edx,offset wall1
    call writestring
    
    mov dl,5
    mov dh,26
    call gotoxy
    
    mov edx,offset wall1
    call writestring
    
    mov dl,30
    mov dh,26
    call gotoxy
    
    mov edx,offset wall1
    call writestring
    
    mov dl,55
    mov dh,26
    call gotoxy
    
    mov edx,offset wall1
    call writestring
    
    mov dl,80
    mov dh,26
    call gotoxy
    
    mov edx,offset wall1
    call writestring
    
    mov dl,105
    mov dh,26
    call gotoxy
    
    mov edx,offset wall1
    call writestring
    
    ret

drawobstacles1 ENDP

drawobstacles2 PROC

    call drawobstacles1

    mov dl, 17
    mov dh, 8
    call gotoxy

    mov edx, offset wall1
    call writestring

    mov dl, 55
    mov dh, 8
    call gotoxy

    mov edx, offset wall1
    call writestring

    mov dl, 93
    mov dh, 8
    call gotoxy

    mov edx, offset wall1
    call writestring

    mov dl, 17
    mov dh, 15
    call gotoxy

    mov edx, offset wall1
    call writestring

    mov dl, 55
    mov dh, 15
    call gotoxy

    mov edx, offset wall1
    call writestring

    mov dl, 93
    mov dh, 15
    call gotoxy

    mov edx, offset wall1
    call writestring

    mov dl, 17
    mov dh, 23
    call gotoxy

    mov edx, offset wall1
    call writestring

    mov dl, 55
    mov dh, 23
    call gotoxy

    mov edx, offset wall1
    call writestring

    mov dl, 93
    mov dh, 23
    call gotoxy

    mov edx, offset wall1
    call writestring

    ret

drawobstacles2 ENDP

drawobstacles3 PROC

    call drawobstacles2

    mov ecx, 16
    mov temp, 8

    loopdraw:

        mov dh, temp
        mov dl, 47
        call gotoxy

        mov edx, offset wall2
        call writestring

        inc temp

    loop loopdraw

    mov ecx, 16
    mov temp, 8

    loopdraw1:

        mov dh, temp
        mov dl, 72
        call gotoxy

        mov edx, offset wall2
        call writestring

        inc temp

    loop loopdraw1

    ret

drawobstacles3 ENDP

drawplayer PROC

    mov eax,white
    call settextcolor
    
    mov dl,xcoordinate
    mov dh,ycoordinate
    call gotoxy
    
    mov al,206
    call writechar
    
    ret

drawplayer ENDP

updateplayer PROC
   
    mov dl,xcoordinate
    mov dh,ycoordinate
    call gotoxy
    
    mov al," "
    call writechar
    
    ret

updateplayer ENDP

drawcoin PROC
   
    mov eax,yellow 
    call settextcolor
    
    mov dl,[esi]
    mov dh,[edi]
    call gotoxy
    
    mov al, 248
    call writechar

    ret

drawcoin ENDP

createrandomcoin PROC
    
    mov eax,118
    call RandomRange
    add eax, 1
    
    mov [esi],al

    mov eax,24
    call RandomRange
    add eax, 4

    mov [edi],al
    
    ret

createrandomcoin ENDP

updateghost PROC
   
    mov dl,xcoordinateghost
    mov dh,ycoordinateghost
    call gotoxy
    
    mov al," "
    call writechar

    ret

updateghost ENDP

drawghost PROC

    mov eax, red
    call settextcolor
    
    mov dl,xcoordinateghost
    mov dh,ycoordinateghost
    call gotoxy
    
    mov al,"?"
    call writechar
    
    ret

drawghost ENDP

updateghost2 PROC
   
    mov dl,xcoordinateghost2
    mov dh,ycoordinateghost2
    call gotoxy
    
    mov al," "
    call writechar

    ret

updateghost2 ENDP

drawghost2 PROC

    mov eax, magenta
    call settextcolor
    
    mov dl,xcoordinateghost2
    mov dh,ycoordinateghost2
    call gotoxy
    
    mov al,"?"
    call writechar
    
    ret

drawghost2 ENDP

updateghost3 PROC
   
    mov dl,xcoordinateghost3
    mov dh,ycoordinateghost3
    call gotoxy
    
    mov al," "
    call writechar

    ret

updateghost3 ENDP

drawghost3 PROC

    mov eax, gray
    call settextcolor
    
    mov dl,xcoordinateghost3
    mov dh,ycoordinateghost3
    call gotoxy
    
    mov al,"?"
    call writechar
    
    ret

drawghost3 ENDP

drawfruit PROC

    mov eax, lightgreen
    call settextcolor

    mov dl, fruitxcoordinate
    mov dh, fruitycoordinate
    call gotoxy

    mov al, 233
    call writechar

    ret

drawfruit ENDP

drawheart PROC

    mov eax, red
    call settextcolor

    mov dl, heartxcoordinate
    mov dh, heartycoordinate
    call gotoxy

    mov al, 3
    call writechar

    ret

drawheart ENDP

drawportal PROC

    mov eax, cyan
    call settextcolor

    mov dl, portalxcoordinate
    mov dh, portalycoordinate
    call gotoxy

    mov al, 219
    call writechar

    ret

drawportal ENDP

drawdeath PROC

    mov eax, magenta
    call settextcolor

    mov dl, deathxcoordinate
    mov dh, deathycoordinate
    call gotoxy

    mov al, 6
    call writechar

    ret

drawdeath ENDP

drawfreeze PROC

    mov eax, blue
    call settextcolor

    mov dl, freezexcoordinate
    mov dh, freezeycoordinate
    call gotoxy

    mov al, 15
    call writechar

    ret

drawfreeze ENDP

ghostmovement1 PROC

    skipghost:

    mov eax,4

    call randomrange 

    cmp eax,0
    jne continue

    cmp ycoordinateghost,5
    jne continue21gg

    cmp xcoordinateghost,4
    je skipghost

    cmp xcoordinateghost,54
    je skipghost

    cmp xcoordinateghost,79
    je skipghost

    cmp xcoordinateghost,104
    je skipghost

    cmp xcoordinateghost,29
    je skipghost

    continue21gg:

    cmp ycoordinateghost,12
    jne continue31gg

    cmp xcoordinateghost,4
    je skipghost

    cmp xcoordinateghost,54
    je skipghost

    cmp xcoordinateghost,79
    je skipghost

    cmp xcoordinateghost,104
    je skipghost

    cmp xcoordinateghost,29
    je skipghost

    continue31gg:

    cmp ycoordinateghost,19
    jne continue41gg

    cmp xcoordinateghost,4
    je skipghost

    cmp xcoordinateghost,29
    je skipghost

    cmp xcoordinateghost,54
    je skipghost

    cmp xcoordinateghost,79
    je skipghost

    cmp xcoordinateghost,104
    je skipghost

    continue41gg:

    cmp ycoordinateghost,26
    jne continue51gg

    cmp xcoordinateghost,4
    je skipghost

    cmp xcoordinateghost,54
    je skipghost

    cmp xcoordinateghost,79
    je skipghost

    cmp xcoordinateghost,104
    je skipghost

    cmp xcoordinateghost,29
    je skipghost

    continue51gg:

    cmp xcoordinateghost, 118
    je skipghost

    inc xcoordinateghost

    ret

    continue:

    cmp eax,1
    jne continue2
    
    cmp ycoordinateghost,6
    jne continuegg
    je row1gg
         
    row1gg:

    cmp xcoordinateghost,4
    jle continuegg

    cmp xcoordinateghost,14
    jle skipghost

    cmp xcoordinateghost,29
    jle continuegg

    cmp xcoordinateghost,39
    jle skipghost

    cmp xcoordinateghost,54
    jle continuegg

    cmp xcoordinateghost,64
    jle skipghost

    cmp xcoordinateghost,79
    jle continuegg

    cmp xcoordinateghost,89
    jle skipghost

    cmp xcoordinateghost,104
    jle continuegg

    cmp xcoordinateghost,114
    jle skipghost
        
    continuegg:

    row2gg:

    cmp ycoordinateghost,13
    jne row3gg

    cmp xcoordinateghost,4
    jle row3gg

    cmp xcoordinateghost,14
    jle skipghost

    cmp xcoordinateghost,29
    jle row3gg

    cmp xcoordinateghost,39
    jle skipghost

    cmp xcoordinateghost,54
    jle row3gg

    cmp xcoordinateghost,64
    jle skipghost

    cmp xcoordinateghost,79
    jle row3gg

    cmp xcoordinateghost,89
    jle skipghost

    cmp xcoordinateghost,104
    jle row3gg

    cmp xcoordinateghost,114
    jle skipghost

    row3gg:

    cmp ycoordinateghost,20
    jne row4gg

    cmp xcoordinateghost,4
    jle row4gg

    cmp xcoordinateghost,14
    jle skipghost

    cmp xcoordinateghost,29
    jle row4gg

    cmp xcoordinateghost,39
    jle skipghost

    cmp xcoordinateghost,54
    jle row4gg

    cmp xcoordinateghost,64
    jle skipghost

    cmp xcoordinateghost,79
    jle row4gg

    cmp xcoordinateghost,89
    jle skipghost

    cmp xcoordinateghost,104
    jle row4gg

    cmp xcoordinateghost,114
    jle skipghost

    row4gg:

    cmp ycoordinateghost,27
    jne goongg

    cmp xcoordinateghost,4
    jle goongg

    cmp xcoordinateghost,14
    jle skipghost

    cmp xcoordinateghost,29
    jle goongg

    cmp xcoordinateghost,39
    jle skipghost

    cmp xcoordinateghost,54
    jle goongg

    cmp xcoordinateghost,64
    jle skipghost

    cmp xcoordinateghost,79
    jle goongg

    cmp xcoordinateghost,89
    jle skipghost

    cmp xcoordinateghost,104
    jle goongg

    cmp xcoordinateghost,114
    jle skipghost

    goongg:

    cmp ycoordinateghost, 2
    je skipghost

    dec ycoordinateghost

    ret

    continue2:

    cmp eax,2
    jne continue3

    cmp ycoordinateghost,4
    jne continue1gg
    je row11gg
         
    row11gg:

    cmp xcoordinateghost,4
    jle continue1gg

    cmp xcoordinateghost,14
    jle skipghost

    cmp xcoordinateghost,29
    jle continue1gg

    cmp xcoordinateghost,39
    jle skipghost

    cmp xcoordinateghost,54
    jle continue1gg

    cmp xcoordinateghost,64
    jle skipghost

    cmp xcoordinateghost,79
    jle continue1gg

    cmp xcoordinateghost,89
    jle skipghost

    cmp xcoordinateghost,104
    jle continue1gg

    cmp xcoordinateghost,114
    jle skipghost

    continue1gg:

    row21gg:

    cmp ycoordinateghost,11
    jne row31gg

    cmp xcoordinateghost,4
    jle row31gg

    cmp xcoordinateghost,14
    jle skipghost

    cmp xcoordinateghost,29
    jle row31gg

    cmp xcoordinateghost,39
    jle skipghost

    cmp xcoordinateghost,54
    jle row31gg

    cmp xcoordinateghost,64
    jle skipghost

    cmp xcoordinateghost,79
    jle row31gg

    cmp xcoordinateghost,89
    jle skipghost

    cmp xcoordinateghost,104
    jle row31gg

    cmp xcoordinateghost,114
    jle skipghost

    row31gg:

    cmp ycoordinateghost,18
    jne row41gg

    cmp xcoordinateghost,4
    jle row41gg

    cmp xcoordinateghost,14
    jle skipghost

    cmp xcoordinateghost,29
    jle row41gg

    cmp xcoordinateghost,39
    jle skipghost

    cmp xcoordinateghost,54
    jle row41gg

    cmp xcoordinateghost,64
    jle skipghost

    cmp xcoordinateghost,79
    jle row41gg

    cmp xcoordinateghost,89
    jle skipghost

    cmp xcoordinateghost,104
    jle row41gg

    cmp xcoordinateghost,114
    jle skipghost

    row41gg:

    cmp ycoordinateghost,25
    jne goon1gg

    cmp xcoordinateghost,4
    jle goon1gg

    cmp xcoordinateghost,14
    jle skipghost

    cmp xcoordinateghost,29
    jle goon1gg

    cmp xcoordinateghost,39
    jle skipghost

    cmp xcoordinateghost,54
    jle goon1gg

    cmp xcoordinateghost,64
    jle skipghost

    cmp xcoordinateghost,79
    jle goon1gg

    cmp xcoordinateghost,89
    jle skipghost

    cmp xcoordinateghost,104
    jle goon1gg

    cmp xcoordinateghost,114
    jle skipghost

    goon1gg:

    cmp ycoordinateghost, 28
    je skipghost
    
    inc ycoordinateghost

    ret

    continue3:

    cmp ycoordinateghost,5
    jne continue2gg

    cmp xcoordinateghost,115
    je skipghost

    cmp xcoordinateghost,90
    je skipghost

    cmp xcoordinateghost,65
    je skipghost

    cmp xcoordinateghost,40
    je skipghost

    cmp xcoordinateghost,15
    je skipghost

    continue2gg:

    cmp ycoordinateghost,12
    jne continue3gg

    cmp xcoordinateghost,115
    je skipghost

    cmp xcoordinateghost,90
    je skipghost

    cmp xcoordinateghost,65
    je skipghost

    cmp xcoordinateghost,40
    je skipghost

    cmp xcoordinateghost,15
    je skipghost

    continue3gg:

    cmp ycoordinateghost,19
    jne continue4gg

    cmp xcoordinateghost,115
    je skipghost

    cmp xcoordinateghost,90
    je skipghost

    cmp xcoordinateghost,65
    je skipghost

    cmp xcoordinateghost,40
    je skipghost

    cmp xcoordinateghost,15
    je skipghost

    continue4gg:

    cmp ycoordinateghost,26
    jne continue5gg

    cmp xcoordinateghost,115
    je skipghost

    cmp xcoordinateghost,90
    je skipghost

    cmp xcoordinateghost,65
    je skipghost

    cmp xcoordinateghost,40
    je skipghost

    cmp xcoordinateghost,15
    je skipghost

    continue5gg:

    cmp xcoordinateghost, 1
    je skipghost

    dec xcoordinateghost 

    ret

ghostmovement1 ENDP

ghostmovement2 PROC

    skipghost0:

    mov eax,4

    call randomrange 

    cmp eax,0
    jne continue0

    cmp ycoordinateghost,5
    jne continue21gg0

    cmp xcoordinateghost,4
    je skipghost0

    cmp xcoordinateghost,54
    je skipghost0

    cmp xcoordinateghost,79
    je skipghost0

    cmp xcoordinateghost,104
    je skipghost0

    cmp xcoordinateghost,29
    je skipghost0

    continue21gg0:

    cmp ycoordinateghost,12
    jne continue31gg0

    cmp xcoordinateghost,4
    je skipghost0

    cmp xcoordinateghost,54
    je skipghost0

    cmp xcoordinateghost,79
    je skipghost0

    cmp xcoordinateghost,104
    je skipghost0

    cmp xcoordinateghost,29
    je skipghost0

    continue31gg0:

    cmp ycoordinateghost,19
    jne continue41gg0

    cmp xcoordinateghost,4
    je skipghost0

    cmp xcoordinateghost,29
    je skipghost0

    cmp xcoordinateghost,54
    je skipghost0

    cmp xcoordinateghost,79
    je skipghost0

    cmp xcoordinateghost,104
    je skipghost0

    continue41gg0:

    cmp ycoordinateghost,26
    jne continue51gg0

    cmp xcoordinateghost,4
    je skipghost0

    cmp xcoordinateghost,54
    je skipghost0

    cmp xcoordinateghost,79
    je skipghost0

    cmp xcoordinateghost,104
    je skipghost0

    cmp xcoordinateghost,29
    je skipghost0

    continue51gg0:

    cmp ycoordinateghost,8
    jne continue610gg

    cmp xcoordinateghost,16
    je skipghost0

    cmp xcoordinateghost,54
    je skipghost0

    cmp xcoordinateghost,92
    je skipghost0

    continue610gg:

    cmp ycoordinateghost,15
    jne continue710gg

    cmp xcoordinateghost,16
    je skipghost0

    cmp xcoordinateghost,54
    je skipghost0

    cmp xcoordinateghost,92
    je skipghost0

    continue710gg:

    cmp ycoordinateghost,23
    jne continue810gg

    cmp xcoordinateghost,16
    je skipghost0

    cmp xcoordinateghost,54
    je skipghost0

    cmp xcoordinateghost,92
    je skipghost0

    continue810gg:

    cmp xcoordinateghost, 118
    je skipghost0

    inc xcoordinateghost

    ret

    continue0:

    cmp eax,1
    jne continue20
    
    cmp ycoordinateghost,6
    jne continuegg0

    cmp xcoordinateghost,4
    jle continuegg0

    cmp xcoordinateghost,14
    jle skipghost0

    cmp xcoordinateghost,29
    jle continuegg0

    cmp xcoordinateghost,39
    jle skipghost0

    cmp xcoordinateghost,54
    jle continuegg0

    cmp xcoordinateghost,64
    jle skipghost0

    cmp xcoordinateghost,79
    jle continuegg0

    cmp xcoordinateghost,89
    jle skipghost0

    cmp xcoordinateghost,104
    jle continuegg0

    cmp xcoordinateghost,114
    jle skipghost0
        
    continuegg0:

    row2gg0:

    cmp ycoordinateghost,13
    jne row3gg0

    cmp xcoordinateghost,4
    jle row3gg0

    cmp xcoordinateghost,14
    jle skipghost0

    cmp xcoordinateghost,29
    jle row3gg0

    cmp xcoordinateghost,39
    jle skipghost0

    cmp xcoordinateghost,54
    jle row3gg0

    cmp xcoordinateghost,64
    jle skipghost0

    cmp xcoordinateghost,79
    jle row3gg0

    cmp xcoordinateghost,89
    jle skipghost0

    cmp xcoordinateghost,104
    jle row3gg0

    cmp xcoordinateghost,114
    jle skipghost0

    row3gg0:

    cmp ycoordinateghost,20
    jne row4gg0

    cmp xcoordinateghost,4
    jle row4gg0

    cmp xcoordinateghost,14
    jle skipghost0

    cmp xcoordinateghost,29
    jle row4gg0

    cmp xcoordinateghost,39
    jle skipghost0

    cmp xcoordinateghost,54
    jle row4gg0

    cmp xcoordinateghost,64
    jle skipghost0

    cmp xcoordinateghost,79
    jle row4gg0

    cmp xcoordinateghost,89
    jle skipghost0

    cmp xcoordinateghost,104
    jle row4gg0

    cmp xcoordinateghost,114
    jle skipghost0

    row4gg0:

    cmp ycoordinateghost,27
    jne goongg0

    cmp xcoordinateghost,4
    jle goongg0

    cmp xcoordinateghost,14
    jle skipghost0

    cmp xcoordinateghost,29
    jle goongg0

    cmp xcoordinateghost,39
    jle skipghost0

    cmp xcoordinateghost,54
    jle goongg0

    cmp xcoordinateghost,64
    jle skipghost0

    cmp xcoordinateghost,79
    jle goongg0

    cmp xcoordinateghost,89
    jle skipghost0

    cmp xcoordinateghost,104
    jle goongg0

    cmp xcoordinateghost,114
    jle skipghost0

    goongg0:

    cmp ycoordinateghost, 9
    jne nocoll0g

    cmp xcoordinateghost, 16
    jle nocoll0g

    cmp xcoordinateghost, 26
    jle skipghost0

    cmp xcoordinateghost, 54
    jle nocoll0g

    cmp xcoordinateghost, 64
    jle skipghost0

    cmp xcoordinateghost, 92
    jle nocoll0g

    cmp xcoordinateghost, 102
    jle skipghost0

    nocoll0g:

    cmp ycoordinateghost, 16
    jne row6gg

    cmp xcoordinateghost, 16
    jle row6gg

    cmp xcoordinateghost, 26
    jle skipghost0

    cmp xcoordinateghost, 54
    jle row6gg

    cmp xcoordinateghost, 64
    jle skipghost0

    cmp xcoordinateghost, 92
    jle row6gg

    cmp xcoordinateghost, 102
    jle skipghost0

    row6gg:

    cmp ycoordinateghost, 24
    jne row7gg

    cmp xcoordinateghost, 16
    jle row7gg

    cmp xcoordinateghost, 26
    jle skipghost0

    cmp xcoordinateghost, 54
    jle row7gg

    cmp xcoordinateghost, 64
    jle skipghost0

    cmp xcoordinateghost, 92
    jle row7gg

    cmp xcoordinateghost, 102
    jle skipghost0

    row7gg:

    cmp ycoordinateghost, 2
    je skipghost0

    dec ycoordinateghost

    ret

    continue20:

    cmp eax,2
    jne continue30

    cmp ycoordinateghost,4
    jne continue1gg0
    je row11gg0
         
    row11gg0:

    cmp xcoordinateghost,4
    jle continue1gg0
    
    cmp xcoordinateghost,14
    jle skipghost0

    cmp xcoordinateghost,29
    jle continue1gg0

    cmp xcoordinateghost,39
    jle skipghost0

    cmp xcoordinateghost,54
    jle continue1gg0

    cmp xcoordinateghost,64
    jle skipghost0

    cmp xcoordinateghost,79
    jle continue1gg0

    cmp xcoordinateghost,89
    jle skipghost0

    cmp xcoordinateghost,104
    jle continue1gg0

    cmp xcoordinateghost,114
    jle skipghost0

    continue1gg0:

    row21gg0:

    cmp ycoordinateghost,11
    jne row31gg0

    cmp xcoordinateghost,4
    jle row31gg0

    cmp xcoordinateghost,14
    jle skipghost0

    cmp xcoordinateghost,29
    jle row31gg0

    cmp xcoordinateghost,39
    jle skipghost0

    cmp xcoordinateghost,54
    jle row31gg0

    cmp xcoordinateghost,64
    jle skipghost0

    cmp xcoordinateghost,79
    jle row31gg0

    cmp xcoordinateghost,89
    jle skipghost0

    cmp xcoordinateghost,104
    jle row31gg0
    
    cmp xcoordinateghost,114
    jle skipghost0

    row31gg0:

    cmp ycoordinateghost,18
    jne row41gg0

    cmp xcoordinateghost,4
    jle row41gg0

    cmp xcoordinateghost,14
    jle skipghost0

    cmp xcoordinateghost,29
    jle row41gg0

    cmp xcoordinateghost,39
    jle skipghost0

    cmp xcoordinateghost,54
    jle row41gg0

    cmp xcoordinateghost,64
    jle skipghost0

    cmp xcoordinateghost,79
    jle row41gg0

    cmp xcoordinateghost,89
    jle skipghost0

    cmp xcoordinateghost,104
    jle row41gg0

    cmp xcoordinateghost,114
    jle skipghost0

    row41gg0:

    cmp ycoordinateghost,25
    jne goon1gg0

    cmp xcoordinateghost,4
    jle goon1gg0

    cmp xcoordinateghost,14
    jle skipghost0

    cmp xcoordinateghost,29
    jle goon1gg0

    cmp xcoordinateghost,39
    jle skipghost0

    cmp xcoordinateghost,54
    jle goon1gg0

    cmp xcoordinateghost,64
    jle skipghost0

    cmp xcoordinateghost,79
    jle goon1gg0

    cmp xcoordinateghost,89
    jle skipghost0

    cmp xcoordinateghost,104
    jle goon1gg0

    cmp xcoordinateghost,114
    jle skipghost0

    goon1gg0:

    cmp ycoordinateghost, 7
    jne nocoll1gg

    cmp xcoordinateghost, 16
    jle nocoll1gg

    cmp xcoordinateghost, 26
    jle skipghost0

    cmp xcoordinateghost, 54
    jle nocoll1gg

    cmp xcoordinateghost, 64
    jle skipghost0

    cmp xcoordinateghost, 92
    jle nocoll1gg

    cmp xcoordinateghost, 102
    jle skipghost0

    nocoll1gg:

    cmp ycoordinateghost, 14
    jne nocoll12gg

    cmp xcoordinateghost, 16
    jle nocoll12gg

    cmp xcoordinateghost, 26
    jle skipghost0

    cmp xcoordinateghost, 54
    jle nocoll12gg

    cmp xcoordinateghost, 64
    jle skipghost0

    cmp xcoordinateghost, 92
    jle nocoll12gg

    cmp xcoordinateghost, 102
    jle skipghost0

    nocoll12gg:

    cmp ycoordinateghost, 22
    jne nocoll13gg

    cmp xcoordinateghost, 16
    jle nocoll13gg

    cmp xcoordinateghost, 26
    jle skipghost0

    cmp xcoordinateghost, 54
    jle nocoll13gg

    cmp xcoordinateghost, 64
    jle skipghost0

    cmp xcoordinateghost, 92
    jle nocoll13gg
            
    cmp xcoordinateghost, 102
    jle skipghost0

    nocoll13gg:

    cmp ycoordinateghost, 28
    je skipghost0
    
    inc ycoordinateghost

    ret

    continue30:

    cmp ycoordinateghost,5
    jne continue2gg0

    cmp xcoordinateghost,115
    je skipghost0

    cmp xcoordinateghost,90
    je skipghost0

    cmp xcoordinateghost,65
    je skipghost0

    cmp xcoordinateghost,40
    je skipghost0

    cmp xcoordinateghost,15
    je skipghost0

    continue2gg0:

    cmp ycoordinateghost,12
    jne continue3gg0

    cmp xcoordinateghost,115
    je skipghost0

    cmp xcoordinateghost,90
    je skipghost0

    cmp xcoordinateghost,65
    je skipghost0

    cmp xcoordinateghost,40
    je skipghost0

    cmp xcoordinateghost,15
    je skipghost0

    continue3gg0:

    cmp ycoordinateghost,19
    jne continue4gg0

    cmp xcoordinateghost,115
    je skipghost0

    cmp xcoordinateghost,90
    je skipghost0

    cmp xcoordinateghost,65
    je skipghost0

    cmp xcoordinateghost,40
    je skipghost0

    cmp xcoordinateghost,15
    je skipghost0

    continue4gg0:

    cmp ycoordinateghost,26
    jne continue5gg0

    cmp xcoordinateghost,115
    je skipghost0

    cmp xcoordinateghost,90
    je skipghost0

    cmp xcoordinateghost,65
    je skipghost0

    cmp xcoordinateghost,40
    je skipghost0

    cmp xcoordinateghost,15
    je skipghost0

    continue5gg0:

    cmp ycoordinateghost,8
    jne continue60gg

    cmp xcoordinateghost,103
    je skipghost0

    cmp xcoordinateghost,65
    je skipghost0

    cmp xcoordinateghost,27
    je skipghost0

    continue60gg:

    cmp ycoordinateghost,15
    jne continue70gg

    cmp xcoordinateghost,103
    je skipghost0

    cmp xcoordinateghost,65
    je skipghost0

    cmp xcoordinateghost,27
    je skipghost0

    continue70gg:

    cmp ycoordinateghost,23
    jne continue80gg

    cmp xcoordinateghost,103
    je skipghost0

    cmp xcoordinateghost,65
    je skipghost0

    cmp xcoordinateghost,27
    je skipghost0

    continue80gg:

    cmp xcoordinateghost, 1
    je skipghost0

    dec xcoordinateghost 

    ret

ghostmovement2 ENDP

ghostmovement31 PROC

    skipghost09:

    mov eax,4

    call randomrange 

    cmp eax,0
    jne continue09

    cmp ycoordinateghost,5
    jne continue21gg09

    cmp xcoordinateghost,4
    je skipghost09

    cmp xcoordinateghost,54
    je skipghost09

    cmp xcoordinateghost,79
    je skipghost09

    cmp xcoordinateghost,104
    je skipghost09

    cmp xcoordinateghost,29
    je skipghost09

    continue21gg09:

    cmp ycoordinateghost,12
    jne continue31gg09

    cmp xcoordinateghost,4
    je skipghost09

    cmp xcoordinateghost,54
    je skipghost09

    cmp xcoordinateghost,79
    je skipghost09

    cmp xcoordinateghost,104
    je skipghost09

    cmp xcoordinateghost,29
    je skipghost09

    cmp xcoordinateghost,46
    je skipghost09

    cmp xcoordinateghost,71
    je skipghost09

    continue31gg09:

    cmp ycoordinateghost,19
    jne continue41gg09

    cmp xcoordinateghost,4
    je skipghost09

    cmp xcoordinateghost,29
    je skipghost09

    cmp xcoordinateghost,54
    je skipghost09

    cmp xcoordinateghost,79
    je skipghost09

    cmp xcoordinateghost,104
    je skipghost09

    cmp xcoordinateghost,46
    je skipghost09

    cmp xcoordinateghost,71
    je skipghost09

    continue41gg09:

    cmp ycoordinateghost,26
    jne continue51gg09

    cmp xcoordinateghost,4
    je skipghost09

    cmp xcoordinateghost,54
    je skipghost09

    cmp xcoordinateghost,79
    je skipghost09

    cmp xcoordinateghost,104
    je skipghost09

    cmp xcoordinateghost,29
    je skipghost09

    continue51gg09:

    cmp ycoordinateghost,8
    jne continue610gg9

    cmp xcoordinateghost,16
    je skipghost09

    cmp xcoordinateghost,54
    je skipghost09

    cmp xcoordinateghost,92
    je skipghost09

    cmp xcoordinateghost,46
    je skipghost09

    cmp xcoordinateghost,71
    je skipghost09

    continue610gg9:

    cmp ycoordinateghost,15
    jne continue710gg9

    cmp xcoordinateghost,16
    je skipghost09

    cmp xcoordinateghost,54
    je skipghost09

    cmp xcoordinateghost,92
    je skipghost09

    cmp xcoordinateghost,46
    je skipghost09

    cmp xcoordinateghost,71
    je skipghost09

    continue710gg9:

    cmp ycoordinateghost,23
    jne continue810gg9

    cmp xcoordinateghost,16
    je skipghost09

    cmp xcoordinateghost,54
    je skipghost09

    cmp xcoordinateghost,92
    je skipghost09

    cmp xcoordinateghost,46
    je skipghost09

    cmp xcoordinateghost,71
    je skipghost09

    continue810gg9:

    cmp ycoordinateghost,9
    jne continueqqq90z

    cmp xcoordinateghost,46
    je skipghost09

    cmp xcoordinateghost,71
    je skipghost09

    continueqqq90z:

    cmp ycoordinateghost,10
    jne continueqqq100z

    cmp xcoordinateghost,46
    je skipghost09

    cmp xcoordinateghost,71
    je skipghost09

    continueqqq100z:

    cmp ycoordinateghost,11
    jne continueqqq101z

    cmp xcoordinateghost,46
    je skipghost09

    cmp xcoordinateghost,71
    je skipghost09

    continueqqq101z:

    cmp ycoordinateghost,13
    jne continueqqq102z

    cmp xcoordinateghost,46
    je skipghost09

    cmp xcoordinateghost,71
    je skipghost09

    continueqqq102z:

    cmp ycoordinateghost,14
    jne continueqqq103z

    cmp xcoordinateghost,46
    je skipghost09

    cmp xcoordinateghost,71
    je skipghost09

    continueqqq103z:

    cmp ycoordinateghost,16
    jne continueqqq104z

    cmp xcoordinateghost,46
    je skipghost09

    cmp xcoordinateghost,71
    je skipghost09

    continueqqq104z:

    cmp ycoordinateghost,17
    jne continueqqq105z

    cmp xcoordinateghost,46
    je skipghost09

    cmp xcoordinateghost,71
    je skipghost09

    continueqqq105z:

    cmp ycoordinateghost,18
    jne continueqqq106z

    cmp xcoordinateghost,46
    je skipghost09

    cmp xcoordinateghost,71
    je skipghost09

    continueqqq106z:

    cmp ycoordinateghost,20
    jne continueqqq107z

    cmp xcoordinateghost,46
    je skipghost09

    cmp xcoordinateghost,71
    je skipghost09

    continueqqq107z:

    cmp ycoordinateghost,21
    jne continueqqq108z

    cmp xcoordinateghost,46
    je skipghost09

    cmp xcoordinateghost,71
    je skipghost09

    continueqqq108z:

    cmp ycoordinateghost,22
    jne continueqqq109z

    cmp xcoordinateghost,46
    je skipghost09

    cmp xcoordinateghost,71
    je skipghost09

    continueqqq109z:

    cmp xcoordinateghost, 118
    je skipghost09

    inc xcoordinateghost

    ret

    continue09:

    cmp eax,1
    jne continue209
    
    cmp ycoordinateghost,6
    jne continuegg09
    je row1gg09
         
    row1gg09:

    cmp xcoordinateghost,4
    jle continuegg09

    cmp xcoordinateghost,14
    jle skipghost09

    cmp xcoordinateghost,29
    jle continuegg09

    cmp xcoordinateghost,39
    jle skipghost09

    cmp xcoordinateghost,54
    jle continuegg09

    cmp xcoordinateghost,64
    jle skipghost09

    cmp xcoordinateghost,79
    jle continuegg09

    cmp xcoordinateghost,89
    jle skipghost09

    cmp xcoordinateghost,104
    jle continuegg09

    cmp xcoordinateghost,114
    jle skipghost09
        
    continuegg09:

    row2gg09:

    cmp ycoordinateghost,13
    jne row3gg09

    cmp xcoordinateghost,4
    jle row3gg09

    cmp xcoordinateghost,14
    jle skipghost09

    cmp xcoordinateghost,29
    jle row3gg09

    cmp xcoordinateghost,39
    jle skipghost09

    cmp xcoordinateghost,54
    jle row3gg09

    cmp xcoordinateghost,64
    jle skipghost09

    cmp xcoordinateghost,79
    jle row3gg09

    cmp xcoordinateghost,89
    jle skipghost09

    cmp xcoordinateghost,104
    jle row3gg09

    cmp xcoordinateghost,114
    jle skipghost09

    row3gg09:

    cmp ycoordinateghost,20
    jne row4gg09

    cmp xcoordinateghost,4
    jle row4gg09

    cmp xcoordinateghost,14
    jle skipghost09

    cmp xcoordinateghost,29
    jle row4gg09

    cmp xcoordinateghost,39
    jle skipghost09

    cmp xcoordinateghost,54
    jle row4gg09

    cmp xcoordinateghost,64
    jle skipghost09

    cmp xcoordinateghost,79
    jle row4gg09

    cmp xcoordinateghost,89
    jle skipghost09

    cmp xcoordinateghost,104
    jle row4gg09

    cmp xcoordinateghost,114
    jle skipghost09

    row4gg09:

    cmp ycoordinateghost,27
    jne goongg09

    cmp xcoordinateghost,4
    jle goongg09

    cmp xcoordinateghost,14
    jle skipghost09

    cmp xcoordinateghost,29
    jle goongg09

    cmp xcoordinateghost,39
    jle skipghost09

    cmp xcoordinateghost,54
    jle goongg09

    cmp xcoordinateghost,64
    jle skipghost09

    cmp xcoordinateghost,79
    jle goongg09

    cmp xcoordinateghost,89
    jle skipghost09

    cmp xcoordinateghost,104
    jle goongg09

    cmp xcoordinateghost,114
    jle skipghost09

    goongg09:

    cmp ycoordinateghost, 9
    jne nocoll0g9

    cmp xcoordinateghost, 16
    jle nocoll0g9

    cmp xcoordinateghost, 26
    jle skipghost09

    cmp xcoordinateghost, 54
    jle nocoll0g9

    cmp xcoordinateghost, 64
    jle skipghost09

    cmp xcoordinateghost, 92
    jle nocoll0g9

    cmp xcoordinateghost, 102
    jle skipghost09

    nocoll0g9:

    cmp ycoordinateghost, 16
    jne row6gg9

    cmp xcoordinateghost, 16
    jle row6gg9

    cmp xcoordinateghost, 26
    jle skipghost09

    cmp xcoordinateghost, 54
    jle row6gg9

    cmp xcoordinateghost, 64
    jle skipghost09

    cmp xcoordinateghost, 92
    jle row6gg9

    cmp xcoordinateghost, 102
    jle skipghost09

    row6gg9:

    cmp ycoordinateghost, 24
    jne row7gg9

    cmp xcoordinateghost, 16
    jle row7gg9

    cmp xcoordinateghost, 26
    jle skipghost09

    cmp xcoordinateghost, 46
    jle row7gg9

    cmp xcoordinateghost, 47
    jle skipghost09

    cmp xcoordinateghost, 54
    jle row7gg9

    cmp xcoordinateghost, 64
    jle skipghost09

    cmp xcoordinateghost, 71
    jle row7gg9

    cmp xcoordinateghost, 72
    jle skipghost09

    cmp xcoordinateghost, 92
    jle row7gg9

    cmp xcoordinateghost, 102
    jle skipghost09

    row7gg9:

    cmp ycoordinateghost, 2
    je skipghost09

    dec ycoordinateghost

    ret

    continue209:

    cmp eax,2
    jne continue309

    cmp ycoordinateghost,4
    jne continue1gg09
    je row11gg09
         
    row11gg09:

    cmp xcoordinateghost,4
    jle continue1gg09
    
    cmp xcoordinateghost,14
    jle skipghost09

    cmp xcoordinateghost,29
    jle continue1gg09

    cmp xcoordinateghost,39
    jle skipghost09

    cmp xcoordinateghost,54
    jle continue1gg09

    cmp xcoordinateghost,64
    jle skipghost09

    cmp xcoordinateghost,79
    jle continue1gg09

    cmp xcoordinateghost,89
    jle skipghost09

    cmp xcoordinateghost,104
    jle continue1gg09

    cmp xcoordinateghost,114
    jle skipghost09

    continue1gg09:

    row21gg09:

    cmp ycoordinateghost,11
    jne row31gg09

    cmp xcoordinateghost,4
    jle row31gg09

    cmp xcoordinateghost,14
    jle skipghost09

    cmp xcoordinateghost,29
    jle row31gg09

    cmp xcoordinateghost,39
    jle skipghost09

    cmp xcoordinateghost,54
    jle row31gg09

    cmp xcoordinateghost,64
    jle skipghost09

    cmp xcoordinateghost,79
    jle row31gg09

    cmp xcoordinateghost,89
    jle skipghost09

    cmp xcoordinateghost,104
    jle row31gg09
    
    cmp xcoordinateghost,114
    jle skipghost09

    row31gg09:

    cmp ycoordinateghost,18
    jne row41gg09

    cmp xcoordinateghost,4
    jle row41gg09

    cmp xcoordinateghost,14
    jle skipghost09

    cmp xcoordinateghost,29
    jle row41gg09

    cmp xcoordinateghost,39
    jle skipghost09

    cmp xcoordinateghost,54
    jle row41gg09

    cmp xcoordinateghost,64
    jle skipghost09

    cmp xcoordinateghost,79
    jle row41gg09

    cmp xcoordinateghost,89
    jle skipghost09

    cmp xcoordinateghost,104
    jle row41gg09

    cmp xcoordinateghost,114
    jle skipghost09

    row41gg09:

    cmp ycoordinateghost,25
    jne goon1gg09

    cmp xcoordinateghost,4
    jle goon1gg09

    cmp xcoordinateghost,14
    jle skipghost09

    cmp xcoordinateghost,29
    jle goon1gg09

    cmp xcoordinateghost,39
    jle skipghost09

    cmp xcoordinateghost,54
    jle goon1gg09

    cmp xcoordinateghost,64
    jle skipghost09

    cmp xcoordinateghost,79
    jle goon1gg09

    cmp xcoordinateghost,89
    jle skipghost09

    cmp xcoordinateghost,104
    jle goon1gg09

    cmp xcoordinateghost,114
    jle skipghost09

    goon1gg09:

    cmp ycoordinateghost, 7
    jne nocoll1gg9

    cmp xcoordinateghost, 16
    jle nocoll1gg9

    cmp xcoordinateghost, 26
    jle skipghost09

    cmp xcoordinateghost, 46
    jle nocoll1gg9

    cmp xcoordinateghost, 47
    jle skipghost09

    cmp xcoordinateghost, 54
    jle nocoll1gg9

    cmp xcoordinateghost, 64
    jle skipghost09

    cmp xcoordinateghost, 71
    jle nocoll1gg9

    cmp xcoordinateghost, 72
    jle skipghost09

    cmp xcoordinateghost, 92
    jle nocoll1gg9

    cmp xcoordinateghost, 102
    jle skipghost09

    nocoll1gg9:

    cmp ycoordinateghost, 14
    jne nocoll12gg9

    cmp xcoordinateghost, 16
    jle nocoll12gg9

    cmp xcoordinateghost, 26
    jle skipghost09

    cmp xcoordinateghost, 54
    jle nocoll12gg9

    cmp xcoordinateghost, 64
    jle skipghost09

    cmp xcoordinateghost, 92
    jle nocoll12gg9

    cmp xcoordinateghost, 102
    jle skipghost09

    nocoll12gg9:

    cmp ycoordinateghost, 22
    jne nocoll13gg9

    cmp xcoordinateghost, 16
    jle nocoll13gg9

    cmp xcoordinateghost, 26
    jle skipghost09

    cmp xcoordinateghost, 54
    jle nocoll13gg9

    cmp xcoordinateghost, 64
    jle skipghost09

    cmp xcoordinateghost, 92
    jle nocoll13gg9
            
    cmp xcoordinateghost, 102
    jle skipghost09

    nocoll13gg9:

    cmp ycoordinateghost, 28
    je skipghost09
    
    inc ycoordinateghost

    ret

    continue309:

    cmp ycoordinateghost,5
    jne continue2gg09

    cmp xcoordinateghost,115
    je skipghost09

    cmp xcoordinateghost,90
    je skipghost09

    cmp xcoordinateghost,65
    je skipghost09

    cmp xcoordinateghost,40
    je skipghost09

    cmp xcoordinateghost,15
    je skipghost09

    continue2gg09:

    cmp ycoordinateghost,12
    jne continue3gg09

    cmp xcoordinateghost,115
    je skipghost09

    cmp xcoordinateghost,90
    je skipghost09

    cmp xcoordinateghost,65
    je skipghost09

    cmp xcoordinateghost,40
    je skipghost09

    cmp xcoordinateghost,15
    je skipghost09

    cmp xcoordinateghost,48
    je skipghost09

    cmp xcoordinateghost,73
    je skipghost09

    continue3gg09:

    cmp ycoordinateghost,19
    jne continue4gg09

    cmp xcoordinateghost,115
    je skipghost09

    cmp xcoordinateghost,90
    je skipghost09

    cmp xcoordinateghost,65
    je skipghost09

    cmp xcoordinateghost,40
    je skipghost09

    cmp xcoordinateghost,15
    je skipghost09

    cmp xcoordinateghost,48
    je skipghost09

    cmp xcoordinateghost,73
    je skipghost09

    continue4gg09:

    cmp ycoordinateghost,26
    jne continue5gg09

    cmp xcoordinateghost,115
    je skipghost09

    cmp xcoordinateghost,90
    je skipghost09

    cmp xcoordinateghost,65
    je skipghost09

    cmp xcoordinateghost,40
    je skipghost09

    cmp xcoordinateghost,15
    je skipghost09

    continue5gg09:

    cmp ycoordinateghost,8
    jne continue60gg9

    cmp xcoordinateghost,103
    je skipghost09

    cmp xcoordinateghost,65
    je skipghost09

    cmp xcoordinateghost,27
    je skipghost09

    cmp xcoordinateghost,48
    je skipghost09

    cmp xcoordinateghost,73
    je skipghost09

    continue60gg9:

    cmp ycoordinateghost,15
    jne continue70gg9

    cmp xcoordinateghost,103
    je skipghost09

    cmp xcoordinateghost,65
    je skipghost09

    cmp xcoordinateghost,27
    je skipghost09

    cmp xcoordinateghost,48
    je skipghost09

    cmp xcoordinateghost,73
    je skipghost09

    continue70gg9:

    cmp ycoordinateghost,23
    jne continue80gg9

    cmp xcoordinateghost,103
    je skipghost09

    cmp xcoordinateghost,65
    je skipghost09

    cmp xcoordinateghost,27
    je skipghost09

    cmp xcoordinateghost,48
    je skipghost09

    cmp xcoordinateghost,73
    je skipghost09

    continue80gg9:

    cmp ycoordinateghost,9
    jne continuezz90z

    cmp xcoordinateghost,48
    je skipghost09

    cmp xcoordinateghost,73
    je skipghost09

    continuezz90z:

    cmp ycoordinateghost,10
    jne continuezz100z

    cmp xcoordinateghost,48
    je skipghost09

    cmp xcoordinateghost,73
    je skipghost09

    continuezz100z:

    cmp ycoordinateghost,11
    jne continuezz101z

    cmp xcoordinateghost,48
    je skipghost09

    cmp xcoordinateghost,73
    je skipghost09

    continuezz101z:

    cmp ycoordinateghost,13
    jne continuezz102z

    cmp xcoordinateghost,48
    je skipghost09

    cmp xcoordinateghost,73
    je skipghost09

    continuezz102z:

    cmp ycoordinateghost,14
    jne continuezz103z

    cmp xcoordinateghost,48
    je skipghost09

    cmp xcoordinateghost,73
    je skipghost09

    continuezz103z:

    cmp ycoordinateghost,16
    jne continuezz104z

    cmp xcoordinateghost,48
    je skipghost09

    cmp xcoordinateghost,73
    je skipghost09

    continuezz104z:

    cmp ycoordinateghost,17
    jne continuezz105z

    cmp xcoordinateghost,48
    je skipghost09

    cmp xcoordinateghost,73
    je skipghost09

    continuezz105z:

    cmp ycoordinateghost,18
    jne continuezz106z

    cmp xcoordinateghost,48
    je skipghost09

    cmp xcoordinateghost,73
    je skipghost09

    continuezz106z:

    cmp ycoordinateghost,20
    jne continuezz107z

    cmp xcoordinateghost,48
    je skipghost09

    cmp xcoordinateghost,73
    je skipghost09

    continuezz107z:

    cmp ycoordinateghost,21
    jne continuezz108z

    cmp xcoordinateghost,48
    je skipghost09

    cmp xcoordinateghost,73
    je skipghost09

    continuezz108z:

    cmp ycoordinateghost,22
    jne continuezz109z

    cmp xcoordinateghost,48
    je skipghost09

    cmp xcoordinateghost,73
    je skipghost09

    continuezz109z:

    cmp xcoordinateghost, 1
    je skipghost09

    dec xcoordinateghost 

    ret

ghostmovement31 ENDP

ghostmovement32 PROC

    skipghost092:

    mov eax,4

    call randomrange 

    cmp eax,0
    jne continued09

    cmp ycoordinateghost2,5
    jne continued21gg09

    cmp xcoordinateghost2,4
    je skipghost092

    cmp xcoordinateghost2,54
    je skipghost092

    cmp xcoordinateghost2,79
    je skipghost092

    cmp xcoordinateghost2,104
    je skipghost092

    cmp xcoordinateghost2,29
    je skipghost092

    continued21gg09:

    cmp ycoordinateghost2,12
    jne continued31gg09

    cmp xcoordinateghost2,4
    je skipghost092

    cmp xcoordinateghost2,54
    je skipghost092

    cmp xcoordinateghost2,79
    je skipghost092

    cmp xcoordinateghost2,104
    je skipghost092

    cmp xcoordinateghost2,29
    je skipghost092

    cmp xcoordinateghost2,46
    je skipghost092

    cmp xcoordinateghost2,71
    je skipghost092

    continued31gg09:

    cmp ycoordinateghost2,19
    jne continued41gg09

    cmp xcoordinateghost2,4
    je skipghost092

    cmp xcoordinateghost2,29
    je skipghost092

    cmp xcoordinateghost2,54
    je skipghost092

    cmp xcoordinateghost2,79
    je skipghost092

    cmp xcoordinateghost2,104
    je skipghost092

    cmp xcoordinateghost2,46
    je skipghost092

    cmp xcoordinateghost2,71
    je skipghost092

    continued41gg09:

    cmp ycoordinateghost2,26
    jne continued51gg09

    cmp xcoordinateghost2,4
    je skipghost092

    cmp xcoordinateghost2,54
    je skipghost092

    cmp xcoordinateghost2,79
    je skipghost092

    cmp xcoordinateghost2,104
    je skipghost092

    cmp xcoordinateghost2,29
    je skipghost092

    continued51gg09:

    cmp ycoordinateghost2,8
    jne continued610gg9

    cmp xcoordinateghost2,16
    je skipghost092

    cmp xcoordinateghost2,54
    je skipghost092

    cmp xcoordinateghost2,92
    je skipghost092

    cmp xcoordinateghost2,46
    je skipghost092

    cmp xcoordinateghost2,71
    je skipghost092

    continued610gg9:

    cmp ycoordinateghost2,15
    jne continued710gg9

    cmp xcoordinateghost2,16
    je skipghost092

    cmp xcoordinateghost2,54
    je skipghost092

    cmp xcoordinateghost2,92
    je skipghost092

    cmp xcoordinateghost2,46
    je skipghost092

    cmp xcoordinateghost2,71
    je skipghost092

    continued710gg9:

    cmp ycoordinateghost2,23
    jne continued810gg9

    cmp xcoordinateghost2,16
    je skipghost092

    cmp xcoordinateghost2,54
    je skipghost092

    cmp xcoordinateghost2,92
    je skipghost092

    cmp xcoordinateghost2,46
    je skipghost092

    cmp xcoordinateghost2,71
    je skipghost092

    continued810gg9:

    cmp ycoordinateghost2,9
    jne continuedqqq90z

    cmp xcoordinateghost2,46
    je skipghost092

    cmp xcoordinateghost2,71
    je skipghost092

    continuedqqq90z:

    cmp ycoordinateghost2,10
    jne continuedqqq100z

    cmp xcoordinateghost2,46
    je skipghost092

    cmp xcoordinateghost2,71
    je skipghost092

    continuedqqq100z:

    cmp ycoordinateghost2,11
    jne continuedqqq101z

    cmp xcoordinateghost2,46
    je skipghost092

    cmp xcoordinateghost2,71
    je skipghost092

    continuedqqq101z:

    cmp ycoordinateghost2,13
    jne continuedqqq102z

    cmp xcoordinateghost2,46
    je skipghost092

    cmp xcoordinateghost2,71
    je skipghost092

    continuedqqq102z:

    cmp ycoordinateghost2,14
    jne continuedqqq103z

    cmp xcoordinateghost2,46
    je skipghost092

    cmp xcoordinateghost2,71
    je skipghost092

    continuedqqq103z:

    cmp ycoordinateghost2,16
    jne continuedqqq104z

    cmp xcoordinateghost2,46
    je skipghost092

    cmp xcoordinateghost2,71
    je skipghost092

    continuedqqq104z:

    cmp ycoordinateghost2,17
    jne continuedqqq105z

    cmp xcoordinateghost2,46
    je skipghost092

    cmp xcoordinateghost2,71
    je skipghost092

    continuedqqq105z:

    cmp ycoordinateghost2,18
    jne continuedqqq106z

    cmp xcoordinateghost2,46
    je skipghost092

    cmp xcoordinateghost2,71
    je skipghost092

    continuedqqq106z:

    cmp ycoordinateghost2,20
    jne continuedqqq107z

    cmp xcoordinateghost2,46
    je skipghost092

    cmp xcoordinateghost2,71
    je skipghost092

    continuedqqq107z:

    cmp ycoordinateghost2,21
    jne continuedqqq108z

    cmp xcoordinateghost2,46
    je skipghost092

    cmp xcoordinateghost2,71
    je skipghost092

    continuedqqq108z:

    cmp ycoordinateghost2,22
    jne continuedqqq109z

    cmp xcoordinateghost2,46
    je skipghost092

    cmp xcoordinateghost2,71
    je skipghost092

    continuedqqq109z:

    cmp xcoordinateghost2, 118
    je skipghost092

    inc xcoordinateghost2

    ret

    continued09:

    cmp eax,1
    jne continued209
    
    cmp ycoordinateghost2,6
    jne continuedgg09
    je rowd1gg09
         
    rowd1gg09:

    cmp xcoordinateghost2,4
    jle continuedgg09

    cmp xcoordinateghost2,14
    jle skipghost092

    cmp xcoordinateghost2,29
    jle continuedgg09

    cmp xcoordinateghost2,39
    jle skipghost092

    cmp xcoordinateghost2,54
    jle continuedgg09

    cmp xcoordinateghost2,64
    jle skipghost092

    cmp xcoordinateghost2,79
    jle continuedgg09

    cmp xcoordinateghost2,89
    jle skipghost092

    cmp xcoordinateghost2,104
    jle continuedgg09

    cmp xcoordinateghost2,114
    jle skipghost092
        
    continuedgg09:

    rowd2gg09:

    cmp ycoordinateghost2,13
    jne rowd3gg09

    cmp xcoordinateghost2,4
    jle rowd3gg09

    cmp xcoordinateghost2,14
    jle skipghost092

    cmp xcoordinateghost2,29
    jle rowd3gg09

    cmp xcoordinateghost2,39
    jle skipghost092

    cmp xcoordinateghost2,54
    jle rowd3gg09

    cmp xcoordinateghost2,64
    jle skipghost092

    cmp xcoordinateghost2,79
    jle rowd3gg09

    cmp xcoordinateghost2,89
    jle skipghost092

    cmp xcoordinateghost2,104
    jle rowd3gg09

    cmp xcoordinateghost2,114
    jle skipghost092

    rowd3gg09:

    cmp ycoordinateghost2,20
    jne rowd4gg09

    cmp xcoordinateghost2,4
    jle rowd4gg09

    cmp xcoordinateghost2,14
    jle skipghost092

    cmp xcoordinateghost2,29
    jle rowd4gg09

    cmp xcoordinateghost2,39
    jle skipghost092

    cmp xcoordinateghost2,54
    jle rowd4gg09

    cmp xcoordinateghost2,64
    jle skipghost092

    cmp xcoordinateghost2,79
    jle rowd4gg09

    cmp xcoordinateghost2,89
    jle skipghost092

    cmp xcoordinateghost2,104
    jle rowd4gg09

    cmp xcoordinateghost2,114
    jle skipghost092

    rowd4gg09:

    cmp ycoordinateghost2,27
    jne goongg09

    cmp xcoordinateghost2,4
    jle goongg09

    cmp xcoordinateghost2,14
    jle skipghost092

    cmp xcoordinateghost2,29
    jle goongg09

    cmp xcoordinateghost2,39
    jle skipghost092

    cmp xcoordinateghost2,54
    jle goongg09

    cmp xcoordinateghost2,64
    jle skipghost092

    cmp xcoordinateghost2,79
    jle goongg09

    cmp xcoordinateghost2,89
    jle skipghost092

    cmp xcoordinateghost2,104
    jle goongg09

    cmp xcoordinateghost2,114
    jle skipghost092

    goongg09:

    cmp ycoordinateghost2, 9
    jne nocoll0g9

    cmp xcoordinateghost2, 16
    jle nocoll0g9

    cmp xcoordinateghost2, 26
    jle skipghost092

    cmp xcoordinateghost2, 54
    jle nocoll0g9

    cmp xcoordinateghost2, 64
    jle skipghost092

    cmp xcoordinateghost2, 92
    jle nocoll0g9

    cmp xcoordinateghost2, 102
    jle skipghost092

    nocoll0g9:

    cmp ycoordinateghost2, 16
    jne rowd6gg9

    cmp xcoordinateghost2, 16
    jle rowd6gg9

    cmp xcoordinateghost2, 26
    jle skipghost092

    cmp xcoordinateghost2, 54
    jle rowd6gg9

    cmp xcoordinateghost2, 64
    jle skipghost092

    cmp xcoordinateghost2, 92
    jle rowd6gg9

    cmp xcoordinateghost2, 102
    jle skipghost092

    rowd6gg9:

    cmp ycoordinateghost2, 24
    jne rowd7gg9

    cmp xcoordinateghost2, 16
    jle rowd7gg9

    cmp xcoordinateghost2, 26
    jle skipghost092

    cmp xcoordinateghost2, 46
    jle rowd7gg9

    cmp xcoordinateghost2, 47
    jle skipghost092

    cmp xcoordinateghost2, 54
    jle rowd7gg9

    cmp xcoordinateghost2, 64
    jle skipghost092

    cmp xcoordinateghost2, 71
    jle rowd7gg9

    cmp xcoordinateghost2, 72
    jle skipghost092

    cmp xcoordinateghost2, 92
    jle rowd7gg9

    cmp xcoordinateghost2, 102
    jle skipghost092

    rowd7gg9:

    cmp ycoordinateghost2, 2
    je skipghost092

    dec ycoordinateghost2

    ret

    continued209:

    cmp eax,2
    jne continued309

    cmp ycoordinateghost2,4
    jne continued1gg09
    je rowd11gg09
         
    rowd11gg09:

    cmp xcoordinateghost2,4
    jle continued1gg09
    
    cmp xcoordinateghost2,14
    jle skipghost092

    cmp xcoordinateghost2,29
    jle continued1gg09

    cmp xcoordinateghost2,39
    jle skipghost092

    cmp xcoordinateghost2,54
    jle continued1gg09

    cmp xcoordinateghost2,64
    jle skipghost092

    cmp xcoordinateghost2,79
    jle continued1gg09

    cmp xcoordinateghost2,89
    jle skipghost092

    cmp xcoordinateghost2,104
    jle continued1gg09

    cmp xcoordinateghost2,114
    jle skipghost092

    continued1gg09:

    rowd21gg09:

    cmp ycoordinateghost2,11
    jne rowd31gg09

    cmp xcoordinateghost2,4
    jle rowd31gg09

    cmp xcoordinateghost2,14
    jle skipghost092

    cmp xcoordinateghost2,29
    jle rowd31gg09

    cmp xcoordinateghost2,39
    jle skipghost092

    cmp xcoordinateghost2,54
    jle rowd31gg09

    cmp xcoordinateghost2,64
    jle skipghost092

    cmp xcoordinateghost2,79
    jle rowd31gg09

    cmp xcoordinateghost2,89
    jle skipghost092

    cmp xcoordinateghost2,104
    jle rowd31gg09
    
    cmp xcoordinateghost2,114
    jle skipghost092

    rowd31gg09:

    cmp ycoordinateghost2,18
    jne rowd41gg09

    cmp xcoordinateghost2,4
    jle rowd41gg09

    cmp xcoordinateghost2,14
    jle skipghost092

    cmp xcoordinateghost2,29
    jle rowd41gg09

    cmp xcoordinateghost2,39
    jle skipghost092

    cmp xcoordinateghost2,54
    jle rowd41gg09

    cmp xcoordinateghost2,64
    jle skipghost092

    cmp xcoordinateghost2,79
    jle rowd41gg09

    cmp xcoordinateghost2,89
    jle skipghost092

    cmp xcoordinateghost2,104
    jle rowd41gg09

    cmp xcoordinateghost2,114
    jle skipghost092

    rowd41gg09:

    cmp ycoordinateghost2,25
    jne goon1gg09

    cmp xcoordinateghost2,4
    jle goon1gg09

    cmp xcoordinateghost2,14
    jle skipghost092

    cmp xcoordinateghost2,29
    jle goon1gg09

    cmp xcoordinateghost2,39
    jle skipghost092

    cmp xcoordinateghost2,54
    jle goon1gg09

    cmp xcoordinateghost2,64
    jle skipghost092

    cmp xcoordinateghost2,79
    jle goon1gg09

    cmp xcoordinateghost2,89
    jle skipghost092

    cmp xcoordinateghost2,104
    jle goon1gg09

    cmp xcoordinateghost2,114
    jle skipghost092

    goon1gg09:

    cmp ycoordinateghost2, 7
    jne nocoll1gg9

    cmp xcoordinateghost2, 16
    jle nocoll1gg9

    cmp xcoordinateghost2, 26
    jle skipghost092

    cmp xcoordinateghost2, 46
    jle nocoll1gg9

    cmp xcoordinateghost2, 47
    jle skipghost092

    cmp xcoordinateghost2, 54
    jle nocoll1gg9

    cmp xcoordinateghost2, 64
    jle skipghost092

    cmp xcoordinateghost2, 71
    jle nocoll1gg9

    cmp xcoordinateghost2, 72
    jle skipghost092

    cmp xcoordinateghost2, 92
    jle nocoll1gg9

    cmp xcoordinateghost2, 102
    jle skipghost092

    nocoll1gg9:

    cmp ycoordinateghost2, 14
    jne nocoll12gg9

    cmp xcoordinateghost2, 16
    jle nocoll12gg9

    cmp xcoordinateghost2, 26
    jle skipghost092

    cmp xcoordinateghost2, 54
    jle nocoll12gg9

    cmp xcoordinateghost2, 64
    jle skipghost092

    cmp xcoordinateghost2, 92
    jle nocoll12gg9

    cmp xcoordinateghost2, 102
    jle skipghost092

    nocoll12gg9:

    cmp ycoordinateghost2, 22
    jne nocoll13gg9

    cmp xcoordinateghost2, 16
    jle nocoll13gg9

    cmp xcoordinateghost2, 26
    jle skipghost092

    cmp xcoordinateghost2, 54
    jle nocoll13gg9

    cmp xcoordinateghost2, 64
    jle skipghost092

    cmp xcoordinateghost2, 92
    jle nocoll13gg9
            
    cmp xcoordinateghost2, 102
    jle skipghost092

    nocoll13gg9:

    cmp ycoordinateghost2, 28
    je skipghost092
    
    inc ycoordinateghost2

    ret

    continued309:

    cmp ycoordinateghost2,5
    jne continued2gg09

    cmp xcoordinateghost2,115
    je skipghost092

    cmp xcoordinateghost2,90
    je skipghost092

    cmp xcoordinateghost2,65
    je skipghost092

    cmp xcoordinateghost2,40
    je skipghost092

    cmp xcoordinateghost2,15
    je skipghost092

    continued2gg09:

    cmp ycoordinateghost2,12
    jne continued3gg09

    cmp xcoordinateghost2,115
    je skipghost092

    cmp xcoordinateghost2,90
    je skipghost092

    cmp xcoordinateghost2,65
    je skipghost092

    cmp xcoordinateghost2,40
    je skipghost092

    cmp xcoordinateghost2,15
    je skipghost092

    cmp xcoordinateghost2,48
    je skipghost092

    cmp xcoordinateghost2,73
    je skipghost092

    continued3gg09:

    cmp ycoordinateghost2,19
    jne continued4gg09

    cmp xcoordinateghost2,115
    je skipghost092

    cmp xcoordinateghost2,90
    je skipghost092

    cmp xcoordinateghost2,65
    je skipghost092

    cmp xcoordinateghost2,40
    je skipghost092

    cmp xcoordinateghost2,15
    je skipghost092

    cmp xcoordinateghost2,48
    je skipghost092

    cmp xcoordinateghost2,73
    je skipghost092

    continued4gg09:

    cmp ycoordinateghost2,26
    jne continued5gg09

    cmp xcoordinateghost2,115
    je skipghost092

    cmp xcoordinateghost2,90
    je skipghost092

    cmp xcoordinateghost2,65
    je skipghost092

    cmp xcoordinateghost2,40
    je skipghost092

    cmp xcoordinateghost2,15
    je skipghost092

    continued5gg09:

    cmp ycoordinateghost2,8
    jne continued60gg9

    cmp xcoordinateghost2,103
    je skipghost092

    cmp xcoordinateghost2,65
    je skipghost092

    cmp xcoordinateghost2,27
    je skipghost092

    cmp xcoordinateghost2,48
    je skipghost092

    cmp xcoordinateghost2,73
    je skipghost092

    continued60gg9:

    cmp ycoordinateghost2,15
    jne continued70gg9

    cmp xcoordinateghost2,103
    je skipghost092

    cmp xcoordinateghost2,65
    je skipghost092

    cmp xcoordinateghost2,27
    je skipghost092

    cmp xcoordinateghost2,48
    je skipghost092

    cmp xcoordinateghost2,73
    je skipghost092

    continued70gg9:

    cmp ycoordinateghost2,23
    jne continued80gg9

    cmp xcoordinateghost2,103
    je skipghost092

    cmp xcoordinateghost2,65
    je skipghost092

    cmp xcoordinateghost2,27
    je skipghost092

    cmp xcoordinateghost2,48
    je skipghost092

    cmp xcoordinateghost2,73
    je skipghost092

    continued80gg9:

    cmp ycoordinateghost2,9
    jne continuedzz90z

    cmp xcoordinateghost2,48
    je skipghost092

    cmp xcoordinateghost2,73
    je skipghost092

    continuedzz90z:

    cmp ycoordinateghost2,10
    jne continuedzz100z

    cmp xcoordinateghost2,48
    je skipghost092

    cmp xcoordinateghost2,73
    je skipghost092

    continuedzz100z:

    cmp ycoordinateghost2,11
    jne continuedzz101z

    cmp xcoordinateghost2,48
    je skipghost092

    cmp xcoordinateghost2,73
    je skipghost092

    continuedzz101z:

    cmp ycoordinateghost2,13
    jne continuedzz102z

    cmp xcoordinateghost2,48
    je skipghost092

    cmp xcoordinateghost2,73
    je skipghost092

    continuedzz102z:

    cmp ycoordinateghost2,14
    jne continuedzz103z

    cmp xcoordinateghost2,48
    je skipghost092

    cmp xcoordinateghost2,73
    je skipghost092

    continuedzz103z:

    cmp ycoordinateghost2,16
    jne continuedzz104z

    cmp xcoordinateghost2,48
    je skipghost092

    cmp xcoordinateghost2,73
    je skipghost092

    continuedzz104z:

    cmp ycoordinateghost2,17
    jne continuedzz105z

    cmp xcoordinateghost2,48
    je skipghost092

    cmp xcoordinateghost2,73
    je skipghost092

    continuedzz105z:

    cmp ycoordinateghost2,18
    jne continuedzz106z

    cmp xcoordinateghost2,48
    je skipghost092

    cmp xcoordinateghost2,73
    je skipghost092

    continuedzz106z:

    cmp ycoordinateghost2,20
    jne continuedzz107z

    cmp xcoordinateghost2,48
    je skipghost092

    cmp xcoordinateghost2,73
    je skipghost092

    continuedzz107z:

    cmp ycoordinateghost2,21
    jne continuedzz108z

    cmp xcoordinateghost2,48
    je skipghost092

    cmp xcoordinateghost2,73
    je skipghost092

    continuedzz108z:

    cmp ycoordinateghost2,22
    jne continuedzz109z

    cmp xcoordinateghost2,48
    je skipghost092

    cmp xcoordinateghost2,73
    je skipghost092

    continuedzz109z:

    cmp xcoordinateghost2, 1
    je skipghost092

    dec xcoordinateghost2 

    ret

ghostmovement32 ENDP

ghostmovement33 PROC

    skipghost093:

    mov eax,4

    call randomrange 

    cmp eax,0
    jne continuet09

    cmp ycoordinateghost3,5
    jne continuet21gg09

    cmp xcoordinateghost3,4
    je skipghost093

    cmp xcoordinateghost3,54
    je skipghost093

    cmp xcoordinateghost3,79
    je skipghost093

    cmp xcoordinateghost3,104
    je skipghost093

    cmp xcoordinateghost3,29
    je skipghost093

    continuet21gg09:

    cmp ycoordinateghost3,12
    jne continuet31gg09

    cmp xcoordinateghost3,4
    je skipghost093

    cmp xcoordinateghost3,54
    je skipghost093

    cmp xcoordinateghost3,79
    je skipghost093

    cmp xcoordinateghost3,104
    je skipghost093

    cmp xcoordinateghost3,29
    je skipghost093

    cmp xcoordinateghost3,46
    je skipghost093

    cmp xcoordinateghost3,71
    je skipghost093

    continuet31gg09:

    cmp ycoordinateghost3,19
    jne continuet41gg09

    cmp xcoordinateghost3,4
    je skipghost093

    cmp xcoordinateghost3,29
    je skipghost093

    cmp xcoordinateghost3,54
    je skipghost093

    cmp xcoordinateghost3,79
    je skipghost093

    cmp xcoordinateghost3,104
    je skipghost093

    cmp xcoordinateghost3,46
    je skipghost093

    cmp xcoordinateghost3,71
    je skipghost093

    continuet41gg09:

    cmp ycoordinateghost3,26
    jne continuet51gg09

    cmp xcoordinateghost3,4
    je skipghost093

    cmp xcoordinateghost3,54
    je skipghost093

    cmp xcoordinateghost3,79
    je skipghost093

    cmp xcoordinateghost3,104
    je skipghost093

    cmp xcoordinateghost3,29
    je skipghost093

    continuet51gg09:

    cmp ycoordinateghost3,8
    jne continuet610gg9

    cmp xcoordinateghost3,16
    je skipghost093

    cmp xcoordinateghost3,54
    je skipghost093

    cmp xcoordinateghost3,92
    je skipghost093

    cmp xcoordinateghost3,46
    je skipghost093

    cmp xcoordinateghost3,71
    je skipghost093

    continuet610gg9:

    cmp ycoordinateghost3,15
    jne continuet710gg9

    cmp xcoordinateghost3,16
    je skipghost093

    cmp xcoordinateghost3,54
    je skipghost093

    cmp xcoordinateghost3,92
    je skipghost093

    cmp xcoordinateghost3,46
    je skipghost093

    cmp xcoordinateghost3,71
    je skipghost093

    continuet710gg9:

    cmp ycoordinateghost3,23
    jne continuet810gg9

    cmp xcoordinateghost3,16
    je skipghost093

    cmp xcoordinateghost3,54
    je skipghost093

    cmp xcoordinateghost3,92
    je skipghost093

    cmp xcoordinateghost3,46
    je skipghost093

    cmp xcoordinateghost3,71
    je skipghost093

    continuet810gg9:

    cmp ycoordinateghost3,9
    jne continuetqqq90z

    cmp xcoordinateghost3,46
    je skipghost093

    cmp xcoordinateghost3,71
    je skipghost093

    continuetqqq90z:

    cmp ycoordinateghost3,10
    jne continuetqqq100z

    cmp xcoordinateghost3,46
    je skipghost093

    cmp xcoordinateghost3,71
    je skipghost093

    continuetqqq100z:

    cmp ycoordinateghost3,11
    jne continuetqqq101z

    cmp xcoordinateghost3,46
    je skipghost093

    cmp xcoordinateghost3,71
    je skipghost093

    continuetqqq101z:

    cmp ycoordinateghost3,13
    jne continuetqqq102z

    cmp xcoordinateghost3,46
    je skipghost093

    cmp xcoordinateghost3,71
    je skipghost093

    continuetqqq102z:

    cmp ycoordinateghost3,14
    jne continuetqqq103z

    cmp xcoordinateghost3,46
    je skipghost093

    cmp xcoordinateghost3,71
    je skipghost093

    continuetqqq103z:

    cmp ycoordinateghost3,16
    jne continuetqqq104z

    cmp xcoordinateghost3,46
    je skipghost093

    cmp xcoordinateghost3,71
    je skipghost093

    continuetqqq104z:

    cmp ycoordinateghost3,17
    jne continuetqqq105z

    cmp xcoordinateghost3,46
    je skipghost093

    cmp xcoordinateghost3,71
    je skipghost093

    continuetqqq105z:

    cmp ycoordinateghost3,18
    jne continuetqqq106z

    cmp xcoordinateghost3,46
    je skipghost093

    cmp xcoordinateghost3,71
    je skipghost093

    continuetqqq106z:

    cmp ycoordinateghost3,20
    jne continuetqqq107z

    cmp xcoordinateghost3,46
    je skipghost093

    cmp xcoordinateghost3,71
    je skipghost093

    continuetqqq107z:

    cmp ycoordinateghost3,21
    jne continuetqqq108z

    cmp xcoordinateghost3,46
    je skipghost093

    cmp xcoordinateghost3,71
    je skipghost093

    continuetqqq108z:

    cmp ycoordinateghost3,22
    jne continuetqqq109z

    cmp xcoordinateghost3,46
    je skipghost093

    cmp xcoordinateghost3,71
    je skipghost093

    continuetqqq109z:

    cmp xcoordinateghost3, 118
    je skipghost093

    inc xcoordinateghost3

    ret

    continuet09:

    cmp eax,1
    jne continuet209
    
    cmp ycoordinateghost3,6
    jne continuetgg09
    je rowt1gg09
         
    rowt1gg09:

    cmp xcoordinateghost3,4
    jle continuetgg09

    cmp xcoordinateghost3,14
    jle skipghost093

    cmp xcoordinateghost3,29
    jle continuetgg09

    cmp xcoordinateghost3,39
    jle skipghost093

    cmp xcoordinateghost3,54
    jle continuetgg09

    cmp xcoordinateghost3,64
    jle skipghost093

    cmp xcoordinateghost3,79
    jle continuetgg09

    cmp xcoordinateghost3,89
    jle skipghost093

    cmp xcoordinateghost3,104
    jle continuetgg09

    cmp xcoordinateghost3,114
    jle skipghost093
        
    continuetgg09:

    rowt2gg09:

    cmp ycoordinateghost3,13
    jne rowt3gg09

    cmp xcoordinateghost3,4
    jle rowt3gg09

    cmp xcoordinateghost3,14
    jle skipghost093

    cmp xcoordinateghost3,29
    jle rowt3gg09

    cmp xcoordinateghost3,39
    jle skipghost093

    cmp xcoordinateghost3,54
    jle rowt3gg09

    cmp xcoordinateghost3,64
    jle skipghost093

    cmp xcoordinateghost3,79
    jle rowt3gg09

    cmp xcoordinateghost3,89
    jle skipghost093

    cmp xcoordinateghost3,104
    jle rowt3gg09

    cmp xcoordinateghost3,114
    jle skipghost093

    rowt3gg09:

    cmp ycoordinateghost3,20
    jne rowt4gg09

    cmp xcoordinateghost3,4
    jle rowt4gg09

    cmp xcoordinateghost3,14
    jle skipghost093

    cmp xcoordinateghost3,29
    jle rowt4gg09

    cmp xcoordinateghost3,39
    jle skipghost093

    cmp xcoordinateghost3,54
    jle rowt4gg09

    cmp xcoordinateghost3,64
    jle skipghost093

    cmp xcoordinateghost3,79
    jle rowt4gg09

    cmp xcoordinateghost3,89
    jle skipghost093

    cmp xcoordinateghost3,104
    jle rowt4gg09

    cmp xcoordinateghost3,114
    jle skipghost093

    rowt4gg09:

    cmp ycoordinateghost3,27
    jne goongg09

    cmp xcoordinateghost3,4
    jle goongg09

    cmp xcoordinateghost3,14
    jle skipghost093

    cmp xcoordinateghost3,29
    jle goongg09

    cmp xcoordinateghost3,39
    jle skipghost093

    cmp xcoordinateghost3,54
    jle goongg09

    cmp xcoordinateghost3,64
    jle skipghost093

    cmp xcoordinateghost3,79
    jle goongg09

    cmp xcoordinateghost3,89
    jle skipghost093

    cmp xcoordinateghost3,104
    jle goongg09

    cmp xcoordinateghost3,114
    jle skipghost093

    goongg09:

    cmp ycoordinateghost3, 9
    jne nocoll0g9

    cmp xcoordinateghost3, 16
    jle nocoll0g9

    cmp xcoordinateghost3, 26
    jle skipghost093

    cmp xcoordinateghost3, 54
    jle nocoll0g9

    cmp xcoordinateghost3, 64
    jle skipghost093

    cmp xcoordinateghost3, 92
    jle nocoll0g9

    cmp xcoordinateghost3, 102
    jle skipghost093

    nocoll0g9:

    cmp ycoordinateghost3, 16
    jne rowt6gg9

    cmp xcoordinateghost3, 16
    jle rowt6gg9

    cmp xcoordinateghost3, 26
    jle skipghost093

    cmp xcoordinateghost3, 54
    jle rowt6gg9

    cmp xcoordinateghost3, 64
    jle skipghost093

    cmp xcoordinateghost3, 92
    jle rowt6gg9

    cmp xcoordinateghost3, 102
    jle skipghost093

    rowt6gg9:

    cmp ycoordinateghost3, 24
    jne rowt7gg9

    cmp xcoordinateghost3, 16
    jle rowt7gg9

    cmp xcoordinateghost3, 26
    jle skipghost093

    cmp xcoordinateghost3, 46
    jle rowt7gg9

    cmp xcoordinateghost3, 47
    jle skipghost093

    cmp xcoordinateghost3, 54
    jle rowt7gg9

    cmp xcoordinateghost3, 64
    jle skipghost093

    cmp xcoordinateghost3, 71
    jle rowt7gg9

    cmp xcoordinateghost3, 72
    jle skipghost093

    cmp xcoordinateghost3, 92
    jle rowt7gg9

    cmp xcoordinateghost3, 102
    jle skipghost093

    rowt7gg9:

    cmp ycoordinateghost3, 2
    je skipghost093

    dec ycoordinateghost3

    ret

    continuet209:

    cmp eax,2
    jne continuet309

    cmp ycoordinateghost3,4
    jne continuet1gg09
    je rowt11gg09
         
    rowt11gg09:

    cmp xcoordinateghost3,4
    jle continuet1gg09
    
    cmp xcoordinateghost3,14
    jle skipghost093

    cmp xcoordinateghost3,29
    jle continuet1gg09

    cmp xcoordinateghost3,39
    jle skipghost093

    cmp xcoordinateghost3,54
    jle continuet1gg09

    cmp xcoordinateghost3,64
    jle skipghost093

    cmp xcoordinateghost3,79
    jle continuet1gg09

    cmp xcoordinateghost3,89
    jle skipghost093

    cmp xcoordinateghost3,104
    jle continuet1gg09

    cmp xcoordinateghost3,114
    jle skipghost093

    continuet1gg09:

    rowt21gg09:

    cmp ycoordinateghost3,11
    jne rowt31gg09

    cmp xcoordinateghost3,4
    jle rowt31gg09

    cmp xcoordinateghost3,14
    jle skipghost093

    cmp xcoordinateghost3,29
    jle rowt31gg09

    cmp xcoordinateghost3,39
    jle skipghost093

    cmp xcoordinateghost3,54
    jle rowt31gg09

    cmp xcoordinateghost3,64
    jle skipghost093

    cmp xcoordinateghost3,79
    jle rowt31gg09

    cmp xcoordinateghost3,89
    jle skipghost093

    cmp xcoordinateghost3,104
    jle rowt31gg09
    
    cmp xcoordinateghost3,114
    jle skipghost093

    rowt31gg09:

    cmp ycoordinateghost3,18
    jne rowt41gg09

    cmp xcoordinateghost3,4
    jle rowt41gg09

    cmp xcoordinateghost3,14
    jle skipghost093

    cmp xcoordinateghost3,29
    jle rowt41gg09

    cmp xcoordinateghost3,39
    jle skipghost093

    cmp xcoordinateghost3,54
    jle rowt41gg09

    cmp xcoordinateghost3,64
    jle skipghost093

    cmp xcoordinateghost3,79
    jle rowt41gg09

    cmp xcoordinateghost3,89
    jle skipghost093

    cmp xcoordinateghost3,104
    jle rowt41gg09

    cmp xcoordinateghost3,114
    jle skipghost093

    rowt41gg09:

    cmp ycoordinateghost3,25
    jne goon1gg09

    cmp xcoordinateghost3,4
    jle goon1gg09

    cmp xcoordinateghost3,14
    jle skipghost093

    cmp xcoordinateghost3,29
    jle goon1gg09

    cmp xcoordinateghost3,39
    jle skipghost093

    cmp xcoordinateghost3,54
    jle goon1gg09

    cmp xcoordinateghost3,64
    jle skipghost093

    cmp xcoordinateghost3,79
    jle goon1gg09

    cmp xcoordinateghost3,89
    jle skipghost093

    cmp xcoordinateghost3,104
    jle goon1gg09

    cmp xcoordinateghost3,114
    jle skipghost093

    goon1gg09:

    cmp ycoordinateghost3, 7
    jne nocoll1gg9

    cmp xcoordinateghost3, 16
    jle nocoll1gg9

    cmp xcoordinateghost3, 26
    jle skipghost093

    cmp xcoordinateghost3, 46
    jle nocoll1gg9

    cmp xcoordinateghost3, 47
    jle skipghost093

    cmp xcoordinateghost3, 54
    jle nocoll1gg9

    cmp xcoordinateghost3, 64
    jle skipghost093

    cmp xcoordinateghost3, 71
    jle nocoll1gg9

    cmp xcoordinateghost3, 72
    jle skipghost093

    cmp xcoordinateghost3, 92
    jle nocoll1gg9

    cmp xcoordinateghost3, 102
    jle skipghost093

    nocoll1gg9:

    cmp ycoordinateghost3, 14
    jne nocoll12gg9

    cmp xcoordinateghost3, 16
    jle nocoll12gg9

    cmp xcoordinateghost3, 26
    jle skipghost093

    cmp xcoordinateghost3, 54
    jle nocoll12gg9

    cmp xcoordinateghost3, 64
    jle skipghost093

    cmp xcoordinateghost3, 92
    jle nocoll12gg9

    cmp xcoordinateghost3, 102
    jle skipghost093

    nocoll12gg9:

    cmp ycoordinateghost3, 22
    jne nocoll13gg9

    cmp xcoordinateghost3, 16
    jle nocoll13gg9

    cmp xcoordinateghost3, 26
    jle skipghost093

    cmp xcoordinateghost3, 54
    jle nocoll13gg9

    cmp xcoordinateghost3, 64
    jle skipghost093

    cmp xcoordinateghost3, 92
    jle nocoll13gg9
            
    cmp xcoordinateghost3, 102
    jle skipghost093

    nocoll13gg9:

    cmp ycoordinateghost3, 28
    je skipghost093
    
    inc ycoordinateghost3

    ret

    continuet309:

    cmp ycoordinateghost3,5
    jne continuet2gg09

    cmp xcoordinateghost3,115
    je skipghost093

    cmp xcoordinateghost3,90
    je skipghost093

    cmp xcoordinateghost3,65
    je skipghost093

    cmp xcoordinateghost3,40
    je skipghost093

    cmp xcoordinateghost3,15
    je skipghost093

    continuet2gg09:

    cmp ycoordinateghost3,12
    jne continuet3gg09

    cmp xcoordinateghost3,115
    je skipghost093

    cmp xcoordinateghost3,90
    je skipghost093

    cmp xcoordinateghost3,65
    je skipghost093

    cmp xcoordinateghost3,40
    je skipghost093

    cmp xcoordinateghost3,15
    je skipghost093

    cmp xcoordinateghost3,48
    je skipghost093

    cmp xcoordinateghost3,73
    je skipghost093

    continuet3gg09:

    cmp ycoordinateghost3,19
    jne continuet4gg09

    cmp xcoordinateghost3,115
    je skipghost093

    cmp xcoordinateghost3,90
    je skipghost093

    cmp xcoordinateghost3,65
    je skipghost093

    cmp xcoordinateghost3,40
    je skipghost093

    cmp xcoordinateghost3,15
    je skipghost093

    cmp xcoordinateghost3,48
    je skipghost093

    cmp xcoordinateghost3,73
    je skipghost093

    continuet4gg09:

    cmp ycoordinateghost3,26
    jne continuet5gg09

    cmp xcoordinateghost3,115
    je skipghost093

    cmp xcoordinateghost3,90
    je skipghost093

    cmp xcoordinateghost3,65
    je skipghost093

    cmp xcoordinateghost3,40
    je skipghost093

    cmp xcoordinateghost3,15
    je skipghost093

    continuet5gg09:

    cmp ycoordinateghost3,8
    jne continuet60gg9

    cmp xcoordinateghost3,103
    je skipghost093

    cmp xcoordinateghost3,65
    je skipghost093

    cmp xcoordinateghost3,27
    je skipghost093

    cmp xcoordinateghost3,48
    je skipghost093

    cmp xcoordinateghost3,73
    je skipghost093

    continuet60gg9:

    cmp ycoordinateghost3,15
    jne continuet70gg9

    cmp xcoordinateghost3,103
    je skipghost093

    cmp xcoordinateghost3,65
    je skipghost093

    cmp xcoordinateghost3,27
    je skipghost093

    cmp xcoordinateghost3,48
    je skipghost093

    cmp xcoordinateghost3,73
    je skipghost093

    continuet70gg9:

    cmp ycoordinateghost3,23
    jne continuet80gg9

    cmp xcoordinateghost3,103
    je skipghost093

    cmp xcoordinateghost3,65
    je skipghost093

    cmp xcoordinateghost3,27
    je skipghost093

    cmp xcoordinateghost3,48
    je skipghost093

    cmp xcoordinateghost3,73
    je skipghost093

    continuet80gg9:

    cmp ycoordinateghost3,9
    jne continuetzz90z

    cmp xcoordinateghost3,48
    je skipghost093

    cmp xcoordinateghost3,73
    je skipghost093

    continuetzz90z:

    cmp ycoordinateghost3,10
    jne continuetzz100z

    cmp xcoordinateghost3,48
    je skipghost093

    cmp xcoordinateghost3,73
    je skipghost093

    continuetzz100z:

    cmp ycoordinateghost3,11
    jne continuetzz101z

    cmp xcoordinateghost3,48
    je skipghost093

    cmp xcoordinateghost3,73
    je skipghost093

    continuetzz101z:

    cmp ycoordinateghost3,13
    jne continuetzz102z

    cmp xcoordinateghost3,48
    je skipghost093

    cmp xcoordinateghost3,73
    je skipghost093

    continuetzz102z:

    cmp ycoordinateghost3,14
    jne continuetzz103z

    cmp xcoordinateghost3,48
    je skipghost093

    cmp xcoordinateghost3,73
    je skipghost093

    continuetzz103z:

    cmp ycoordinateghost3,16
    jne continuetzz104z

    cmp xcoordinateghost3,48
    je skipghost093

    cmp xcoordinateghost3,73
    je skipghost093

    continuetzz104z:

    cmp ycoordinateghost3,17
    jne continuetzz105z

    cmp xcoordinateghost3,48
    je skipghost093

    cmp xcoordinateghost3,73
    je skipghost093

    continuetzz105z:

    cmp ycoordinateghost3,18
    jne continuetzz106z

    cmp xcoordinateghost3,48
    je skipghost093

    cmp xcoordinateghost3,73
    je skipghost093

    continuetzz106z:

    cmp ycoordinateghost3,20
    jne continuetzz107z

    cmp xcoordinateghost3,48
    je skipghost093

    cmp xcoordinateghost3,73
    je skipghost093

    continuetzz107z:

    cmp ycoordinateghost3,21
    jne continuetzz108z

    cmp xcoordinateghost3,48
    je skipghost093

    cmp xcoordinateghost3,73
    je skipghost093

    continuetzz108z:

    cmp ycoordinateghost3,22
    jne continuetzz109z

    cmp xcoordinateghost3,48
    je skipghost093

    cmp xcoordinateghost3,73
    je skipghost093

    continuetzz109z:

    cmp xcoordinateghost3, 1
    je skipghost093

    dec xcoordinateghost3 

    ret

ghostmovement33 ENDP

main PROC
    
    mov eax, 1500
    call delay

    invoke playsound, offset deviceconnect, null, snd_alias
    invoke playsound, offset soundfile, null, 1

    ; Name Input

    call takeinput

    menu:
    
    call clrscr

    mov eax, yellow
    call settextcolor

    mov dl, 15
    mov dh, 3
    call gotoxy

    mov edx, offset pacmanintro1
    call writestring

    mov dl, 15
    mov dh, 4
    call gotoxy

    mov edx, offset pacmanintro2
    call writestring

    mov dl, 15
    mov dh, 5
    call gotoxy

    mov edx, offset pacmanintro3
    call writestring

    mov dl, 15
    mov dh, 6
    call gotoxy

    mov edx, offset pacmanintro4
    call writestring

    mov dl, 15
    mov dh, 7
    call gotoxy

    mov edx, offset pacmanintro5
    call writestring

    mov dl, 15
    mov dh, 8
    call gotoxy

    mov edx, offset pacmanintro6
    call writestring

    mov dl, 15
    mov dh, 9
    call gotoxy

    mov edx, offset pacmanintro7
    call writestring

    mov eax, white
    call settextcolor

    mov dl, 50
    mov dh, 14
    call gotoxy

    mov eax, 100
    call delay

    mov edx, offset choice1
    call writestring

    mov dl, 50
    mov dh, 16
    call gotoxy

    mov eax, 100
    call delay

    mov edx, offset choice2
    call writestring

    mov dl, 50
    mov dh, 18
    call gotoxy

    mov eax, 100
    call delay

    mov edx, offset choice3
    call writestring

    mov dl, 50
    mov dh, 20
    call gotoxy

    mov eax, 100
    call delay

    mov edx, offset choice4
    call writestring

    mov dl, 50
    mov dh, 23
    call gotoxy

    mov eax, 300
    call delay

    mov edx, offset choiceask
    call writestring

    mov eax, offset startinput 
    call Readint

    cmp eax, 1
    je startgame

    cmp eax, 2
    je displayinstructions

    cmp eax, 3
    je showhighscores

    cmp eax, 4
    je exitGame

    showhighscores:

        call clrscr

        mov eax, yellow
        call settextcolor

        mov dl, 50
        mov dh, 6
        call gotoxy

        mov edx, offset hsstring
        call writestring

        mov dl, 50
        mov dh, 12
        call gotoxy

        mov edx, offset namestring
        call writestring

        mov edx, offset username
        call writestring

        mov dl, 50
        mov dh, 14
        call gotoxy

        mov edx, offset scorestring
        call writestring

        mov al, score
        call writeint

        mov dl, 35
        mov dh, 18
        call gotoxy

        mov edx, offset returnask
        call writestring

        mov eax, offset startinput 
        call Readint

        cmp eax, 1
        je startgame

        cmp eax, 2
        je menu

    displayinstructions:

        call clrscr

        mov eax, white
        call settextcolor

        mov dl, 45
        mov dh, 3
        call gotoxy

        mov edx, offset instruction
        call writestring

        mov dl, 30
        mov dh, 8
        call gotoxy

        mov edx, offset instruction1
        call writestring

        mov dl, 30
        mov dh, 10
        call gotoxy

        mov edx, offset instruction2
        call writestring

        mov dl, 30
        mov dh, 12
        call gotoxy

        mov edx, offset instruction3
        call writestring

        mov dl, 30
        mov dh, 14
        call gotoxy

        mov edx, offset instruction4
        call writestring

        mov dl, 30
        mov dh, 18
        call gotoxy

        mov edx, offset returnask
        call writestring

        mov eax, offset startinput 
        call Readint

        cmp eax, 2
        je menu

    startgame:

    LEVEL1:

    mov level, 1

    call clrscr

    mov eax, yellow
    call settextcolor

    mov dl, 34
    mov dh, 6
    call gotoxy

    mov edx, offset level11
    call writestring

    mov dl, 34
    mov dh, 7
    call gotoxy

    mov eax, 100
    call delay

    mov edx, offset level12
    call writestring

    mov dl, 34
    mov dh, 8
    call gotoxy

    mov eax, 100
    call delay

    mov edx, offset level13
    call writestring

    mov dl, 34
    mov dh, 9
    call gotoxy

    mov eax, 100
    call delay

    mov edx, offset level14
    call writestring

    mov dl, 34
    mov dh, 10
    call gotoxy

    mov eax, 100
    call delay
    
    mov edx, offset level15
    call writestring

    mov dl, 34
    mov dh, 11
    call gotoxy

    mov eax, 100
    call delay

    mov edx, offset level16
    call writestring

    mov eax, white
    call settextcolor

    mov dl, 47
    mov dh, 16
    call gotoxy

    mov eax, 100
    call delay

    mov edx, offset advance
    call writestring

    call readchar

    call clrscr

    mov esi, offset xcoordinatecoin
    mov edi, offset ycoordinatecoin
    mov ecx, 50

    call randomize

    looop:

        call createrandomcoin
        call drawcoin

        inc esi
        inc edi

    loop looop
    
    call drawwalls
    
    call drawplayer

    call drawghost

    mov eax, blue
    call settextcolor

    call drawobstacles1

    gameloop:

        cmp score, 22
        jae LEVEL2

        ; ghost collision with coins

        mov ecx, 50
        mov esi, offset xcoordinatecoin
        mov edi, offset ycoordinatecoin

        mov bl,xcoordinateghost
        mov dl,ycoordinateghost

        loooop1:

            cmp bl,[esi]
            jne breakitg

            cmp dl,[edi]
            je collectingg

            breakitg:

            inc edi
            inc esi

        loop loooop1

        jmp skipgc

        collectingg:

        call updateghost
        call ghostmovement1
        call drawghost
        call drawcoin

        skipgc:

        ; getting points:
        
        mov ecx, 50
        mov esi, offset xcoordinatecoin
        mov edi, offset ycoordinatecoin

        mov bl,xcoordinate
        mov dl,ycoordinate

        looop1:

            cmp bl,[esi]
            jne breakit

            cmp dl,[edi]
            je collecting

            breakit:

            inc edi
            inc esi

        loop looop1
        
        collecting:

        cmp byte ptr [esi], -1
        je notCollecting

        mov eax, green
        call settextcolor

        add score, 2
        mov byte ptr [esi], -1
        
        jmp drawscore

        notCollecting:

        mov eax, white 
        call settextcolor

        drawscore:
        
        mov dl,55
        mov dh,0
        call gotoxy
        
        mov edx, offset scorestring
        call writestring

        mov al,score
        sub al, 2
        call writeint

        ; show name

        mov dl, 3
        mov dh, 0
        call gotoxy

        mov eax, white
        call settextcolor

        mov edx, offset namestring
        call writestring

        mov edx, offset username
        call writestring

        ; show lives

        mov bl,xcoordinate
        mov dl,ycoordinate

        mov al,xcoordinateghost
        mov cl,ycoordinateghost

        cmp bl, al
        jne skipp

        cmp dl, cl
        jne skipp

        dec lives

        cmp lives, 0
        je exitscreen

        cmp score, 5
        jb skipminus

        sub score, 2

        skipminus:

        cmp score, 12
        jae skipscoreset

        mov dl,64
        mov dh,0
        call gotoxy

        mov edx, offset blank
        call writestring

        skipscoreset:

        mov eax, red
        call settextcolor

        mov dl,55
        mov dh,0
        call gotoxy
        
        mov edx, offset scorestring
        call writestring

        mov al,score
        sub al, 2
        call writeint

        call updateplayer
        mov ycoordinate, 15
        mov xcoordinate, 2
        call drawplayer
        call updateghost
        mov ycoordinateghost, 15
        mov xcoordinateghost, 116
        call drawghost

        skipp:

        mov dl, 108
        mov dh, 0
        call gotoxy

        mov edx, offset livesstring
        call writestring

        mov al, lives
        call writeint

        ; random ghost movement

        call updateghost
        call ghostmovement1
        call drawghost

        ; get user key input:
        
        mov eax, 100
        call delay

        call readkey
        mov input,al
        
        cmp input,"x"
        je exitscreen

        cmp input,"w"
        je moveup

        cmp input,"s"
        je movedown

        cmp input,"a"
        je moveleft

        cmp input,"d"
        je moveright

        cmp input,"p"
        je pausescreen

        jne gameloop

        moveup:

            cmp ycoordinate,6
            jne row2
            je row1
         
            row1:

            cmp xcoordinate,4
            jle row2

            cmp xcoordinate,14
            jle gameloop

            cmp xcoordinate,29
            jle row2

            cmp xcoordinate,39
            jle gameloop

            cmp xcoordinate,54
            jle row2

            cmp xcoordinate,64
            jle gameloop

            cmp xcoordinate,79
            jle row2

            cmp xcoordinate,89
            jle gameloop

            cmp xcoordinate,104
            jle row2

            cmp xcoordinate,114
            jle gameloop
        
            row2:

            cmp ycoordinate,13
            jne row3

            cmp xcoordinate,4
            jle row3

            cmp xcoordinate,14
            jle gameloop

            cmp xcoordinate,29
            jle row3

            cmp xcoordinate,39
            jle gameloop

            cmp xcoordinate,54
            jle row3

            cmp xcoordinate,64
            jle gameloop

            cmp xcoordinate,79
            jle row3

            cmp xcoordinate,89
            jle gameloop

            cmp xcoordinate,104
            jle row3

            cmp xcoordinate,114
            jle gameloop

            row3:

            cmp ycoordinate,20
            jne row4

            cmp xcoordinate,4
            jle row4

            cmp xcoordinate,14
            jle gameloop

            cmp xcoordinate,29
            jle row4

            cmp xcoordinate,39
            jle gameloop

            cmp xcoordinate,54
            jle row4

            cmp xcoordinate,64
            jle gameloop

            cmp xcoordinate,79
            jle row4

            cmp xcoordinate,89
            jle gameloop

            cmp xcoordinate,104
            jle row4

            cmp xcoordinate,114
            jle gameloop

            row4:

            cmp ycoordinate,27
            jne goon

            cmp xcoordinate,4
            jle goon

            cmp xcoordinate,14
            jle gameloop

            cmp xcoordinate,29
            jle goon

            cmp xcoordinate,39
            jle gameloop

            cmp xcoordinate,54
            jle goon

            cmp xcoordinate,64
            jle gameloop

            cmp xcoordinate,79
            jle goon

            cmp xcoordinate,89
            jle gameloop

            cmp xcoordinate,104
            jle goon

            cmp xcoordinate,114
            jle gameloop

            goon:

            cmp ycoordinate, 2  
            je gameloop

            call updateplayer
            dec ycoordinate
            call drawplayer

            jmp gameloop

        movedown:

            cmp ycoordinate,4
            jne continue1
            je row11
         
            row11:

            cmp xcoordinate,4
            jle continue1

            cmp xcoordinate,14
            jle gameloop

            cmp xcoordinate,29
            jle continue1

            cmp xcoordinate,39
            jle gameloop

            cmp xcoordinate,54
            jle continue1

            cmp xcoordinate,64
            jle gameloop

            cmp xcoordinate,79
            jle continue1

            cmp xcoordinate,89
            jle gameloop

            cmp xcoordinate,104
            jle continue1

            cmp xcoordinate,114
            jle gameloop

            continue1:

            row21:

            cmp ycoordinate,11
            jne row31

            cmp xcoordinate,4
            jle row31

            cmp xcoordinate,14
            jle gameloop

            cmp xcoordinate,29
            jle row31

            cmp xcoordinate,39
            jle gameloop

            cmp xcoordinate,54
            jle row31

            cmp xcoordinate,64
            jle gameloop

            cmp xcoordinate,79
            jle row31

            cmp xcoordinate,89
            jle gameloop

            cmp xcoordinate,104
            jle row31

            cmp xcoordinate,114
            jle gameloop

            row31:

            cmp ycoordinate,18
            jne row41

            cmp xcoordinate,4
            jle row41

            cmp xcoordinate,14
            jle gameloop

            cmp xcoordinate,29
            jle row41

            cmp xcoordinate,39
            jle gameloop

            cmp xcoordinate,54
            jle row41

            cmp xcoordinate,64
            jle gameloop

            cmp xcoordinate,79
            jle row41

            cmp xcoordinate,89
            jle gameloop

            cmp xcoordinate,104
            jle row41

            cmp xcoordinate,114
            jle gameloop

            row41:

            cmp ycoordinate,25
            jne goon1

            cmp xcoordinate,4
            jle goon1

            cmp xcoordinate,14
            jle gameloop

            cmp xcoordinate,29
            jle goon1

            cmp xcoordinate,39
            jle gameloop

            cmp xcoordinate,54
            jle goon1

            cmp xcoordinate,64
            jle gameloop

            cmp xcoordinate,79
            jle goon1

            cmp xcoordinate,89
            jle gameloop

            cmp xcoordinate,104
            jle goon1

            cmp xcoordinate,114
            jle gameloop

            goon1:
            
            cmp ycoordinate,28
            je gameloop

            call updateplayer
            inc ycoordinate
            call drawplayer

            jmp gameloop

        moveleft:          

            cmp ycoordinate,5
            jne continue2

            cmp xcoordinate,115
            je gameloop

            cmp xcoordinate,90
            je gameloop

            cmp xcoordinate,65
            je gameloop

            cmp xcoordinate,40
            je gameloop

            cmp xcoordinate,15
            je gameloop

            continue2:

            cmp ycoordinate,12
            jne continue3

            cmp xcoordinate,115
            je gameloop

            cmp xcoordinate,90
            je gameloop

            cmp xcoordinate,65
            je gameloop

            cmp xcoordinate,40
            je gameloop

            cmp xcoordinate,15
            je gameloop

            continue3:

            cmp ycoordinate,19
            jne continue4

            cmp xcoordinate,115
            je gameloop

            cmp xcoordinate,90
            je gameloop

            cmp xcoordinate,65
            je gameloop

            cmp xcoordinate,40
            je gameloop

            cmp xcoordinate,15
            je gameloop

            continue4:

            cmp ycoordinate,26
            jne continue5

            cmp xcoordinate,115
            je gameloop

            cmp xcoordinate,90
            je gameloop

            cmp xcoordinate,65
            je gameloop

            cmp xcoordinate,40
            je gameloop

            cmp xcoordinate,15
            je gameloop

            continue5:

            cmp xcoordinate, 1
            je gameloop

            call updateplayer
            dec xcoordinate
            call drawplayer

            cmp ycoordinateghost,5
            jne continue21g

            cmp xcoordinateghost,4
            je gameloop

            cmp xcoordinateghost,54
            je gameloop

            cmp xcoordinateghost,79
            je gameloop

            cmp xcoordinateghost,104
            je gameloop

            cmp xcoordinateghost,29
            je gameloop

            continue21g:

            cmp ycoordinateghost,12
            jne continue31g

            cmp xcoordinateghost,4
            je gameloop

            cmp xcoordinateghost,54
            je gameloop

            cmp xcoordinateghost,79
            je gameloop

            cmp xcoordinateghost,104
            je gameloop

            cmp xcoordinateghost,29
            je gameloop

            continue31g:

            cmp ycoordinateghost,19
            jne continue41g

            cmp xcoordinateghost,4
            je gameloop

            cmp xcoordinateghost,29
            je gameloop

            cmp xcoordinateghost,54
            je gameloop

            cmp xcoordinateghost,79
            je gameloop

            cmp xcoordinateghost,104
            je gameloop

            continue41g:

            cmp ycoordinateghost,26
            jne continue51g

            cmp xcoordinateghost,4
            je gameloop

            cmp xcoordinateghost,54
            je gameloop

            cmp xcoordinateghost,79
            je gameloop

            cmp xcoordinateghost,104
            je gameloop

            cmp xcoordinateghost,29
            je gameloop

            continue51g:

            cmp xcoordinateghost, 118
            je gameloop

            call updateghost
            inc xcoordinateghost
            call drawghost

            jmp gameloop

        moveright:

            cmp ycoordinate,5
            jne continue21

            cmp xcoordinate,4
            je gameloop

            cmp xcoordinate,54
            je gameloop

            cmp xcoordinate,79
            je gameloop

            cmp xcoordinate,104
            je gameloop

            cmp xcoordinate,29
            je gameloop

            continue21:

            cmp ycoordinate,12
            jne continue31

            cmp xcoordinate,4
            je gameloop

            cmp xcoordinate,54
            je gameloop

            cmp xcoordinate,79
            je gameloop

            cmp xcoordinate,104
            je gameloop

            cmp xcoordinate,29
            je gameloop

            continue31:

            cmp ycoordinate,19
            jne continue41

            cmp xcoordinate,4
            je gameloop

            cmp xcoordinate,29
            je gameloop

            cmp xcoordinate,54
            je gameloop

            cmp xcoordinate,79
            je gameloop

            cmp xcoordinate,104
            je gameloop

            continue41:

            cmp ycoordinate,26
            jne continue51

            cmp xcoordinate,4
            je gameloop

            cmp xcoordinate,54
            je gameloop

            cmp xcoordinate,79
            je gameloop

            cmp xcoordinate,104
            je gameloop

            cmp xcoordinate,29
            je gameloop

            continue51:

            cmp xcoordinate, 118
            je gameloop

            call updateplayer
            inc xcoordinate
            call drawplayer

            cmp ycoordinateghost,5
            jne continue2g

            cmp xcoordinateghost,115
            je gameloop

            cmp xcoordinateghost,90
            je gameloop

            cmp xcoordinateghost,65
            je gameloop

            cmp xcoordinateghost,40
            je gameloop

            cmp xcoordinateghost,15
            je gameloop

            continue2g:

            cmp ycoordinateghost,12
            jne continue3g

            cmp xcoordinateghost,115
            je gameloop

            cmp xcoordinateghost,90
            je gameloop

            cmp xcoordinateghost,65
            je gameloop

            cmp xcoordinateghost,40
            je gameloop

            cmp xcoordinateghost,15
            je gameloop

            continue3g:

            cmp ycoordinateghost,19
            jne continue4g

            cmp xcoordinateghost,115
            je gameloop

            cmp xcoordinateghost,90
            je gameloop

            cmp xcoordinateghost,65
            je gameloop

            cmp xcoordinateghost,40
            je gameloop

            cmp xcoordinateghost,15
            je gameloop

            continue4g:

            cmp ycoordinateghost,26
            jne continue5g

            cmp xcoordinateghost,115
            je gameloop

            cmp xcoordinateghost,90
            je gameloop

            cmp xcoordinateghost,65
            je gameloop

            cmp xcoordinateghost,40
            je gameloop

            cmp xcoordinateghost,15
            je gameloop

            continue5g:

            cmp xcoordinateghost, 1
            je gameloop
            
            call updateghost
            dec xcoordinateghost
            call drawghost

            jmp gameloop

        pausescreen:

            call clrscr

            mov eax, white
            call settextcolor

            mov dh, 3
            mov dl, 45
            call gotoxy

            mov edx, offset pausestring
            call writestring

            mov dl, 47
            mov dh, 10
            call gotoxy

            mov edx, offset pause1
            call writestring

            mov dl, 47
            mov dh, 12
            call gotoxy

            mov edx, offset pause2
            call writestring

            mov dl, 47
            mov dh, 14
            call gotoxy

            mov edx, offset pause3
            call writestring

            mov dl, 47
            mov dh, 17
            call gotoxy

            mov edx, offset choiceask
            call writestring

            mov eax, offset startinput 
            call Readint

            cmp al, 1
            je unpause

            cmp al, 2
            je restart

            cmp al, 3
            je exitscreen

            unpause:

                call clrscr
                
                mov esi, offset xcoordinatecoin
                mov edi, offset ycoordinatecoin
                mov ecx, 50
                
                loooop:
                
                    call drawcoin
                    
                    inc esi
                    inc edi

                loop loooop

                call drawwalls

                mov eax, blue
                call settextcolor

                call drawobstacles1
                call drawplayer
                call drawghost

                jmp gameloop
    
            restart:

                mov score, 0
                mov lives, 3
                jmp startgame

    jmp gameloop

    LEVEL2:

    mov level, 2

    call clrscr

    mov eax, yellow
    call settextcolor

    mov dl, 34-12
    mov dh, 6-2
    call gotoxy

    mov eax, 200
    call delay

    mov edx, offset levelc1
    call writestring

    mov dl, 34-12
    mov dh, 7-2
    call gotoxy

    mov eax, 200
    call delay

    mov edx, offset levelc2
    call writestring

    mov dl, 34-12
    mov dh, 8-2
    call gotoxy

    mov eax, 200
    call delay

    mov edx, offset levelc3
    call writestring

    mov dl, 34-12
    mov dh, 9-2
    call gotoxy

    mov eax, 200
    call delay

    mov edx, offset levelc4
    call writestring

    mov dl, 34-12
    mov dh, 10-2
    call gotoxy

    mov eax, 200
    call delay

    mov edx, offset levelc5
    call writestring

    mov eax, white
    call settextcolor

    mov dl, 47
    mov dh, 16
    call gotoxy

    mov eax, 200
    call delay

    mov edx, offset advance
    call writestring

    call readchar

    call clrscr

    mov eax, yellow
    call settextcolor

    mov dl, 34-1
    mov dh, 6
    call gotoxy

    mov edx, offset level21
    call writestring

    mov dl, 34-1
    mov dh, 7
    call gotoxy

    mov eax, 100
    call delay

    mov edx, offset level22
    call writestring

    mov dl, 34-1
    mov dh, 8
    call gotoxy

    mov eax, 100
    call delay

    mov edx, offset level23
    call writestring

    mov dl, 34-1
    mov dh, 9
    call gotoxy

    mov eax, 100
    call delay

    mov edx, offset level24
    call writestring

    mov dl, 34-1
    mov dh, 10
    call gotoxy

    mov eax, 100
    call delay

    mov edx, offset level25
    call writestring

    mov dl, 34-1
    mov dh, 11
    call gotoxy

    mov eax, 100
    call delay

    mov edx, offset level26
    call writestring

    mov eax, white
    call settextcolor

    mov dl, 47
    mov dh, 16
    call gotoxy

    mov eax, 100
    call delay

    mov edx, offset advance
    call writestring

    call readchar

    call clrscr

    mov esi, offset xcoordinatecoin
    mov edi, offset ycoordinatecoin
    mov ecx, 50

    call randomize

    looop2:

        call createrandomcoin
        call drawcoin

        inc esi
        inc edi

    loop looop2
    
    call drawwalls
    
    mov xcoordinate, 2
    mov ycoordinate, 20

    call drawplayer

    mov xcoordinateghost, 116
    mov ycoordinateghost, 10

    call drawghost

    mov eax, magenta 
    call settextcolor

    call drawobstacles2

    sub score, 2

    gameloop2:

        cmp score, 75
        jae LEVEL3

        ; fruit

        cmp score, 40
        jne nofruit

        mov fruitxcoordinate, 60
        mov fruitycoordinate, 11

        call drawfruit

        nofruit:

        cmp score, 60
        jne nofruit2

        mov fruitxcoordinate,60
        mov fruitycoordinate,14

        call drawfruit

        nofruit2 :

        ; heart

        cmp score, 65
        jne noheart

        mov heartxcoordinate, 118
        mov heartycoordinate, 25

        call drawheart

        noheart:

        ; ghost collision with coins

        mov ecx, 50
        mov esi, offset xcoordinatecoin
        mov edi, offset ycoordinatecoin

        mov bl,xcoordinateghost
        mov dl,ycoordinateghost

        loooop12:

            cmp bl,[esi]
            jne breakitg2

            cmp dl,[edi]
            je collectingg2

            breakitg2:

            inc edi
            inc esi

        loop loooop12

        jmp skipgc2

        collectingg2:

        call updateghost
        call ghostmovement1
        call drawghost
        call drawcoin

        skipgc2:

        ; getting points:
        
        mov ecx, 50
        mov esi, offset xcoordinatecoin
        mov edi, offset ycoordinatecoin

        mov bl,xcoordinate
        mov dl,ycoordinate

        looop12:

            cmp bl,[esi]
            jne breakit2

            cmp dl,[edi]
            je collecting2

            breakit2:

            inc edi
            inc esi

        loop looop12
        
        collecting2:

        cmp byte ptr [esi], -1
        je notcollecting2

        mov eax, green
        call settextcolor

        add score, 5
        mov byte ptr [esi], -1
        
        jmp drawscore2

        notcollecting2:

        mov eax, white 
        call settextcolor

        drawscore2:
        
        mov dl,55
        mov dh,0
        call gotoxy
        
        mov edx, offset scorestring
        call writestring

        mov al,score
        sub al, 5
        call writeint

        ; show name

        mov dl, 3
        mov dh, 0
        call gotoxy

        mov eax, white
        call settextcolor

        mov edx, offset namestring
        call writestring

        mov edx, offset username
        call writestring

        ; show lives

        mov bl,xcoordinate
        mov dl,ycoordinate

        mov al,xcoordinateghost
        mov cl,ycoordinateghost

        cmp bl, al
        jne skipp2

        cmp dl, cl
        jne skipp2

        dec lives

        cmp lives, 0
        je exitscreen

        cmp score, 30
        jb skipminus2

        sub score, 5

        skipminus2:

        cmp score, 12
        jae skipscoreset2

        mov dl,64
        mov dh,0
        call gotoxy

        mov edx, offset blank
        call writestring

        skipscoreset2:

        mov eax, red
        call settextcolor

        mov dl,55
        mov dh,0
        call gotoxy
        
        mov edx, offset scorestring
        call writestring

        mov al,score
        sub al, 5
        call writeint

        call updateplayer
        mov ycoordinate, 15
        mov xcoordinate, 2
        call drawplayer
        call updateghost
        mov ycoordinateghost, 15
        mov xcoordinateghost, 116
        call drawghost

        skipp2:

        mov dl, 108
        mov dh, 0
        call gotoxy

        mov edx, offset livesstring
        call writestring

        mov al, lives
        call writeint

        ; random ghost movement

        call updateghost
        call ghostmovement2
        call drawghost

        ; get user key input:
        
        mov eax, 100
        call delay
        
        call readkey
        mov input,al
        
        cmp input,"x"
        je exitscreen

        cmp input,"w"
        je moveup2

        cmp input,"s"
        je movedown2

        cmp input,"a"
        je moveleft2

        cmp input,"d"
        je moveright2

        cmp input,"p"
        je pausescreen2

        jne gameloop2

        moveup2:

            mov bl, fruitxcoordinate
            
            cmp bl, xcoordinate
            jne notfruity

            mov bl, fruitycoordinate
            cmp bl, ycoordinate
            jne notfruity

            add score, 10

            mov fruitxcoordinate, -1
            mov fruitycoordinate, -1

            notfruity:

            mov bl, heartxcoordinate
            
            cmp bl, xcoordinate
            jne nothearty

            mov bl, heartycoordinate
            cmp bl, ycoordinate
            jne nothearty

            add lives, 1
            add score, 5

            mov heartxcoordinate, -1
            mov heartycoordinate, -1

            nothearty:

            cmp ycoordinate,6
            jne row20
            je row10
         
            row10:

            cmp xcoordinate,4
            jle row20

            cmp xcoordinate,14
            jle gameloop2

            cmp xcoordinate,29
            jle row20

            cmp xcoordinate,39
            jle gameloop2

            cmp xcoordinate,54
            jle row20

            cmp xcoordinate,64
            jle gameloop2

            cmp xcoordinate,79
            jle row20

            cmp xcoordinate,89
            jle gameloop2

            cmp xcoordinate,104
            jle row20

            cmp xcoordinate,114
            jle gameloop2

            row20:

            cmp ycoordinate,13
            jne row30

            cmp xcoordinate,4
            jle row30

            cmp xcoordinate,14
            jle gameloop2

            cmp xcoordinate,29
            jle row30

            cmp xcoordinate,39
            jle gameloop2

            cmp xcoordinate,54
            jle row30

            cmp xcoordinate,64
            jle gameloop2

            cmp xcoordinate,79
            jle row30

            cmp xcoordinate,89
            jle gameloop2

            cmp xcoordinate,104
            jle row30

            cmp xcoordinate,114
            jle gameloop2

            row30:

            cmp ycoordinate,20
            jne row40

            cmp xcoordinate,4
            jle row40

            cmp xcoordinate,14
            jle gameloop2

            cmp xcoordinate,29
            jle row40

            cmp xcoordinate,39
            jle gameloop2

            cmp xcoordinate,54
            jle row40

            cmp xcoordinate,64
            jle gameloop2

            cmp xcoordinate,79
            jle row40
            
            cmp xcoordinate,89
            jle gameloop2

            cmp xcoordinate,104
            jle row40

            cmp xcoordinate,114
            jle gameloop2

            row40:

            cmp ycoordinate,27
            jne goon0

            cmp xcoordinate,4
            jle goon0

            cmp xcoordinate,14
            jle gameloop2
            
            cmp xcoordinate,29
            jle goon0

            cmp xcoordinate,39
            jle gameloop2

            cmp xcoordinate,54
            jle goon0

            cmp xcoordinate,64
            jle gameloop2

            cmp xcoordinate,79
            jle goon0

            cmp xcoordinate,89
            jle gameloop2

            cmp xcoordinate,104
            jle goon0

            cmp xcoordinate,114
            jle gameloop2

            goon0:

            cmp ycoordinate, 9
            jne nocoll

            cmp xcoordinate, 16
            jle nocoll

            cmp xcoordinate, 26
            jle gameloop2

            cmp xcoordinate, 54
            jle nocoll

            cmp xcoordinate, 64
            jle gameloop2

            cmp xcoordinate, 92
            jle nocoll

            cmp xcoordinate, 102
            jle gameloop2

            nocoll:

            cmp ycoordinate, 16
            jne row6

            cmp xcoordinate, 16
            jle row6

            cmp xcoordinate, 26
            jle gameloop2

            cmp xcoordinate, 54
            jle row6

            cmp xcoordinate, 64
            jle gameloop2

            cmp xcoordinate, 92
            jle row6

            cmp xcoordinate, 102
            jle gameloop2

            row6:

            cmp ycoordinate, 24
            jne row7

            cmp xcoordinate, 16
            jle row7

            cmp xcoordinate, 26
            jle gameloop2

            cmp xcoordinate, 54
            jle row7

            cmp xcoordinate, 64
            jle gameloop2

            cmp xcoordinate, 92
            jle row7

            cmp xcoordinate, 102
            jle gameloop2

            row7:

            cmp ycoordinate, 2  
            je gameloop2

            call updateplayer
            dec ycoordinate
            call drawplayer

            cmp ycoordinateghost,6
            jne continueg0
            je row1g0
         
            row1g0:

            cmp xcoordinateghost,4
            jle continueg0

            cmp xcoordinateghost,14
            jle gameloop2

            cmp xcoordinateghost,29
            jle continueg0

            cmp xcoordinateghost,39
            jle gameloop2

            cmp xcoordinateghost,54
            jle continueg0

            cmp xcoordinateghost,64
            jle gameloop2

            cmp xcoordinateghost,79
            jle continueg0

            cmp xcoordinateghost,89
            jle gameloop2

            cmp xcoordinateghost,104
            jle continueg0

            cmp xcoordinateghost,114
            jle gameloop2
        
            continueg0:

            row2g0:

            cmp ycoordinateghost,13
            jne row3g0

            cmp xcoordinateghost,4
            jle row3g0
            
            cmp xcoordinateghost,14
            jle gameloop2

            cmp xcoordinateghost,29
            jle row3g0

            cmp xcoordinateghost,39
            jle gameloop2

            cmp xcoordinateghost,54
            jle row3g0

            cmp xcoordinateghost,64
            jle gameloop2

            cmp xcoordinateghost,79
            jle row3g0

            cmp xcoordinateghost,89
            jle gameloop2
            
            cmp xcoordinateghost,104
            jle row3g0

            cmp xcoordinateghost,114
            jle gameloop2

            row3g0:

            cmp ycoordinateghost,20
            jne row4g0

            cmp xcoordinateghost,4
            jle row4g0

            cmp xcoordinateghost,14
            jle gameloop2

            cmp xcoordinateghost,29
            jle row4g0

            cmp xcoordinateghost,39
            jle gameloop2

            cmp xcoordinateghost,54
            jle row4g0

            cmp xcoordinateghost,64
            jle gameloop2

            cmp xcoordinateghost,79
            jle row4g0

            cmp xcoordinateghost,89
            jle gameloop2

            cmp xcoordinateghost,104
            jle row4g0

            cmp xcoordinateghost,114
            jle gameloop2

            row4g0:

            cmp ycoordinateghost,27
            jne goong0

            cmp xcoordinateghost,4
            jle goong0

            cmp xcoordinateghost,14
            jle gameloop2

            cmp xcoordinateghost,29
            jle goong0

            cmp xcoordinateghost,39
            jle gameloop2

            cmp xcoordinateghost,54
            jle goong0

            cmp xcoordinateghost,64
            jle gameloop2

            cmp xcoordinateghost,79
            jle goong0

            cmp xcoordinateghost,89
            jle gameloop2

            cmp xcoordinateghost,104
            jle goong0

            cmp xcoordinateghost,114
            jle gameloop2

            goong0:

            cmp ycoordinateghost, 9
            jne nocoll0

            cmp xcoordinateghost, 16
            jle nocoll0

            cmp xcoordinateghost, 26
            jle gameloop2

            cmp xcoordinateghost, 54
            jle nocoll0

            cmp xcoordinateghost, 64
            jle gameloop2

            cmp xcoordinateghost, 92
            jle nocoll0

            cmp xcoordinateghost, 102
            jle gameloop2

            nocoll0:

            cmp ycoordinateghost, 16
            jne row6g

            cmp xcoordinateghost, 16
            jle row6g

            cmp xcoordinateghost, 26
            jle gameloop2

            cmp xcoordinateghost, 54
            jle row6g

            cmp xcoordinateghost, 64
            jle gameloop2

            cmp xcoordinateghost, 92
            jle row6g

            cmp xcoordinateghost, 102
            jle gameloop2

            row6g:

            cmp ycoordinateghost, 24
            jne row7g

            cmp xcoordinateghost, 16
            jle row7g

            cmp xcoordinateghost, 26
            jle gameloop2

            cmp xcoordinateghost, 54
            jle row7g

            cmp xcoordinateghost, 64
            jle gameloop2

            cmp xcoordinateghost, 92
            jle row7g

            cmp xcoordinateghost, 102
            jle gameloop2

            row7g:

            cmp ycoordinateghost, 2
            je gameloop2

            call updateghost
            dec ycoordinateghost
            call drawghost

            jmp gameloop2

        movedown2:

            mov bl,fruitxcoordinate

            cmp bl,xcoordinate
            jnz notfruity2
            
            mov bl,fruitycoordinate
            
            cmp bl,ycoordinate
            jnz notfruity2

            add score,10

            mov fruitxcoordinate,-1
            mov fruitycoordinate,-1

            notfruity2:

            mov bl,heartxcoordinate

            cmp bl,xcoordinate
            jnz nothearty2
            
            mov bl,heartycoordinate
            
            cmp bl,ycoordinate
            jnz nothearty2

            add lives,1
            add score, 5

            mov heartxcoordinate,-1
            mov heartycoordinate,-1

            nothearty2:

            cmp ycoordinate,4
            jne continue10
            je row110
         
            row110:

            cmp xcoordinate,4
            jle continue10

            cmp xcoordinate,14
            jle gameloop2

            cmp xcoordinate,29
            jle continue10

            cmp xcoordinate,39
            jle gameloop2

            cmp xcoordinate,54
            jle continue10

            cmp xcoordinate,64
            jle gameloop2

            cmp xcoordinate,79
            jle continue10

            cmp xcoordinate,89
            jle gameloop2

            cmp xcoordinate,104
            jle continue10

            cmp xcoordinate,114
            jle gameloop2

            continue10:

            row210:

            cmp ycoordinate,11
            jne row310

            cmp xcoordinate,4
            jle row310

            cmp xcoordinate,14
            jle gameloop2

            cmp xcoordinate,29
            jle row310

            cmp xcoordinate,39
            jle gameloop2

            cmp xcoordinate,54
            jle row310

            cmp xcoordinate,64
            jle gameloop2

            cmp xcoordinate,79
            jle row310

            cmp xcoordinate,89
            jle gameloop2

            cmp xcoordinate,104
            jle row310

            cmp xcoordinate,114
            jle gameloop2

            row310:

            cmp ycoordinate,18
            jne row410

            cmp xcoordinate,4
            jle row410

            cmp xcoordinate,14
            jle gameloop2
            
            cmp xcoordinate,29
            jle row410

            cmp xcoordinate,39
            jle gameloop2

            cmp xcoordinate,54
            jle row410

            cmp xcoordinate,64
            jle gameloop2

            cmp xcoordinate,79
            jle row410

            cmp xcoordinate,89
            jle gameloop2

            cmp xcoordinate,104
            jle row410

            cmp xcoordinate,114
            jle gameloop2

            row410:

            cmp ycoordinate,25
            jne goon10

            cmp xcoordinate,4
            jle goon10

            cmp xcoordinate,14
            jle gameloop2

            cmp xcoordinate,29
            jle goon10

            cmp xcoordinate,39
            jle gameloop2

            cmp xcoordinate,54
            jle goon10

            cmp xcoordinate,64
            jle gameloop2

            cmp xcoordinate,79
            jle goon10

            cmp xcoordinate,89
            jle gameloop2

            cmp xcoordinate,104
            jle goon10

            cmp xcoordinate,114
            jle gameloop2

            goon10:

            cmp ycoordinate, 7
            jne nocoll1

            cmp xcoordinate, 16
            jle nocoll1

            cmp xcoordinate, 26
            jle gameloop2

            cmp xcoordinate, 54
            jle nocoll1

            cmp xcoordinate, 64
            jle gameloop2

            cmp xcoordinate, 92
            jle nocoll1

            cmp xcoordinate, 102
            jle gameloop2

            nocoll1:

            cmp ycoordinate, 14
            jne nocoll12

            cmp xcoordinate, 16
            jle nocoll12

            cmp xcoordinate, 26
            jle gameloop2

            cmp xcoordinate, 54
            jle nocoll12

            cmp xcoordinate, 64
            jle gameloop2

            cmp xcoordinate, 92
            jle nocoll12

            cmp xcoordinate, 102
            jle gameloop2

            nocoll12:

            cmp ycoordinate, 22
            jne nocoll13

            cmp xcoordinate, 16
            jle nocoll13

            cmp xcoordinate, 26
            jle gameloop2

            cmp xcoordinate, 54
            jle nocoll13

            cmp xcoordinate, 64
            jle gameloop2

            cmp xcoordinate, 92
            jle nocoll13
            
            cmp xcoordinate, 102
            jle gameloop2

            nocoll13:
            
            cmp ycoordinate,28
            je gameloop2

            call updateplayer
            inc ycoordinate
            call drawplayer

            cmp ycoordinateghost,4
            jne continue1g0
            je row11g0
         
            row11g0:

            cmp xcoordinateghost,4
            jle continue1g0

            cmp xcoordinateghost,14
            jle gameloop2

            cmp xcoordinateghost,29
            jle continue1g0

            cmp xcoordinateghost,39
            jle gameloop2

            cmp xcoordinateghost,54
            jle continue1g0

            cmp xcoordinateghost,64
            jle gameloop2

            cmp xcoordinateghost,79
            jle continue1g0

            cmp xcoordinateghost,89
            jle gameloop2

            cmp xcoordinateghost,104
            jle continue1g0

            cmp xcoordinateghost,114
            jle gameloop2

            continue1g0:

            row21g0:

            cmp ycoordinateghost,11
            jne row31g0

            cmp xcoordinateghost,4
            jle row31g0

            cmp xcoordinateghost,14
            jle gameloop2

            cmp xcoordinateghost,29
            jle row31g0

            cmp xcoordinateghost,39
            jle gameloop2

            cmp xcoordinateghost,54
            jle row31g0

            cmp xcoordinateghost,64
            jle gameloop2

            cmp xcoordinateghost,79
            jle row31g0

            cmp xcoordinateghost,89
            jle gameloop2

            cmp xcoordinateghost,104
            jle row31g0

            cmp xcoordinateghost,114
            jle gameloop2

            row31g0:

            cmp ycoordinateghost,18
            jne row41g0

            cmp xcoordinateghost,4
            jle row41g0

            cmp xcoordinateghost,14
            jle gameloop2

            cmp xcoordinateghost,29
            jle row41g0

            cmp xcoordinateghost,39
            jle gameloop2

            cmp xcoordinateghost,54
            jle row41g0

            cmp xcoordinateghost,64
            jle gameloop2

            cmp xcoordinateghost,79
            jle row41g0

            cmp xcoordinateghost,89
            jle gameloop2

            cmp xcoordinateghost,104
            jle row41g0

            cmp xcoordinateghost,114
            jle gameloop2

            row41g0:

            cmp ycoordinateghost,25
            jne goon1g0

            cmp xcoordinateghost,4
            jle goon1g0

            cmp xcoordinateghost,14
            jle gameloop2

            cmp xcoordinateghost,29
            jle goon1g0

            cmp xcoordinateghost,39
            jle gameloop2

            cmp xcoordinateghost,54
            jle goon1g0

            cmp xcoordinateghost,64
            jle gameloop2

            cmp xcoordinateghost,79
            jle goon1g0

            cmp xcoordinateghost,89
            jle gameloop2

            cmp xcoordinateghost,104
            jle goon1g0

            cmp xcoordinateghost,114
            jle gameloop2

            goon1g0:

            cmp ycoordinateghost, 7
            jne nocoll1g

            cmp xcoordinateghost, 16
            jle nocoll1g

            cmp xcoordinateghost, 26
            jle gameloop2

            cmp xcoordinateghost, 54
            jle nocoll1g

            cmp xcoordinateghost, 64
            jle gameloop2

            cmp xcoordinateghost, 92
            jle nocoll1g

            cmp xcoordinateghost, 102
            jle gameloop2

            nocoll1g:

            cmp ycoordinateghost, 14
            jne nocoll12g

            cmp xcoordinateghost, 16
            jle nocoll12g

            cmp xcoordinateghost, 26
            jle gameloop2

            cmp xcoordinateghost, 54
            jle nocoll12g

            cmp xcoordinateghost, 64
            jle gameloop2

            cmp xcoordinateghost, 92
            jle nocoll12g

            cmp xcoordinateghost, 102
            jle gameloop2

            nocoll12g:

            cmp ycoordinateghost, 22
            jne nocoll13g

            cmp xcoordinateghost, 16
            jle nocoll13g

            cmp xcoordinateghost, 26
            jle gameloop2

            cmp xcoordinateghost, 54
            jle nocoll13g

            cmp xcoordinateghost, 64
            jle gameloop2

            cmp xcoordinateghost, 92
            jle nocoll13g
            
            cmp xcoordinateghost, 102
            jle gameloop2

            nocoll13g:

            cmp ycoordinateghost, 28
            je gameloop2

            call updateghost
            inc ycoordinateghost
            call drawghost

            jmp gameloop2

        moveleft2:          

            mov bl,fruitxcoordinate

            cmp bl,xcoordinate
            jnz notfruity3
            
            mov bl,fruitycoordinate
            
            cmp bl,ycoordinate
            jnz notfruity3

            add score,10

            mov fruitxcoordinate,-1
            mov fruitycoordinate,-1

            notfruity3:

            mov bl,heartxcoordinate

            cmp bl,xcoordinate
            jnz nothearty3
            
            mov bl,heartycoordinate
            
            cmp bl,ycoordinate
            jnz nothearty3

            add lives,1
            add score, 5

            mov heartxcoordinate,-1
            mov heartycoordinate,-1

            nothearty3:

            cmp ycoordinate,5
            jne continue20

            cmp xcoordinate,115
            je gameloop2

            cmp xcoordinate,90
            je gameloop2

            cmp xcoordinate,65
            je gameloop2

            cmp xcoordinate,40
            je gameloop2

            cmp xcoordinate,15
            je gameloop2

            continue20:

            cmp ycoordinate,12
            jne continue30

            cmp xcoordinate,115
            je gameloop2

            cmp xcoordinate,90
            je gameloop2

            cmp xcoordinate,65
            je gameloop2

            cmp xcoordinate,40
            je gameloop2

            cmp xcoordinate,15
            je gameloop2

            continue30:

            cmp ycoordinate,19
            jne continue40

            cmp xcoordinate,115
            je gameloop2

            cmp xcoordinate,90
            je gameloop2

            cmp xcoordinate,65
            je gameloop2

            cmp xcoordinate,40
            je gameloop2

            cmp xcoordinate,15
            je gameloop2
            
            continue40:

            cmp ycoordinate,26
            jne continue50

            cmp xcoordinate,115
            je gameloop2

            cmp xcoordinate,90
            je gameloop2

            cmp xcoordinate,65
            je gameloop2

            cmp xcoordinate,40
            je gameloop2

            cmp xcoordinate,15
            je gameloop2

            continue50:

            cmp ycoordinate,8
            jne continue60

            cmp xcoordinate,103
            je gameloop2

            cmp xcoordinate,65
            je gameloop2

            cmp xcoordinate,27
            je gameloop2

            continue60:

            cmp ycoordinate,15
            jne continue70

            cmp xcoordinate,103
            je gameloop2

            cmp xcoordinate,65
            je gameloop2

            cmp xcoordinate,27
            je gameloop2

            continue70:

            cmp ycoordinate,23
            jne continue80

            cmp xcoordinate,103
            je gameloop2

            cmp xcoordinate,65
            je gameloop2

            cmp xcoordinate,27
            je gameloop2

            continue80:

            cmp xcoordinate, 1
            je gameloop2

            call updateplayer
            dec xcoordinate
            call drawplayer

            cmp ycoordinateghost,5
            jne continue21g0

            cmp xcoordinateghost,4
            je gameloop2

            cmp xcoordinateghost,54
            je gameloop2

            cmp xcoordinateghost,79
            je gameloop2

            cmp xcoordinateghost,104
            je gameloop2

            cmp xcoordinateghost,29
            je gameloop2

            continue21g0:

            cmp ycoordinateghost,12
            jne continue31g0

            cmp xcoordinateghost,4
            je gameloop2

            cmp xcoordinateghost,54
            je gameloop2

            cmp xcoordinateghost,79
            je gameloop2

            cmp xcoordinateghost,104
            je gameloop2

            cmp xcoordinateghost,29
            je gameloop2

            continue31g0:

            cmp ycoordinateghost,19
            jne continue41g0

            cmp xcoordinateghost,4
            je gameloop2

            cmp xcoordinateghost,29
            je gameloop2

            cmp xcoordinateghost,54
            je gameloop2

            cmp xcoordinateghost,79
            je gameloop2
            
            cmp xcoordinateghost,104
            je gameloop2
            
            continue41g0:

            cmp ycoordinateghost,26
            jne continue51g0

            cmp xcoordinateghost,4
            je gameloop2

            cmp xcoordinateghost,54
            je gameloop2

            cmp xcoordinateghost,79
            je gameloop2

            cmp xcoordinateghost,104
            je gameloop2

            cmp xcoordinateghost,29
            je gameloop2

            continue51g0:

            cmp ycoordinateghost,8
            jne continue610g

            cmp xcoordinateghost,16
            je gameloop2

            cmp xcoordinateghost,54
            je gameloop2

            cmp xcoordinateghost,92
            je gameloop2

            continue610g:

            cmp ycoordinateghost,15
            jne continue710g

            cmp xcoordinateghost,16
            je gameloop2

            cmp xcoordinateghost,54
            je gameloop2

            cmp xcoordinateghost,92
            je gameloop2

            continue710g:

            cmp ycoordinateghost,23
            jne continue810g

            cmp xcoordinateghost,16
            je gameloop2

            cmp xcoordinateghost,54
            je gameloop2

            cmp xcoordinateghost,92
            je gameloop2

            continue810g:

            cmp xcoordinateghost, 118
            je gameloop2

            call updateghost
            inc xcoordinateghost
            call drawghost

            jmp gameloop2

        moveright2:

            mov bl,fruitxcoordinate

            cmp bl,xcoordinate
            jnz notfruity7
            
            mov bl,fruitycoordinate
            
            cmp bl,ycoordinate
            jnz notfruity7

            add score,10

            mov fruitxcoordinate,-1
            mov fruitycoordinate,-1

            notfruity7:

            mov bl,heartxcoordinate

            cmp bl,xcoordinate
            jnz nothearty7
            
            mov bl,heartycoordinate
            
            cmp bl,ycoordinate
            jnz nothearty7

            add lives,1
            add score, 5

            mov heartxcoordinate,-1
            mov heartycoordinate,-1

            nothearty7:

            cmp ycoordinate,5
            jne continue210

            cmp xcoordinate,4
            je gameloop2

            cmp xcoordinate,54
            je gameloop2

            cmp xcoordinate,79
            je gameloop2

            cmp xcoordinate,104
            je gameloop2

            cmp xcoordinate,29
            je gameloop2
            
            continue210:

            cmp ycoordinate,12
            jne continue310

            cmp xcoordinate,4
            je gameloop2

            cmp xcoordinate,54
            je gameloop2
            
            cmp xcoordinate,79
            je gameloop2

            cmp xcoordinate,104
            je gameloop2

            cmp xcoordinate,29
            je gameloop2

            continue310:

            cmp ycoordinate,19
            jne continue410

            cmp xcoordinate,4
            je gameloop2

            cmp xcoordinate,29
            je gameloop2

            cmp xcoordinate,54
            je gameloop2

            cmp xcoordinate,79
            je gameloop2

            cmp xcoordinate,104
            je gameloop2

            continue410:

            cmp ycoordinate,26
            jne continue510

            cmp xcoordinate,4
            je gameloop2

            cmp xcoordinate,54
            je gameloop2

            cmp xcoordinate,79
            je gameloop2

            cmp xcoordinate,104
            je gameloop2

            cmp xcoordinate,29
            je gameloop2

            continue510:

            cmp ycoordinate,8
            jne continue610

            cmp xcoordinate,16
            je gameloop2

            cmp xcoordinate,54
            je gameloop2

            cmp xcoordinate,92
            je gameloop2

            continue610:

            cmp ycoordinate,15
            jne continue710

            cmp xcoordinate,16
            je gameloop2

            cmp xcoordinate,54
            je gameloop2

            cmp xcoordinate,92
            je gameloop2

            continue710:

            cmp ycoordinate,23
            jne continue810

            cmp xcoordinate,16
            je gameloop2

            cmp xcoordinate,54
            je gameloop2

            cmp xcoordinate,92
            je gameloop2

            continue810:

            cmp xcoordinate, 118
            je gameloop2

            call updateplayer
            inc xcoordinate
            call drawplayer

            cmp ycoordinateghost,5
            jne continue2g0

            cmp xcoordinateghost,115
            je gameloop2

            cmp xcoordinateghost,90
            je gameloop2

            cmp xcoordinateghost,65
            je gameloop2

            cmp xcoordinateghost,40
            je gameloop2

            cmp xcoordinateghost,15
            je gameloop2

            continue2g0:

            cmp ycoordinateghost,12
            jne continue3g0

            cmp xcoordinateghost,115
            je gameloop2

            cmp xcoordinateghost,90
            je gameloop2

            cmp xcoordinateghost,65
            je gameloop2

            cmp xcoordinateghost,40
            je gameloop2

            cmp xcoordinateghost,15
            je gameloop2

            continue3g0:

            cmp ycoordinateghost,19
            jne continue4g0

            cmp xcoordinateghost,115
            je gameloop2

            cmp xcoordinateghost,90
            je gameloop2

            cmp xcoordinateghost,65
            je gameloop2

            cmp xcoordinateghost,40
            je gameloop2

            cmp xcoordinateghost,15
            je gameloop2

            continue4g0:

            cmp ycoordinateghost,26
            jne continue5g0

            cmp xcoordinateghost,115
            je gameloop2

            cmp xcoordinateghost,90
            je gameloop2

            cmp xcoordinateghost,65
            je gameloop2

            cmp xcoordinateghost,40
            je gameloop2

            cmp xcoordinateghost,15
            je gameloop2

            continue5g0:

            cmp ycoordinateghost,8
            jne continue60g

            cmp xcoordinateghost,103
            je gameloop2

            cmp xcoordinateghost,65
            je gameloop2

            cmp xcoordinateghost,27
            je gameloop2

            continue60g:

            cmp ycoordinateghost,15
            jne continue70g

            cmp xcoordinateghost,103
            je gameloop2

            cmp xcoordinateghost,65
            je gameloop2

            cmp xcoordinateghost,27
            je gameloop2

            continue70g:

            cmp ycoordinateghost,23
            jne continue80g

            cmp xcoordinateghost,103
            je gameloop2

            cmp xcoordinateghost,65
            je gameloop2

            cmp xcoordinateghost,27
            je gameloop2

            continue80g:

            cmp xcoordinateghost, 1
            je gameloop2
            
            call updateghost
            dec xcoordinateghost
            call drawghost

            jmp gameloop2

        pausescreen2:

            call clrscr

            mov eax, white
            call settextcolor

            mov dh, 3
            mov dl, 45
            call gotoxy

            mov edx, offset pausestring
            call writestring

            mov dl, 47
            mov dh, 10
            call gotoxy

            mov edx, offset pause1
            call writestring

            mov dl, 47
            mov dh, 12
            call gotoxy

            mov edx, offset pause2
            call writestring

            mov dl, 47
            mov dh, 14
            call gotoxy

            mov edx, offset pause3
            call writestring

            mov dl, 47
            mov dh, 17
            call gotoxy

            mov edx, offset choiceask
            call writestring

            mov eax, offset startinput 
            call Readint

            cmp al, 1
            je unpause2

            cmp al, 2
            je restart2

            cmp al, 3
            je exitscreen

            unpause2:

                call clrscr
                
                mov esi, offset xcoordinatecoin
                mov edi, offset ycoordinatecoin
                mov ecx, 50
                
                loooop2:
                
                    call drawcoin
                    
                    inc esi
                    inc edi

                loop loooop2

                call drawwalls
                
                mov eax, magenta 
                call settextcolor

                call drawobstacles2
                call drawplayer
                call drawghost

                jmp gameloop2
    
            restart2:

                mov score, 0
                mov lives, 3
                jmp startgame

    jmp gameloop2

    LEVEL3:

    mov level, 3

    call clrscr

    mov eax, yellow
    call settextcolor

    mov dl, 34-12
    mov dh, 6-2
    call gotoxy

    mov eax, 200
    call delay

    mov edx, offset levelc1
    call writestring

    mov dl, 34-12
    mov dh, 7-2
    call gotoxy

    mov eax, 200
    call delay

    mov edx, offset levelc2
    call writestring

    mov dl, 34-12
    mov dh, 8-2
    call gotoxy

    mov eax, 200
    call delay

    mov edx, offset levelc3
    call writestring

    mov dl, 34-12
    mov dh, 9-2
    call gotoxy

    mov eax, 200
    call delay

    mov edx, offset levelc4
    call writestring

    mov dl, 34-12
    mov dh, 10-2
    call gotoxy

    mov eax, 200
    call delay

    mov edx, offset levelc5
    call writestring

    mov eax, white
    call settextcolor

    mov dl, 47
    mov dh, 16
    call gotoxy

    mov eax, 200
    call delay

    mov edx, offset advance
    call writestring

    call readchar

    call clrscr

    mov eax, yellow
    call settextcolor

    mov dl, 34-1
    mov dh, 6
    call gotoxy

    mov edx, offset level31
    call writestring

    mov dl, 34-1
    mov dh, 7
    call gotoxy

    mov eax, 100
    call delay

    mov edx, offset level32
    call writestring

    mov dl, 34-1
    mov dh, 8
    call gotoxy

    mov eax, 100
    call delay

    mov edx, offset level33
    call writestring

    mov dl, 34-1
    mov dh, 9
    call gotoxy

    mov eax, 100
    call delay

    mov edx, offset level34
    call writestring

    mov dl, 34-1
    mov dh, 10
    call gotoxy

    mov eax, 100
    call delay

    mov edx, offset level35
    call writestring

    mov dl, 34-1
    mov dh, 11
    call gotoxy

    mov eax, 100
    call delay

    mov edx, offset level36
    call writestring

    mov eax, white
    call settextcolor

    mov dl, 47
    mov dh, 16
    call gotoxy

    mov eax, 100
    call delay

    mov edx, offset advance
    call writestring

    call readchar

    call clrscr

    mov esi, offset xcoordinatecoin
    mov edi, offset ycoordinatecoin
    mov ecx, 50

    call randomize

    looop3:

        call createrandomcoin
        call drawcoin

        inc esi
        inc edi

    loop looop3
    
    call drawwalls
    
    mov xcoordinate, 2
    mov ycoordinate, 20

    call drawplayer

    mov xcoordinateghost, 116
    mov ycoordinateghost, 10

    mov fruitxcoordinate, 60
    mov fruitycoordinate, 14

    mov heartxcoordinate, 118
    mov heartycoordinate, 25

    call drawghost

    call drawghost2
    call drawghost3

    mov eax, gray 
    call settextcolor

    call drawobstacles3

    sub score, 5

    gameloop3:

        cmp score, 157
        jae winscreen

        ; portal

        cmp score, 100
        jb skipportal

        mov portalxcoordinate, 6
        mov portalycoordinate, 10

        call drawportal

        mov portalxcoordinate, 57
        mov portalycoordinate, 14

        call drawportal

        cmp ycoordinate, 10
        jne skipcheck

        cmp xcoordinate, 6
        jne skipcheck

        call updateplayer
        mov xcoordinate, 57
        mov ycoordinate, 14
        call drawplayer

        jmp skipportal

        skipcheck:

        cmp ycoordinate, 14
        jne skipcheck1

        cmp xcoordinate, 57
        jne skipcheck1

        call updateplayer
        mov xcoordinate, 6
        mov ycoordinate, 10
        call drawplayer

        skipcheck1:

        skipportal:

        ; fruit

        cmp score, 98
        jne nofruit11

        mov fruitxcoordinate, 60
        mov fruitycoordinate, 11

        call drawfruit

        nofruit11:

        cmp score, 140
        jne nofruit22

        mov fruitxcoordinate, 60
        mov fruitycoordinate, 14

        call drawfruit

        nofruit22:

        ; heart

        cmp score, 133
        jne noheart2

        mov heartxcoordinate, 118
        mov heartycoordinate, 25

        call drawheart

        noheart2:

        ; death

        cmp score, 126
        jne nodeath

        mov deathxcoordinate, 74
        mov deathycoordinate, 11

        call drawdeath

        nodeath:

        ; freezer

        cmp score, 84
        jne nofreeze

        mov freezexcoordinate, 69
        mov freezeycoordinate, 4

        call drawfreeze

        nofreeze:

        ; getting points:
        
        mov ecx, 50
        mov esi, offset xcoordinatecoin
        mov edi, offset ycoordinatecoin

        mov bl,xcoordinate
        mov dl,ycoordinate

        looop13:

            cmp bl,[esi]
            jne breakit3

            cmp dl,[edi]
            je collecting3

            breakit3:

            inc edi
            inc esi

        loop looop13
        
        collecting3:

        cmp byte ptr [esi], -1
        je notcollecting3

        mov eax, green
        call settextcolor

        add score, 7
        mov byte ptr [esi], -1
        
        jmp drawscore3

        notcollecting3:

        mov eax, white 
        call settextcolor

        drawscore3:
        
        mov dl,55
        mov dh,0
        call gotoxy
        
        mov edx, offset scorestring
        call writestring

        mov al,score
        sub al, 7
        call writeint

        ; show name

        mov dl, 3
        mov dh, 0
        call gotoxy

        mov eax, white
        call settextcolor

        mov edx, offset namestring
        call writestring

        mov edx, offset username
        call writestring

        ; show lives

        mov bl,xcoordinate
        mov dl,ycoordinate

        mov al,xcoordinateghost
        mov cl,ycoordinateghost

        cmp bl, al
        jne skipp3

        cmp dl, cl
        jne skipp3

        dec lives

        cmp lives, 0
        je exitscreen

        cmp score, 64
        jb skipminus3

        sub score, 7

        skipminus3:

        cmp score, 107
        jae skipscoreset3

        mov dl,65
        mov dh,0
        call gotoxy

        mov edx, offset blank
        call writestring

        skipscoreset3:

        mov eax, red
        call settextcolor

        mov dl,55
        mov dh,0
        call gotoxy
        
        mov edx, offset scorestring
        call writestring

        mov al,score
        sub al, 7
        call writeint

        call updateplayer
        mov ycoordinate, 15
        mov xcoordinate, 2
        call drawplayer
        call updateghost
        call updateghost2
        call updateghost3
        mov ycoordinateghost, 10
        mov xcoordinateghost, 116
        mov ycoordinateghost2, 27
        mov xcoordinateghost2, 16
        mov ycoordinateghost3, 2
        mov xcoordinateghost3, 2
        call drawghost
        call drawghost2
        call drawghost3

        skipp3:

        mov dl, 108
        mov dh, 0
        call gotoxy

        mov edx, offset livesstring
        call writestring

        mov al, lives
        call writeint

        mov bl,xcoordinate
        mov dl,ycoordinate

        mov al,xcoordinateghost2
        mov cl,ycoordinateghost2

        cmp bl, al
        jne skipp4

        cmp dl, cl
        jne skipp4

        dec lives

        cmp lives, 0
        je exitscreen

        cmp score, 64
        jb skipminus4

        sub score, 7

        skipminus4:

        cmp score, 107
        jae skipscoreset4

        mov dl,65
        mov dh,0
        call gotoxy

        mov edx, offset blank
        call writestring

        skipscoreset4:

        mov eax, red
        call settextcolor

        mov dl,55
        mov dh,0
        call gotoxy
        
        mov edx, offset scorestring
        call writestring

        mov al,score
        sub al, 7
        call writeint

        call updateplayer
        mov ycoordinate, 15
        mov xcoordinate, 2
        call drawplayer
        call updateghost
        call updateghost2
        call updateghost3
        mov ycoordinateghost, 10
        mov xcoordinateghost, 116
        mov ycoordinateghost2, 27
        mov xcoordinateghost2, 16
        mov ycoordinateghost3, 2
        mov xcoordinateghost3, 2
        call drawghost
        call drawghost2
        call drawghost3

        skipp4:

        mov dl, 108
        mov dh, 0
        call gotoxy

        mov edx, offset livesstring
        call writestring

        mov al, lives
        call writeint

        mov bl,xcoordinate
        mov dl,ycoordinate

        mov al,xcoordinateghost3
        mov cl,ycoordinateghost3

        cmp bl, al
        jne skipp5

        cmp dl, cl
        jne skipp5

        dec lives

        cmp lives, 0
        je exitscreen

        cmp score, 64
        jb skipminus5

        sub score, 7

        skipminus5:

        cmp score, 107
        jae skipscoreset5

        mov dl,65
        mov dh,0
        call gotoxy

        mov edx, offset blank
        call writestring

        skipscoreset5:

        mov eax, red
        call settextcolor

        mov dl,55
        mov dh,0
        call gotoxy
        
        mov edx, offset scorestring
        call writestring

        mov al,score
        sub al, 7
        call writeint

        call updateplayer
        mov ycoordinate, 15
        mov xcoordinate, 2
        call drawplayer
        call updateghost
        call updateghost2
        call updateghost3
        mov ycoordinateghost, 10
        mov xcoordinateghost, 116
        mov ycoordinateghost2, 27
        mov xcoordinateghost2, 16
        mov ycoordinateghost3, 2
        mov xcoordinateghost3, 2
        call drawghost
        call drawghost2
        call drawghost3

        skipp5:

        mov dl, 108
        mov dh, 0
        call gotoxy

        mov edx, offset livesstring
        call writestring

        mov al, lives
        call writeint

        cmp freezetimer, 0
        jg skipauto

        ; random ghost movement

        call updateghost
        call ghostmovement31
        call drawghost
        call updateghost2
        call ghostmovement32
        call drawghost2
        call updateghost3
        call ghostmovement33
        call drawghost3

        skipauto:

        cmp freezetimer, 0
        jle nosubtime

        dec freezetimer

        nosubtime:

        ; get user key input:
        
        mov eax, 75
        call delay
        
        call readkey
        mov input,al
        
        cmp input,"x"
        je exitscreen

        cmp input,"w"
        je moveup3

        cmp input,"s"
        je movedown3

        cmp input,"a"
        je moveleft3

        cmp input,"d"
        je moveright3

        cmp input,"p"
        je pausescreen3

        jne gameloop3

        moveup3:

            mov bl,fruitxcoordinate
            
            cmp bl,xcoordinate
            jne notfruity8
            
            mov bl,fruitycoordinate
            
            cmp bl,ycoordinate
            jne notfruity8

            add score,14
            
            mov fruitxcoordinate,-1
            mov fruitycoordinate,-1

            notfruity8:

            mov bl,heartxcoordinate
            
            cmp bl,xcoordinate
            jne nothearty8
            
            mov bl,heartycoordinate
            
            cmp bl,ycoordinate
            jne nothearty8

            add lives,1
            add score,7
            
            mov heartxcoordinate,-1
            mov heartycoordinate,-1

            nothearty8:

            mov bl,deathxcoordinate
            
            cmp bl,xcoordinate
            jne notdeathy
            
            mov bl,deathycoordinate
            
            cmp bl,ycoordinate
            jne notdeathy

            jmp exitscreen
            
            mov deathxcoordinate,-1
            mov deathycoordinate,-1

            notdeathy:

            mov bl,freezexcoordinate
            
            cmp bl,xcoordinate
            jne notchilly
            
            mov bl,freezeycoordinate
            
            cmp bl,ycoordinate
            jne notchilly

            mov freezetimer, 50
            add score, 7
            
            mov freezexcoordinate,-1
            mov freezeycoordinate,-1

            notchilly:

            cmp ycoordinate,6
            jne row20z
            je row10z
         
            row10z:

            cmp xcoordinate,4
            jle row20z

            cmp xcoordinate,14
            jle gameloop3

            cmp xcoordinate,29
            jle row20z

            cmp xcoordinate,39
            jle gameloop3

            cmp xcoordinate,54
            jle row20z

            cmp xcoordinate,64
            jle gameloop3

            cmp xcoordinate,79
            jle row20z

            cmp xcoordinate,89
            jle gameloop3

            cmp xcoordinate,104
            jle row20z

            cmp xcoordinate,114
            jle gameloop3

            row20z:

            cmp ycoordinate,13
            jne row30z

            cmp xcoordinate,4
            jle row30z

            cmp xcoordinate,14
            jle gameloop3

            cmp xcoordinate,29
            jle row30z

            cmp xcoordinate,39
            jle gameloop3

            cmp xcoordinate,54
            jle row30z

            cmp xcoordinate,64
            jle gameloop3

            cmp xcoordinate,79
            jle row30z

            cmp xcoordinate,89
            jle gameloop3

            cmp xcoordinate,104
            jle row30z

            cmp xcoordinate,114
            jle gameloop3

            row30z:

            cmp ycoordinate,20
            jne row40z

            cmp xcoordinate,4
            jle row40z

            cmp xcoordinate,14
            jle gameloop3

            cmp xcoordinate,29
            jle row40z

            cmp xcoordinate,39
            jle gameloop3

            cmp xcoordinate,54
            jle row40z

            cmp xcoordinate,64
            jle gameloop3

            cmp xcoordinate,79
            jle row40z
            
            cmp xcoordinate,89
            jle gameloop3

            cmp xcoordinate,104
            jle row40z

            cmp xcoordinate,114
            jle gameloop3

            row40z:

            cmp ycoordinate,27
            jne goon0z

            cmp xcoordinate,4
            jle goon0z

            cmp xcoordinate,14
            jle gameloop3
            
            cmp xcoordinate,29
            jle goon0z

            cmp xcoordinate,39
            jle gameloop3

            cmp xcoordinate,54
            jle goon0z

            cmp xcoordinate,64
            jle gameloop3

            cmp xcoordinate,79
            jle goon0z

            cmp xcoordinate,89
            jle gameloop3

            cmp xcoordinate,104
            jle goon0z

            cmp xcoordinate,114
            jle gameloop3

            goon0z:

            cmp ycoordinate, 9
            jne nocollz

            cmp xcoordinate, 16
            jle nocollz
            
            cmp xcoordinate, 26
            jle gameloop3

            cmp xcoordinate, 54
            jle nocollz

            cmp xcoordinate, 64
            jle gameloop3

            cmp xcoordinate, 71
            jle nocollz

            cmp xcoordinate, 72
            jle gameloop3

            cmp xcoordinate, 92
            jle nocollz

            cmp xcoordinate, 102
            jle gameloop3

            nocollz:

            cmp ycoordinate, 16
            jne row6z

            cmp xcoordinate, 16
            jle row6z

            cmp xcoordinate, 26
            jle gameloop3

            cmp xcoordinate, 46
            jle row6z

            cmp xcoordinate, 47
            jle gameloop3

            cmp xcoordinate, 54
            jle row6z

            cmp xcoordinate, 64
            jle gameloop3

            cmp xcoordinate, 92
            jle row6z

            cmp xcoordinate, 102
            jle gameloop3

            row6z:

            cmp ycoordinate, 24
            jne row7z

            cmp xcoordinate, 16
            jle row7z

            cmp xcoordinate, 26
            jle gameloop3

            cmp xcoordinate, 46
            jle row7z

            cmp xcoordinate, 47
            jle gameloop3

            cmp xcoordinate, 54
            jle row7z

            cmp xcoordinate, 64
            jle gameloop3

            cmp xcoordinate, 71
            jle row7z

            cmp xcoordinate, 72
            jle gameloop3

            cmp xcoordinate, 92
            jle row7z

            cmp xcoordinate, 102
            jle gameloop3

            row7z:

            cmp ycoordinate, 2  
            je gameloop3

            call updateplayer
            dec ycoordinate
            call drawplayer

            cmp ycoordinateghost,6
            jne continueg0z
            je row1g0z
         
            row1g0z:

            cmp xcoordinateghost,4
            jle continueg0z

            cmp xcoordinateghost,14
            jle gameloop3

            cmp xcoordinateghost,29
            jle continueg0z

            cmp xcoordinateghost,39
            jle gameloop3

            cmp xcoordinateghost,54
            jle continueg0z

            cmp xcoordinateghost,64
            jle gameloop3

            cmp xcoordinateghost,79
            jle continueg0z

            cmp xcoordinateghost,89
            jle gameloop3

            cmp xcoordinateghost,104
            jle continueg0z

            cmp xcoordinateghost,114
            jle gameloop3
        
            continueg0z:

            row2g0z:

            cmp ycoordinateghost,13
            jne row3g0z

            cmp xcoordinateghost,4
            jle row3g0z
            
            cmp xcoordinateghost,14
            jle gameloop3

            cmp xcoordinateghost,29
            jle row3g0z

            cmp xcoordinateghost,39
            jle gameloop3

            cmp xcoordinateghost,54
            jle row3g0z

            cmp xcoordinateghost,64
            jle gameloop3

            cmp xcoordinateghost,79
            jle row3g0z

            cmp xcoordinateghost,89
            jle gameloop3
            
            cmp xcoordinateghost,104
            jle row3g0z

            cmp xcoordinateghost,114
            jle gameloop3

            row3g0z:

            cmp ycoordinateghost,20
            jne row4g0z

            cmp xcoordinateghost,4
            jle row4g0z

            cmp xcoordinateghost,14
            jle gameloop3

            cmp xcoordinateghost,29
            jle row4g0z

            cmp xcoordinateghost,39
            jle gameloop3

            cmp xcoordinateghost,54
            jle row4g0z

            cmp xcoordinateghost,64
            jle gameloop3

            cmp xcoordinateghost,79
            jle row4g0z

            cmp xcoordinateghost,89
            jle gameloop3

            cmp xcoordinateghost,104
            jle row4g0z

            cmp xcoordinateghost,114
            jle gameloop3

            row4g0z:

            cmp ycoordinateghost,27
            jne goong0z

            cmp xcoordinateghost,4
            jle goong0z

            cmp xcoordinateghost,14
            jle gameloop3

            cmp xcoordinateghost,29
            jle goong0z

            cmp xcoordinateghost,39
            jle gameloop3

            cmp xcoordinateghost,54
            jle goong0z

            cmp xcoordinateghost,64
            jle gameloop3

            cmp xcoordinateghost,79
            jle goong0z

            cmp xcoordinateghost,89
            jle gameloop3

            cmp xcoordinateghost,104
            jle goong0z

            cmp xcoordinateghost,114
            jle gameloop3

            goong0z:

            cmp ycoordinateghost, 9
            jne nocoll0z

            cmp xcoordinateghost, 16
            jle nocoll0z

            cmp xcoordinateghost, 26
            jle gameloop3

            cmp xcoordinateghost, 54
            jle nocoll0z

            cmp xcoordinateghost, 64
            jle gameloop3

            cmp xcoordinateghost, 92
            jle nocoll0z

            cmp xcoordinateghost, 102
            jle gameloop3

            nocoll0z:

            cmp ycoordinateghost, 16
            jne row6gz

            cmp xcoordinateghost, 16
            jle row6gz

            cmp xcoordinateghost, 26
            jle gameloop3

            cmp xcoordinateghost, 54
            jle row6gz

            cmp xcoordinateghost, 64
            jle gameloop3

            cmp xcoordinateghost, 92
            jle row6gz

            cmp xcoordinateghost, 102
            jle gameloop3

            row6gz:

            cmp ycoordinateghost, 24
            jne row7gz

            cmp xcoordinateghost, 16
            jle row7gz

            cmp xcoordinateghost, 26
            jle gameloop3

            cmp xcoordinateghost, 46
            jle row7gz

            cmp xcoordinateghost, 47
            jle gameloop3

            cmp xcoordinateghost, 54
            jle row7gz
            
            cmp xcoordinateghost, 64
            jle gameloop3

            cmp xcoordinateghost, 92
            jle row7gz

            cmp xcoordinateghost, 102
            jle gameloop3

            cmp xcoordinateghost, 71
            jle row7gz

            cmp xcoordinateghost, 72
            jle gameloop3

            row7gz:

            cmp ycoordinateghost, 2
            je gameloop3

            call updateghost
            dec ycoordinateghost
            call drawghost

            jmp gameloop3

        movedown3:
            
            mov bl,fruitxcoordinate
            
            cmp bl,xcoordinate
            jne notfruity4
            
            mov bl,fruitycoordinate
            
            cmp bl,ycoordinate
            jne notfruity4

            add score,14
            
            mov fruitxcoordinate,-1
            mov fruitycoordinate,-1

            notfruity4:

            mov bl,heartxcoordinate
            
            cmp bl,xcoordinate
            jne nothearty4
            
            mov bl,heartycoordinate
            
            cmp bl,ycoordinate
            jne nothearty4

            add lives,1
            add score,7
            
            mov heartxcoordinate,-1
            mov heartycoordinate,-1

            nothearty4:

            mov bl,deathxcoordinate
            
            cmp bl,xcoordinate
            jne notdeathy2
            
            mov bl,deathycoordinate
            
            cmp bl,ycoordinate
            jne notdeathy2

            jmp exitscreen
            
            mov deathxcoordinate,-1
            mov deathycoordinate,-1

            notdeathy2:

            mov bl,freezexcoordinate
            
            cmp bl,xcoordinate
            jne notchilly2
            
            mov bl,freezeycoordinate
            
            cmp bl,ycoordinate
            jne notchilly2

            mov freezetimer, 50
            add score, 7
            
            mov freezexcoordinate,-1
            mov freezeycoordinate,-1

            notchilly2:

            cmp ycoordinate,4
            jne continue10z
            je row110z
         
            row110z:

            cmp xcoordinate,4
            jle continue10z

            cmp xcoordinate,14
            jle gameloop3

            cmp xcoordinate,29
            jle continue10z

            cmp xcoordinate,39
            jle gameloop3

            cmp xcoordinate,54
            jle continue10z

            cmp xcoordinate,64
            jle gameloop3

            cmp xcoordinate,79
            jle continue10z

            cmp xcoordinate,89
            jle gameloop3

            cmp xcoordinate,104
            jle continue10z

            cmp xcoordinate,114
            jle gameloop3

            continue10z:

            row210z:

            cmp ycoordinate,11
            jne row310z

            cmp xcoordinate,4
            jle row310z

            cmp xcoordinate,14
            jle gameloop3

            cmp xcoordinate,29
            jle row310z

            cmp xcoordinate,39
            jle gameloop3

            cmp xcoordinate,54
            jle row310z

            cmp xcoordinate,64
            jle gameloop3

            cmp xcoordinate,79
            jle row310z

            cmp xcoordinate,89
            jle gameloop3

            cmp xcoordinate,104
            jle row310z

            cmp xcoordinate,114
            jle gameloop3

            row310z:

            cmp ycoordinate,18
            jne row410z

            cmp xcoordinate,4
            jle row410z

            cmp xcoordinate,14
            jle gameloop3
            
            cmp xcoordinate,29
            jle row410z

            cmp xcoordinate,39
            jle gameloop3

            cmp xcoordinate,54
            jle row410z

            cmp xcoordinate,64
            jle gameloop3

            cmp xcoordinate,79
            jle row410z

            cmp xcoordinate,89
            jle gameloop3

            cmp xcoordinate,104
            jle row410z

            cmp xcoordinate,114
            jle gameloop3

            row410z:

            cmp ycoordinate,25
            jne goon10z

            cmp xcoordinate,4
            jle goon10z

            cmp xcoordinate,14
            jle gameloop3

            cmp xcoordinate,29
            jle goon10z

            cmp xcoordinate,39
            jle gameloop3

            cmp xcoordinate,54
            jle goon10z

            cmp xcoordinate,64
            jle gameloop3

            cmp xcoordinate,79
            jle goon10z

            cmp xcoordinate,89
            jle gameloop3

            cmp xcoordinate,104
            jle goon10z

            cmp xcoordinate,114
            jle gameloop3

            goon10z:

            cmp ycoordinate, 7
            jne nocoll1z

            cmp xcoordinate, 16
            jle nocoll1z

            cmp xcoordinate, 26
            jle gameloop3

            cmp xcoordinate, 46
            jle nocoll1z

            cmp xcoordinate, 47
            jle gameloop3 

            cmp xcoordinate, 54
            jle nocoll1z

            cmp xcoordinate, 64
            jle gameloop3

            cmp xcoordinate, 71
            jle nocoll1z

            cmp xcoordinate, 72
            jle gameloop3

            cmp xcoordinate, 92
            jle nocoll1z

            cmp xcoordinate, 102
            jle gameloop3

            nocoll1z:

            cmp ycoordinate, 14
            jne nocoll12z

            cmp xcoordinate, 16
            jle nocoll12z

            cmp xcoordinate, 26
            jle gameloop3

            cmp xcoordinate, 54
            jle nocoll12z

            cmp xcoordinate, 64
            jle gameloop3

            cmp xcoordinate, 92
            jle nocoll12z

            cmp xcoordinate, 102
            jle gameloop3

            nocoll12z:

            cmp ycoordinate, 22
            jne nocoll13z

            cmp xcoordinate, 16
            jle nocoll13z

            cmp xcoordinate, 26
            jle gameloop3

            cmp xcoordinate, 54
            jle nocoll13z

            cmp xcoordinate, 64
            jle gameloop3

            cmp xcoordinate, 92
            jle nocoll13z
            
            cmp xcoordinate, 102
            jle gameloop3

            nocoll13z:

            cmp ycoordinate, 16
            jne nocoll14z

            cmp xcoordinate, 47
            je gameloop3

            nocoll14z:

            cmp ycoordinate, 9
            jne nocoll15z

            cmp xcoordinate, 72
            je gameloop3

            nocoll15z:
            
            cmp ycoordinate,28
            je gameloop3

            call updateplayer
            inc ycoordinate
            call drawplayer

            cmp ycoordinateghost,4
            jne continue1g0z
            je row11g0z
         
            row11g0z:

            cmp xcoordinateghost,4
            jle continue1g0z

            cmp xcoordinateghost,14
            jle gameloop3

            cmp xcoordinateghost,29
            jle continue1g0z

            cmp xcoordinateghost,39
            jle gameloop3

            cmp xcoordinateghost,54
            jle continue1g0z

            cmp xcoordinateghost,64
            jle gameloop3

            cmp xcoordinateghost,79
            jle continue1g0z

            cmp xcoordinateghost,89
            jle gameloop3

            cmp xcoordinateghost,104
            jle continue1g0z

            cmp xcoordinateghost,114
            jle gameloop3

            continue1g0z:

            row21g0z:

            cmp ycoordinateghost,11
            jne row31g0z

            cmp xcoordinateghost,4
            jle row31g0z

            cmp xcoordinateghost,14
            jle gameloop3

            cmp xcoordinateghost,29
            jle row31g0z

            cmp xcoordinateghost,39
            jle gameloop3

            cmp xcoordinateghost,54
            jle row31g0z

            cmp xcoordinateghost,64
            jle gameloop3

            cmp xcoordinateghost,79
            jle row31g0z

            cmp xcoordinateghost,89
            jle gameloop3

            cmp xcoordinateghost,104
            jle row31g0z

            cmp xcoordinateghost,114
            jle gameloop3

            row31g0z:

            cmp ycoordinateghost,18
            jne row41g0z

            cmp xcoordinateghost,4
            jle row41g0z

            cmp xcoordinateghost,14
            jle gameloop3

            cmp xcoordinateghost,29
            jle row41g0z

            cmp xcoordinateghost,39
            jle gameloop3

            cmp xcoordinateghost,54
            jle row41g0z

            cmp xcoordinateghost,64
            jle gameloop3

            cmp xcoordinateghost,79
            jle row41g0z

            cmp xcoordinateghost,89
            jle gameloop3

            cmp xcoordinateghost,104
            jle row41g0z

            cmp xcoordinateghost,114
            jle gameloop3

            row41g0z:

            cmp ycoordinateghost,25
            jne goon1g0z

            cmp xcoordinateghost,4
            jle goon1g0z

            cmp xcoordinateghost,14
            jle gameloop3

            cmp xcoordinateghost,29
            jle goon1g0z

            cmp xcoordinateghost,39
            jle gameloop3

            cmp xcoordinateghost,54
            jle goon1g0z

            cmp xcoordinateghost,64
            jle gameloop3

            cmp xcoordinateghost,79
            jle goon1g0z

            cmp xcoordinateghost,89
            jle gameloop3

            cmp xcoordinateghost,104
            jle goon1g0z

            cmp xcoordinateghost,114
            jle gameloop3

            goon1g0z:

            cmp ycoordinateghost, 7
            jne nocoll1gz

            cmp xcoordinateghost, 16
            jle nocoll1gz

            cmp xcoordinateghost, 26
            jle gameloop3

            cmp xcoordinateghost, 46
            jle nocoll1gz

            cmp xcoordinateghost, 47
            jle gameloop3

            cmp xcoordinateghost, 54
            jle nocoll1gz

            cmp xcoordinateghost, 64
            jle gameloop3

            cmp xcoordinateghost, 71
            jle nocoll1gz

            cmp xcoordinateghost, 72
            jle gameloop3

            cmp xcoordinateghost, 92
            jle nocoll1gz

            cmp xcoordinateghost, 102
            jle gameloop3

            nocoll1gz:

            cmp ycoordinateghost, 14
            jne nocoll12gz

            cmp xcoordinateghost, 16
            jle nocoll12gz

            cmp xcoordinateghost, 26
            jle gameloop3

            cmp xcoordinateghost, 54
            jle nocoll12gz

            cmp xcoordinateghost, 64
            jle gameloop3

            cmp xcoordinateghost, 92
            jle nocoll12gz

            cmp xcoordinateghost, 102
            jle gameloop3

            nocoll12gz:

            cmp ycoordinateghost, 22
            jne nocoll13gz

            cmp xcoordinateghost, 16
            jle nocoll13gz

            cmp xcoordinateghost, 26
            jle gameloop3

            cmp xcoordinateghost, 54
            jle nocoll13gz

            cmp xcoordinateghost, 64
            jle gameloop3

            cmp xcoordinateghost, 92
            jle nocoll13gz
            
            cmp xcoordinateghost, 102
            jle gameloop3

            nocoll13gz:

            cmp ycoordinateghost, 28
            je gameloop3

            call updateghost
            inc ycoordinateghost
            call drawghost

            jmp gameloop3

        moveleft3:          

            mov bl,fruitxcoordinate
            
            cmp bl,xcoordinate
            jne notfruity5
            
            mov bl,fruitycoordinate
            
            cmp bl,ycoordinate
            jne notfruity5

            add score,14
            
            mov fruitxcoordinate,-1
            mov fruitycoordinate,-1

            notfruity5:

            mov bl,heartxcoordinate
            
            cmp bl,xcoordinate
            jne nothearty5
            
            mov bl,heartycoordinate
            
            cmp bl,ycoordinate
            jne nothearty5

            add lives,1
            add score,7
            
            mov heartxcoordinate,-1
            mov heartycoordinate,-1

            nothearty5:

            mov bl,deathxcoordinate
            
            cmp bl,xcoordinate
            jne notdeathy3
            
            mov bl,deathycoordinate
            
            cmp bl,ycoordinate
            jne notdeathy3

            jmp exitscreen
            
            mov deathxcoordinate,-1
            mov deathycoordinate,-1

            notdeathy3:

            mov bl,freezexcoordinate
            
            cmp bl,xcoordinate
            jne notchilly3
            
            mov bl,freezeycoordinate
            
            cmp bl,ycoordinate
            jne notchilly3

            mov freezetimer, 50
            add score, 7
            
            mov freezexcoordinate,-1
            mov freezeycoordinate,-1

            notchilly3:

            cmp ycoordinate,5
            jne continue20z

            cmp xcoordinate,115
            je gameloop3

            cmp xcoordinate,90
            je gameloop3

            cmp xcoordinate,65
            je gameloop3

            cmp xcoordinate,40
            je gameloop3

            cmp xcoordinate,15
            je gameloop3

            continue20z:

            cmp ycoordinate,12
            jne continue30z

            cmp xcoordinate,115
            je gameloop3

            cmp xcoordinate,90
            je gameloop3

            cmp xcoordinate,65
            je gameloop3

            cmp xcoordinate,40
            je gameloop3

            cmp xcoordinate,15
            je gameloop3

            cmp xcoordinate,48
            je gameloop3

            cmp xcoordinate,73
            je gameloop3

            continue30z:

            cmp ycoordinate,19
            jne continue40z
            
            cmp xcoordinate,115
            je gameloop3

            cmp xcoordinate,90
            je gameloop3

            cmp xcoordinate,65
            je gameloop3

            cmp xcoordinate,40
            je gameloop3

            cmp xcoordinate,15
            je gameloop3

            cmp xcoordinate,48
            je gameloop3

            cmp xcoordinate,73
            je gameloop3
            
            continue40z:

            cmp ycoordinate,26
            jne continue50z

            cmp xcoordinate,115
            je gameloop3

            cmp xcoordinate,90
            je gameloop3

            cmp xcoordinate,65
            je gameloop3

            cmp xcoordinate,40
            je gameloop3

            cmp xcoordinate,15
            je gameloop3

            continue50z:

            cmp ycoordinate,8
            jne continue60z

            cmp xcoordinate,103
            je gameloop3

            cmp xcoordinate,65
            je gameloop3

            cmp xcoordinate,27
            je gameloop3

            cmp xcoordinate,48
            je gameloop3

            cmp xcoordinate,73
            je gameloop3

            continue60z:

            cmp ycoordinate,15
            jne continue70z

            cmp xcoordinate,103
            je gameloop3

            cmp xcoordinate,65
            je gameloop3

            cmp xcoordinate,27
            je gameloop3

            cmp xcoordinate,48
            je gameloop3

            cmp xcoordinate,73
            je gameloop3

            continue70z:

            cmp ycoordinate,23
            jne continue80z

            cmp xcoordinate,103
            je gameloop3

            cmp xcoordinate,65
            je gameloop3

            cmp xcoordinate,27
            je gameloop3

            cmp xcoordinate,48
            je gameloop3

            cmp xcoordinate,73
            je gameloop3

            continue80z:

            cmp ycoordinate,9
            jne continue90z

            cmp xcoordinate,48
            je gameloop3

            continue90z:

            cmp ycoordinate,10
            jne continue100z

            cmp xcoordinate,48
            je gameloop3

            cmp xcoordinate,73
            je gameloop3

            continue100z:

            cmp ycoordinate,11
            jne continue101z

            cmp xcoordinate,48
            je gameloop3

            cmp xcoordinate,73
            je gameloop3

            continue101z:

            cmp ycoordinate,13
            jne continue102z

            cmp xcoordinate,48
            je gameloop3

            cmp xcoordinate,73
            je gameloop3

            continue102z:

            cmp ycoordinate,14
            jne continue103z

            cmp xcoordinate,48
            je gameloop3

            cmp xcoordinate,73
            je gameloop3

            continue103z:

            cmp ycoordinate,16
            jne continue104z

            cmp xcoordinate,73
            je gameloop3

            continue104z:

            cmp ycoordinate,17
            jne continue105z

            cmp xcoordinate,48
            je gameloop3

            cmp xcoordinate,73
            je gameloop3

            continue105z:

            cmp ycoordinate,18
            jne continue106z

            cmp xcoordinate,48
            je gameloop3

            cmp xcoordinate,73
            je gameloop3

            continue106z:

            cmp ycoordinate,20
            jne continue107z

            cmp xcoordinate,48
            je gameloop3

            cmp xcoordinate,73
            je gameloop3

            continue107z:

            cmp ycoordinate,21
            jne continue108z

            cmp xcoordinate,48
            je gameloop3

            cmp xcoordinate,73
            je gameloop3

            continue108z:

            cmp ycoordinate,22
            jne continue109z

            cmp xcoordinate,48
            je gameloop3

            cmp xcoordinate,73
            je gameloop3

            continue109z:

            cmp xcoordinate, 1
            je gameloop3

            call updateplayer
            dec xcoordinate
            call drawplayer

            cmp ycoordinateghost,5
            jne continue21g0z

            cmp xcoordinateghost,4
            je gameloop3

            cmp xcoordinateghost,54
            je gameloop3

            cmp xcoordinateghost,79
            je gameloop3

            cmp xcoordinateghost,104
            je gameloop3

            cmp xcoordinateghost,29
            je gameloop3

            cmp xcoordinateghost,46
            je gameloop3

            cmp xcoordinateghost,71
            je gameloop3

            continue21g0z:

            cmp ycoordinateghost,12
            jne continue31g0z

            cmp xcoordinateghost,4
            je gameloop3

            cmp xcoordinateghost,54
            je gameloop3

            cmp xcoordinateghost,79
            je gameloop3

            cmp xcoordinateghost,104
            je gameloop3

            cmp xcoordinateghost,29
            je gameloop3

            cmp xcoordinateghost,46
            je gameloop3

            cmp xcoordinateghost,71
            je gameloop3

            continue31g0z:

            cmp ycoordinateghost,19
            jne continue41g0z

            cmp xcoordinateghost,4
            je gameloop3

            cmp xcoordinateghost,29
            je gameloop3

            cmp xcoordinateghost,54
            je gameloop3

            cmp xcoordinateghost,79
            je gameloop3
            
            cmp xcoordinateghost,104
            je gameloop3

            cmp xcoordinateghost,46
            je gameloop3

            cmp xcoordinateghost,71
            je gameloop3
            
            continue41g0z:

            cmp ycoordinateghost,26
            jne continue51g0z

            cmp xcoordinateghost,4
            je gameloop3

            cmp xcoordinateghost,54
            je gameloop3

            cmp xcoordinateghost,79
            je gameloop3

            cmp xcoordinateghost,104
            je gameloop3

            cmp xcoordinateghost,29
            je gameloop3

            continue51g0z:

            cmp ycoordinateghost,8
            jne continue610gz

            cmp xcoordinateghost,16
            je gameloop3

            cmp xcoordinateghost,54
            je gameloop3

            cmp xcoordinateghost,92
            je gameloop3

            cmp xcoordinateghost,46
            je gameloop3

            cmp xcoordinateghost,71
            je gameloop3

            continue610gz:

            cmp ycoordinateghost,15
            jne continue710gz

            cmp xcoordinateghost,16
            je gameloop3

            cmp xcoordinateghost,54
            je gameloop3

            cmp xcoordinateghost,92
            je gameloop3

            cmp xcoordinateghost,46
            je gameloop3

            cmp xcoordinateghost,71
            je gameloop3

            continue710gz:

            cmp ycoordinateghost,23
            jne continue810gz

            cmp xcoordinateghost,16
            je gameloop3

            cmp xcoordinateghost,54
            je gameloop3

            cmp xcoordinateghost,92
            je gameloop3

            cmp xcoordinateghost,46
            je gameloop3

            cmp xcoordinateghost,71
            je gameloop3

            continue810gz:

            cmp ycoordinateghost,9
            jne continueqq90z

            cmp xcoordinateghost,46
            je gameloop3

            cmp xcoordinateghost,71
            je gameloop3

            continueqq90z:

            cmp ycoordinateghost,10
            jne continueqq100z

            cmp xcoordinateghost,46
            je gameloop3

            cmp xcoordinateghost,71
            je gameloop3

            continueqq100z:

            cmp ycoordinateghost,11
            jne continueqq101z

            cmp xcoordinateghost,46
            je gameloop3

            cmp xcoordinateghost,71
            je gameloop3

            continueqq101z:

            cmp ycoordinateghost,13
            jne continueqq102z

            cmp xcoordinateghost,46
            je gameloop3

            cmp xcoordinateghost,71
            je gameloop3

            continueqq102z:

            cmp ycoordinateghost,14
            jne continueqq103z

            cmp xcoordinateghost,46
            je gameloop3

            cmp xcoordinateghost,71
            je gameloop3

            continueqq103z:

            cmp ycoordinateghost,16
            jne continueqq104z

            cmp xcoordinateghost,46
            je gameloop3

            cmp xcoordinateghost,71
            je gameloop3

            continueqq104z:

            cmp ycoordinateghost,17
            jne continueqq105z

            cmp xcoordinateghost,46
            je gameloop3

            cmp xcoordinateghost,71
            je gameloop3

            continueqq105z:

            cmp ycoordinateghost,18
            jne continueqq106z

            cmp xcoordinateghost,46
            je gameloop3

            cmp xcoordinateghost,71
            je gameloop3

            continueqq106z:

            cmp ycoordinateghost,20
            jne continueqq107z

            cmp xcoordinateghost,46
            je gameloop3

            cmp xcoordinateghost,71
            je gameloop3

            continueqq107z:

            cmp ycoordinateghost,21
            jne continueqq108z

            cmp xcoordinateghost,46
            je gameloop3

            cmp xcoordinateghost,71
            je gameloop3

            continueqq108z:

            cmp ycoordinateghost,22
            jne continueqq109z

            cmp xcoordinateghost,46
            je gameloop3

            cmp xcoordinateghost,71
            je gameloop3

            continueqq109z:

            cmp xcoordinateghost, 118
            je gameloop3

            call updateghost
            inc xcoordinateghost
            call drawghost

            jmp gameloop3

        moveright3:

            mov bl,fruitxcoordinate
            
            cmp bl,xcoordinate
            jne notfruity6
            
            mov bl,fruitycoordinate
            
            cmp bl,ycoordinate
            jne notfruity6

            add score,14
            
            mov fruitxcoordinate,-1
            mov fruitycoordinate,-1

            notfruity6:

            mov bl,heartxcoordinate
            
            cmp bl,xcoordinate
            jne nothearty6
            
            mov bl,heartycoordinate
            
            cmp bl,ycoordinate
            jne nothearty6

            add lives,1
            add score,7
            
            mov heartxcoordinate,-1
            mov heartycoordinate,-1

            nothearty6:

            mov bl,deathxcoordinate
            
            cmp bl,xcoordinate
            jne notdeathy4
            
            mov bl,deathycoordinate
            
            cmp bl,ycoordinate
            jne notdeathy4

            jmp exitscreen

            notdeathy4:

            mov bl,freezexcoordinate
            
            cmp bl,xcoordinate
            jne notchilly4
            
            mov bl,freezeycoordinate
            
            cmp bl,ycoordinate
            jne notchilly4

            mov freezetimer, 50
            add score, 7
            
            mov freezexcoordinate,-1
            mov freezeycoordinate,-1

            notchilly4:

            cmp ycoordinate,5
            jne continue210z

            cmp xcoordinate,4
            je gameloop3

            cmp xcoordinate,54
            je gameloop3

            cmp xcoordinate,79
            je gameloop3

            cmp xcoordinate,104
            je gameloop3

            cmp xcoordinate,29
            je gameloop3
            
            continue210z:

            cmp ycoordinate,12
            jne continue310z

            cmp xcoordinate,4
            je gameloop3

            cmp xcoordinate,54
            je gameloop3
            
            cmp xcoordinate,79
            je gameloop3

            cmp xcoordinate,104
            je gameloop3

            cmp xcoordinate,29
            je gameloop3

            cmp xcoordinate,46
            je gameloop3

            cmp xcoordinate,71
            je gameloop3

            continue310z:

            cmp ycoordinate,19
            jne continue410z

            cmp xcoordinate,4
            je gameloop3

            cmp xcoordinate,29
            je gameloop3

            cmp xcoordinate,54
            je gameloop3

            cmp xcoordinate,79
            je gameloop3

            cmp xcoordinate,104
            je gameloop3

            cmp xcoordinate,46
            je gameloop3

            cmp xcoordinate,71
            je gameloop3

            continue410z:

            cmp ycoordinate,26
            jne continue510z

            cmp xcoordinate,4
            je gameloop3

            cmp xcoordinate,54
            je gameloop3

            cmp xcoordinate,79
            je gameloop3

            cmp xcoordinate,104
            je gameloop3

            cmp xcoordinate,29
            je gameloop3

            continue510z:

            cmp ycoordinate,8
            jne continue610z

            cmp xcoordinate,16
            je gameloop3

            cmp xcoordinate,54
            je gameloop3

            cmp xcoordinate,92
            je gameloop3

            cmp xcoordinate,46
            je gameloop3

            cmp xcoordinate,71
            je gameloop3

            continue610z:

            cmp ycoordinate,15
            jne continue710z

            cmp xcoordinate,16
            je gameloop3

            cmp xcoordinate,54
            je gameloop3

            cmp xcoordinate,92
            je gameloop3

            cmp xcoordinate,46
            je gameloop3

            cmp xcoordinate,71
            je gameloop3

            continue710z:

            cmp ycoordinate,23
            jne continue810z

            cmp xcoordinate,16
            je gameloop3

            cmp xcoordinate,54
            je gameloop3

            cmp xcoordinate,92
            je gameloop3

            cmp xcoordinate,46
            je gameloop3

            cmp xcoordinate,71
            je gameloop3

            continue810z:

            cmp ycoordinate,9
            jne continueq90z

            cmp xcoordinate,46
            je gameloop3

            continueq90z:

            cmp ycoordinate,10
            jne continueq100z

            cmp xcoordinate,46
            je gameloop3

            cmp xcoordinate,71
            je gameloop3

            continueq100z:

            cmp ycoordinate,11
            jne continueq101z

            cmp xcoordinate,46
            je gameloop3

            cmp xcoordinate,71
            je gameloop3

            continueq101z:

            cmp ycoordinate,13
            jne continueq102z

            cmp xcoordinate,46
            je gameloop3

            cmp xcoordinate,71
            je gameloop3

            continueq102z:

            cmp ycoordinate,14
            jne continueq103z

            cmp xcoordinate,46
            je gameloop3

            cmp xcoordinate,71
            je gameloop3

            continueq103z:

            cmp ycoordinate,16
            jne continueq104z

            cmp xcoordinate,71
            je gameloop3

            continueq104z:

            cmp ycoordinate,17
            jne continueq105z

            cmp xcoordinate,46
            je gameloop3

            cmp xcoordinate,71
            je gameloop3

            continueq105z:

            cmp ycoordinate,18
            jne continueq106z

            cmp xcoordinate,46
            je gameloop3

            cmp xcoordinate,71
            je gameloop3

            continueq106z:

            cmp ycoordinate,20
            jne continueq107z

            cmp xcoordinate,46
            je gameloop3

            cmp xcoordinate,71
            je gameloop3

            continueq107z:

            cmp ycoordinate,21
            jne continueq108z

            cmp xcoordinate,46
            je gameloop3

            cmp xcoordinate,71
            je gameloop3

            continueq108z:

            cmp ycoordinate,22
            jne continueq109z

            cmp xcoordinate,46
            je gameloop3

            cmp xcoordinate,71
            je gameloop3

            continueq109z:

            cmp xcoordinate, 118
            je gameloop3

            call updateplayer
            inc xcoordinate
            call drawplayer

            cmp ycoordinateghost,5
            jne continue2g0z

            cmp xcoordinateghost,115
            je gameloop3

            cmp xcoordinateghost,90
            je gameloop3

            cmp xcoordinateghost,65
            je gameloop3

            cmp xcoordinateghost,40
            je gameloop3

            cmp xcoordinateghost,15
            je gameloop3

            continue2g0z:

            cmp ycoordinateghost,12
            jne continue3g0z

            cmp xcoordinateghost,115
            je gameloop3

            cmp xcoordinateghost,90
            je gameloop3

            cmp xcoordinateghost,65
            je gameloop3

            cmp xcoordinateghost,40
            je gameloop3

            cmp xcoordinateghost,15
            je gameloop3

            cmp xcoordinateghost,48
            je gameloop3

            cmp xcoordinateghost,73
            je gameloop3

            continue3g0z:

            cmp ycoordinateghost,19
            jne continue4g0z

            cmp xcoordinateghost,115
            je gameloop3

            cmp xcoordinateghost,90
            je gameloop3

            cmp xcoordinateghost,65
            je gameloop3

            cmp xcoordinateghost,40
            je gameloop3

            cmp xcoordinateghost,15
            je gameloop3

            cmp xcoordinateghost,48
            je gameloop3

            cmp xcoordinateghost,73
            je gameloop3

            continue4g0z:

            cmp ycoordinateghost,26
            jne continue5g0z

            cmp xcoordinateghost,115
            je gameloop3

            cmp xcoordinateghost,90
            je gameloop3

            cmp xcoordinateghost,65
            je gameloop3

            cmp xcoordinateghost,40
            je gameloop3

            cmp xcoordinateghost,15
            je gameloop3

            continue5g0z:

            cmp ycoordinateghost,8
            jne continue60gz

            cmp xcoordinateghost,103
            je gameloop3

            cmp xcoordinateghost,65
            je gameloop3

            cmp xcoordinateghost,27
            je gameloop3

            cmp xcoordinateghost,48
            je gameloop3

            cmp xcoordinateghost,73
            je gameloop3

            continue60gz:

            cmp ycoordinateghost,15
            jne continue70gz

            cmp xcoordinateghost,103
            je gameloop3

            cmp xcoordinateghost,65
            je gameloop3

            cmp xcoordinateghost,27
            je gameloop3

            cmp xcoordinateghost,48
            je gameloop3

            cmp xcoordinateghost,73
            je gameloop3

            continue70gz:

            cmp ycoordinateghost,23
            jne continue80gz
            
            cmp xcoordinateghost,103
            je gameloop3

            cmp xcoordinateghost,65
            je gameloop3

            cmp xcoordinateghost,27
            je gameloop3

            cmp xcoordinateghost,48
            je gameloop3

            cmp xcoordinateghost,73
            je gameloop3

            continue80gz:

            cmp ycoordinateghost,9
            jne continuez90z

            cmp xcoordinateghost,48
            je gameloop3

            cmp xcoordinateghost,73
            je gameloop3

            continuez90z:

            cmp ycoordinateghost,10
            jne continuez100z

            cmp xcoordinateghost,48
            je gameloop3

            cmp xcoordinateghost,73
            je gameloop3

            continuez100z:

            cmp ycoordinateghost,11
            jne continuez101z

            cmp xcoordinateghost,48
            je gameloop3

            cmp xcoordinateghost,73
            je gameloop3

            continuez101z:

            cmp ycoordinateghost,13
            jne continuez102z

            cmp xcoordinateghost,48
            je gameloop3

            cmp xcoordinateghost,73
            je gameloop3

            continuez102z:

            cmp ycoordinateghost,14
            jne continuez103z

            cmp xcoordinateghost,48
            je gameloop3

            cmp xcoordinateghost,73
            je gameloop3

            continuez103z:

            cmp ycoordinateghost,16
            jne continuez104z

            cmp xcoordinateghost,48
            je gameloop3

            cmp xcoordinateghost,73
            je gameloop3

            continuez104z:

            cmp ycoordinateghost,17
            jne continuez105z

            cmp xcoordinateghost,48
            je gameloop3

            cmp xcoordinateghost,73
            je gameloop3

            continuez105z:

            cmp ycoordinateghost,18
            jne continuez106z

            cmp xcoordinateghost,48
            je gameloop3

            cmp xcoordinateghost,73
            je gameloop3

            continuez106z:

            cmp ycoordinateghost,20
            jne continuez107z

            cmp xcoordinateghost,48
            je gameloop3

            cmp xcoordinateghost,73
            je gameloop3

            continuez107z:

            cmp ycoordinateghost,21
            jne continuez108z

            cmp xcoordinateghost,48
            je gameloop3

            cmp xcoordinateghost,73
            je gameloop3

            continuez108z:

            cmp ycoordinateghost,22
            jne continuez109z

            cmp xcoordinateghost,48
            je gameloop3

            cmp xcoordinateghost,73
            je gameloop3

            continuez109z:

            cmp xcoordinateghost, 1
            je gameloop3
            
            call updateghost
            dec xcoordinateghost
            call drawghost

            jmp gameloop3

        pausescreen3:

            call clrscr

            mov eax, white
            call settextcolor

            mov dh, 3
            mov dl, 45
            call gotoxy

            mov edx, offset pausestring
            call writestring

            mov dl, 47
            mov dh, 10
            call gotoxy

            mov edx, offset pause1
            call writestring

            mov dl, 47
            mov dh, 12
            call gotoxy

            mov edx, offset pause2
            call writestring

            mov dl, 47
            mov dh, 14
            call gotoxy

            mov edx, offset pause3
            call writestring

            mov dl, 47
            mov dh, 17
            call gotoxy

            mov edx, offset choiceask
            call writestring

            mov eax, offset startinput 
            call readint

            cmp al, 1
            je unpause3

            cmp al, 2
            je restart3

            cmp al, 3
            je exitscreen

            unpause3:

                call clrscr
                
                mov esi, offset xcoordinatecoin
                mov edi, offset ycoordinatecoin
                mov ecx, 50
                
                loooop3:
                
                    call drawcoin
                    
                    inc esi
                    inc edi

                loop loooop3

                call drawwalls

                mov eax, gray 
                call settextcolor

                call drawobstacles3
                call drawplayer
                call drawghost
                call drawghost2
                call drawghost3

                jmp gameloop3
    
            restart3:

                mov score, 0
                mov lives, 3
                jmp startgame

    jmp gameloop3

    winscreen:

        call clrscr

        mov eax, yellow (black*16)
        call settextcolor

        mov dl, 34-8
        mov dh, 6-1
        call gotoxy

        mov edx, offset youwin1
        call writestring

        mov dl, 34-8
        mov dh, 7-1
        call gotoxy

        mov eax, 100
        call delay

        mov edx, offset youwin2
        call writestring

        mov dl, 34-8
        mov dh, 8-1
        call gotoxy

        mov eax, 100
        call delay

        mov edx, offset youwin3
        call writestring

        mov dl, 34-8
        mov dh, 9-1
        call gotoxy

        mov eax, 100
        call delay

        mov edx, offset youwin4
        call writestring

        mov dl, 34-8
        mov dh, 10-1
        call gotoxy

        mov eax, 100
        call delay

        mov edx, offset youwin5
        call writestring

        mov dl, 34-8
        mov dh, 11-1
        call gotoxy

        mov eax, 100
        call delay

        mov edx, offset youwin6
        call writestring

        mov dl, 34-8
        mov dh, 12-1
        call gotoxy

        mov eax, 100
        call delay

        mov edx, offset youwin7
        call writestring

        mov eax, white
        call settextcolor

        mov dl, 47
        mov dh, 16
        call gotoxy

        mov eax, 100
        call delay

        mov edx, offset advance
        call writestring

        call readchar

    exitscreen:

        call clrscr

        mov eax, red
        call settextcolor

        mov dl, 31
        mov dh, 3
        call gotoxy

        mov eax, 200
        call delay

        mov edx, offset gameover1
        call writestring

        mov dl, 31
        mov dh, 4
        call gotoxy

        mov eax, 200
        call delay

        mov edx, offset gameover2
        call writestring

        mov dl, 31
        mov dh, 5
        call gotoxy

        mov eax, 200
        call delay

        mov edx, offset gameover3
        call writestring

        mov dl, 31
        mov dh, 6
        call gotoxy

        mov eax, 200
        call delay

        mov edx, offset gameover4
        call writestring

        mov eax, yellow
        call settextcolor

        mov dh, 14
        mov dl, 48
        call gotoxy

        mov edx, offset scorestring
        call writestring

        mov al, score

        cmp level, 3
        je itsl3

        cmp level, 2
        je itsl2

        sub al, 2

        jmp jprint

        itsl2:

        sub al, 5

        jmp jprint

        itsl3:

        sub al, 7
        
        jprint:

        call writeint

        mov dh, 12
        mov dl, 48
        call gotoxy

        mov edx, offset namestring
        call writestring

        mov edx, offset username
        call writestring

        mov dh, 17
        mov dl, 48
        call gotoxy

        mov edx, offset exitstring
        call writestring

        ; write to file

        mov edx,offset filename
        call createoutputfile
        mov filehandle,eax
    
        cmp eax, invalid_handle_value
        jne file_ok
    
        jmp quit
    
        file_ok:
    
            mov lengthofstring, lengthof username
            mov eax,filehandle
            mov edx,offset username
            mov ecx,lengthofstring
    
            call writetofile

            mov eax, filehandle

            mov bx,0
            mov bl, score
            or bx, 3030h
            mov score, bl

            mov edx, offset score
            mov ecx, lengthof score

            call writetofile

            mov lengthofstring, lengthof blank
            mov eax,filehandle
            mov edx,offset blank
            mov ecx,lengthofstring
    
            call writetofile

            mov eax, filehandle

            mov bx, 0
            mov bl, level
            or bx, 3030h
            mov level, bl

            mov edx, offset level
            mov ecx, lengthof lives

            call writetofile
        
        call closefile
        
        call crlf

        quit:

        call readchar

    exitGame:
    
        mov eax, white
        call settextcolor

        call clrscr
        exit

main ENDP

END main
