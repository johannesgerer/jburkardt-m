function snakes_and_ladders ( )

%*****************************************************************************80
%
%% SNAKES_AND_LADDERS simulates a two-player game of Snakes and Ladders.
%
%  Discussion:
%
%    This file performs the famous game of Snakes & Ladders
%    The rules of the Game are:
%    Two players may participate
%    The board is shown in the figure window
%    Every player throws the die in his turn by pressing (Enter)
%    You move on the board as Your die number says
%    If You meet a Ladder, just Climb it
%    If You meet a Snake, just Go down with it
%    The player who reachs The place No: 100 first
%    IS THE WINNER
%
%  Modified:
%
%    19 September 2014
%
%  Author:
%
%    Mina Ayman
%    Modified by John Burkardt
%
  rand('state',sum(100*clock))
%
%  Getting a file containing an image of the board.

%
  board = imread ( 'board.jpg' );

%

%  Say hello.

%

 fprintf ( 1, '\n' );

 fprintf ( 1, 'SNAKES_AND_LADDERS\n' );

 fprintf ( 1, '  A two-player simulation of the board game.\n' )
%
%  Name the players and assign colors to their tiles.

%
  player1 = 'Red';
  choice1 = 1;
  tile1(:,:,1) = 255*ones(60,60);
  tile1(:,:,2) = zeros(60,60);
  tile1(:,:,3) = zeros(60,60);


 player2 = 'Blue';

 choice2 = 3;
  tile2(:,:,1) = zeros(60,60);
  tile2(:,:,2) = zeros(60,60);
  tile2(:,:,3) = 255*ones(60,60);
%    
%  Display the board.

%
  u = figure;
  imshow ( board, 'InitialMagnification', 'fit' )
% pause(4)

  fprintf ( 1, 'Each player must hit return to roll the die and move.\n') 

  pos1 = 0;
  pos2 = 0;
%
% Basic Game
%
  board4 = board;

  while ((pos1 ~= 100) & (pos2 ~= 100))

%
%  Player 1 Turn

%
    check1 = 0;
%   fprintf('\n Your Turn! %s :',player1)
    pause
    die1 = ceil(1000*rand(1,1));
    die1 = mod(die1,6);
    die1 = die1 + 1;
    fprintf('Player 1 rolled %d\n', die1)
    pos1 = pos1 + die1;
        
    if (pos1 >= 100)
        pos1 = 100;
        check1 = 2;
    end
        
    for m = 1 : die1
        t1 = pos1 - die1 + m;
        c1 = mod(t1,10);
        if (c1 == 0)
            c1 = 10;
        end
        r1 = ceil(t1/10);
        
        board1 = board4;
        board3 = board;
        
        switch r1
        case 1
            board1(541:600,60*(c1-1)+1:60*(c1-1)+60,:) = tile1;             
            board3(541:600,60*(c1-1)+1:60*(c1-1)+60,:) = tile1;
    
        case 2
            board1(481:540,60*((11-c1)-1)+1:60*((11-c1)-1)+60,:) = tile1;  
            board3(481:540,60*((11-c1)-1)+1:60*((11-c1)-1)+60,:) = tile1;   
    
        case 3
            board1(421:480,60*(c1-1)+1:60*(c1-1)+60,:) = tile1;
            board3(421:480,60*(c1-1)+1:60*(c1-1)+60,:) = tile1;
    
        case 4
            board1(361:420,60*((11-c1)-1)+1:60*((11-c1)-1)+60,:) = tile1; 
            board3(361:420,60*((11-c1)-1)+1:60*((11-c1)-1)+60,:) = tile1; 
    
        case 5
            board1(301:360,60*(c1-1)+1:60*(c1-1)+60,:) = tile1;   
            board3(301:360,60*(c1-1)+1:60*(c1-1)+60,:) = tile1;   
    
        case 6
            board1(241:300,60*((11-c1)-1)+1:60*((11-c1)-1)+60,:) = tile1;  
            board3(241:300,60*((11-c1)-1)+1:60*((11-c1)-1)+60,:) = tile1;  
    
        case 7
            board1(181:240,60*(c1-1)+1:60*(c1-1)+60,:) = tile1;
            board3(181:240,60*(c1-1)+1:60*(c1-1)+60,:) = tile1;
    
        case 8 
            board1(121:180,60*((11-c1)-1)+1:60*((11-c1)-1)+60,:) = tile1;    
            board3(121:180,60*((11-c1)-1)+1:60*((11-c1)-1)+60,:) = tile1;    
    
        case 9
            board1(61:120,60*(c1-1)+1:60*(c1-1)+60,:) = tile1;   
            board3(61:120,60*(c1-1)+1:60*(c1-1)+60,:) = tile1;   
    
        case 10
            board1(1:60,60*((11-c1)-1)+1:60*((11-c1)-1)+60,:) = tile1;    
            board3(1:60,60*((11-c1)-1)+1:60*((11-c1)-1)+60,:) = tile1;    
    
        end

        imshow(board1,'InitialMagnification', 'fit')
        pause(1)
    end    
        
    if(pos1 == 8)
        pos1 = 4;
        check1 = 1;
    end
    
    if(pos1 == 18)
        pos1 = 1;
        check1 = 1;
    end
    
    if(pos1 == 26)
        pos1 = 10;
        check1 = 1;
    end
    
    if(pos1 == 39)
        pos1 = 5;
        check1 = 1;
    end
    
    if(pos1 == 51)
        pos1 = 6;
        check1 = 1;
    end
    
    if(pos1 == 54)
        pos1 = 36;
        check1 = 1;
    end
    
    if(pos1 == 56)
        pos1 = 1;
        check1 = 1;
    end
    
    if(pos1 == 60)
        pos1 = 23;
        check1 = 1;
    end
    
    if(pos1 == 75)
        pos1 = 28;
        check1 = 1;
    end
    
    if(pos1 == 83)
        pos1 = 45;
        check1 = 1;
    end
    
    if(pos1 == 85)
        pos1 = 59;
        check1 = 1;
    end
    
    if(pos1 == 90)
        pos1 = 48;
        check1 = 1;
    end
    
    if(pos1 == 92)
        pos1 = 25;
        check1 = 1;
    end
    
    if(pos1 == 97)
        pos1 = 87;
        check1 = 1;
    end
    
    if(pos1 == 99)
        pos1 = 63;
        check1 = 1;
    end
    
    if(pos1 == 3)
        pos1 = 20;
        check1 = 1;
    end
    
    
    if(pos1 == 6)
        pos1 = 14;
        check1 = 1;
    end
    
    if(pos1 == 11)
        pos1 = 28;
        check1 = 1;
    end
    
    if(pos1 == 15)
        pos1 = 34;
        check1 = 1;
    end
    
    if(pos1 == 17)
        pos1 = 74;
        check1 = 1;
    end
    
    if(pos1 == 22)
        pos1 = 37;
        check1 = 1;
    end
    
    if(pos1 == 38)
        pos1 = 59;
        check1 = 1;
    end
    
    if(pos1 == 49)
        pos1 = 67;
        check1 = 1;
    end
    
    if(pos1 == 57)
        pos1 = 76;
        check1 = 1;;
    end
    
    if(pos1 == 61)
        pos1 = 78;
        check1 = 1;
    end
    
    if(pos1 == 73)
        pos1 = 86;
        check1 = 1;
    end
    
    if(pos1 == 81)
        pos1 = 98;
        check1 = 1;
    end
    
    if(pos1 == 88)
        pos1 = 91;
        check1 = 1;
    end
    
    if (check1 == 2)
        % Player 1 is the Winner
        pause(5)
        fprintf('\n Congratulations! %s Wins', player1)
        break;
    end
    
    if (check1 == 1)
        t1 = pos1;
        c1 = mod(t1,10);
        if (c1 == 0)
            c1 = 10;
        end
        r1 = ceil(t1/10);
        
        board1 = board4;
        board3 = board;
        
        switch r1
        case 1
            board1(541:600,60*(c1-1)+1:60*(c1-1)+60,:) = tile1;             
            board3(541:600,60*(c1-1)+1:60*(c1-1)+60,:) = tile1;
    
        case 2
            board1(481:540,60*((11-c1)-1)+1:60*((11-c1)-1)+60,:) = tile1;  
            board3(481:540,60*((11-c1)-1)+1:60*((11-c1)-1)+60,:) = tile1;   
    
        case 3
            board1(421:480,60*(c1-1)+1:60*(c1-1)+60,:) = tile1;
            board3(421:480,60*(c1-1)+1:60*(c1-1)+60,:) = tile1;
    
        case 4
            board1(361:420,60*((11-c1)-1)+1:60*((11-c1)-1)+60,:) = tile1; 
            board3(361:420,60*((11-c1)-1)+1:60*((11-c1)-1)+60,:) = tile1; 
    
        case 5
            board1(301:360,60*(c1-1)+1:60*(c1-1)+60,:) = tile1;   
            board3(301:360,60*(c1-1)+1:60*(c1-1)+60,:) = tile1;   
    
        case 6
            board1(241:300,60*((11-c1)-1)+1:60*((11-c1)-1)+60,:) = tile1;  
            board3(241:300,60*((11-c1)-1)+1:60*((11-c1)-1)+60,:) = tile1;  
    
        case 7
            board1(181:240,60*(c1-1)+1:60*(c1-1)+60,:) = tile1;
            board3(181:240,60*(c1-1)+1:60*(c1-1)+60,:) = tile1;
    
        case 8 
            board1(121:180,60*((11-c1)-1)+1:60*((11-c1)-1)+60,:) = tile1;    
            board3(121:180,60*((11-c1)-1)+1:60*((11-c1)-1)+60,:) = tile1;    
    
        case 9
            board1(61:120,60*(c1-1)+1:60*(c1-1)+60,:) = tile1;   
            board3(61:120,60*(c1-1)+1:60*(c1-1)+60,:) = tile1;   
    
        case 10
            board1(1:60,60*((11-c1)-1)+1:60*((11-c1)-1)+60,:) = tile1;    
            board3(1:60,60*((11-c1)-1)+1:60*((11-c1)-1)+60,:) = tile1;    
    
        end

        imshow(board1,'InitialMagnification', 'fit')         
%       pause(1)
    end
%
%  Player 2 Turn

%
    check2 = 0;
    die2 = ceil(1000*rand(1,1));
    die2 = mod(die2,6);
    die2 = die2 + 1;

   pause
    fprintf('Player 2 rolled %d\n', die2 )
    pos2 = pos2 + die2;
    
    if (pos2 >= 100)
        pos2 = 100;
        check2 = 2;
    end
        
    for m = 1 : die2
        t2 = pos2 - die2 + m;
        c2 = mod(t2,10);
        if (c2 == 0)
            c2 = 10;
        end
        r2 = ceil(t2/10);
        
        board2 = board3;
        board4 = board;
        
        switch r2
        case 1
            board2(541:600,60*(c2-1)+1:60*(c2-1)+60,:) = tile2;             
            board4(541:600,60*(c2-1)+1:60*(c2-1)+60,:) = tile2;
    
        case 2
            board2(481:540,60*((11-c2)-1)+1:60*((11-c2)-1)+60,:) = tile2;  
            board4(481:540,60*((11-c2)-1)+1:60*((11-c2)-1)+60,:) = tile2;   
    
        case 3
            board2(421:480,60*(c2-1)+1:60*(c2-1)+60,:) = tile2;
            board4(421:480,60*(c2-1)+1:60*(c2-1)+60,:) = tile2;
    
        case 4
            board2(361:420,60*((11-c2)-1)+1:60*((11-c2)-1)+60,:) = tile2; 
            board4(361:420,60*((11-c2)-1)+1:60*((11-c2)-1)+60,:) = tile2; 
    
        case 5
            board2(301:360,60*(c2-1)+1:60*(c2-1)+60,:) = tile2;   
            board4(301:360,60*(c2-1)+1:60*(c2-1)+60,:) = tile2;   
    
        case 6
            board2(241:300,60*((11-c2)-1)+1:60*((11-c2)-1)+60,:) = tile2;  
            board4(241:300,60*((11-c2)-1)+1:60*((11-c2)-1)+60,:) = tile2;  
    
        case 7
            board2(181:240,60*(c2-1)+1:60*(c2-1)+60,:) = tile2;
            board4(181:240,60*(c2-1)+1:60*(c2-1)+60,:) = tile2;
    
        case 8 
            board2(121:180,60*((11-c2)-1)+1:60*((11-c2)-1)+60,:) = tile2;    
            board4(121:180,60*((11-c2)-1)+1:60*((11-c2)-1)+60,:) = tile2;    
    
        case 9
            board2(61:120,60*(c2-1)+1:60*(c2-1)+60,:) = tile2;   
            board4(61:120,60*(c2-1)+1:60*(c2-1)+60,:) = tile2;   
    
        case 10
            board2(1:60,60*((11-c2)-1)+1:60*((11-c2)-1)+60,:) = tile2;    
            board4(1:60,60*((11-c2)-1)+1:60*((11-c2)-1)+60,:) = tile2;    
    
        end

        imshow(board2,'InitialMagnification', 'fit')
        pause(1)

    end
        
    if(pos2 == 8)
        pos2 = 4;
        check2 = 1;
    end
    
    if(pos2 == 18)
        pos2 = 1;
        check2 = 1;
    end
    
    if(pos2 == 26)
        pos2 = 10;
        check2 = 1;
    end
    
    if(pos2 == 39)
        pos2 = 5;
        check2 = 1;
    end
    
    if(pos2 == 51)
        pos2 = 6;
        check2 = 1;
    end
    
    if(pos2 == 54)
        pos2 = 36;
        check2 = 1;
    end
    
    if(pos2 == 56)
        pos2 = 1;
        check2 = 1;
    end
    
    if(pos2 == 60)
        pos2 = 23;
        check2 = 1;
    end
    
    if(pos2 == 75)
        pos2 = 28;
        check2 = 1;
    end
    
    if(pos2 == 83)
        pos2 = 45;
        check2 = 1;
    end
    
    if(pos2 == 85)
        pos2 = 59;
        check2 = 1;
    end
    
    if(pos2 == 90)
        pos2 = 48;
        check2 = 1;
    end
    
    if(pos2 == 92)
        pos2 = 25;
        check2 = 1;
    end
    
    if(pos2 == 97)
        pos2 = 87;
        check2 = 1;
    end
    
    if(pos2 == 99)
        pos2 = 63;
        check2 = 1;
    end
    
    if(pos2 == 3)
        pos2 = 20;
        check2 = 1;
    end
    
    
    if(pos2 == 6)
        pos2 = 14;
        check2 = 1;
    end
    
    if(pos2 == 11)
        pos2 = 28;
        check2 = 1;
    end
    
    if(pos2 == 15)
        pos2 = 34;
        check2 = 1;
    end
    
    if(pos2 == 17)
        pos2 = 74;
        check2 = 1;
    end
    
    if(pos2 == 22)
        pos2 = 37;
        check2 = 1;
    end
    
    if(pos2 == 38)
        pos2 = 59;
        check2 = 1;
    end
    
    if(pos2 == 49)
        pos2 = 67;
        check2 = 1;
    end
    
    if(pos2 == 57)
        pos2 = 76;
        check2 = 1;
    end
    
    if(pos2 == 61)
        pos2 = 78;
        check2 = 1;
    end
    
    if(pos2 == 73)
        pos2 = 86;
        check2 = 1;
    end
    
    if(pos2 == 81)
        pos2 = 98;
        check2 = 1;
    end
    
    if(pos2 == 88)
        pos2 = 91;
        check2 = 1;
    end
    
    if (check2 == 2)
        % Player 2 is the Winner
        pause(5)
        fprintf('\n Congratulations! %s Wins', player2)
        break;
    end
    
    if (check2 == 1)
        t2 = pos2;
        c2 = mod(t2,10);
        if (c2 == 0)
            c2 = 10;
        end
        r2 = ceil(t2/10);
        
        board2 = board3;
        board4 = board;
        
        switch r2
        case 1
            board2(541:600,60*(c2-1)+1:60*(c2-1)+60,:) = tile2;             
            board4(541:600,60*(c2-1)+1:60*(c2-1)+60,:) = tile2;
    
        case 2
            board2(481:540,60*((11-c2)-1)+1:60*((11-c2)-1)+60,:) = tile2;  
            board4(481:540,60*((11-c2)-1)+1:60*((11-c2)-1)+60,:) = tile2;   
    
        case 3
            board2(421:480,60*(c2-1)+1:60*(c2-1)+60,:) = tile2;
            board4(421:480,60*(c2-1)+1:60*(c2-1)+60,:) = tile2;
    
        case 4
            board2(361:420,60*((11-c2)-1)+1:60*((11-c2)-1)+60,:) = tile2; 
            board4(361:420,60*((11-c2)-1)+1:60*((11-c2)-1)+60,:) = tile2; 
    
        case 5
            board2(301:360,60*(c2-1)+1:60*(c2-1)+60,:) = tile2;   
            board4(301:360,60*(c2-1)+1:60*(c2-1)+60,:) = tile2;   
    
        case 6
            board2(241:300,60*((11-c2)-1)+1:60*((11-c2)-1)+60,:) = tile2;  
            board4(241:300,60*((11-c2)-1)+1:60*((11-c2)-1)+60,:) = tile2;  
    
        case 7
            board2(181:240,60*(c2-1)+1:60*(c2-1)+60,:) = tile2;
            board4(181:240,60*(c2-1)+1:60*(c2-1)+60,:) = tile2;
    
        case 8 
            board2(121:180,60*((11-c2)-1)+1:60*((11-c2)-1)+60,:) = tile2;    
            board4(121:180,60*((11-c2)-1)+1:60*((11-c2)-1)+60,:) = tile2;    
    
        case 9
            board2(61:120,60*(c2-1)+1:60*(c2-1)+60,:) = tile2;   
            board4(61:120,60*(c2-1)+1:60*(c2-1)+60,:) = tile2;   
    
        case 10
            board2(1:60,60*((11-c2)-1)+1:60*((11-c2)-1)+60,:) = tile2;    
            board4(1:60,60*((11-c2)-1)+1:60*((11-c2)-1)+60,:) = tile2;    
    
        end

        imshow(board2,'InitialMagnification', 'fit')        
    end
    
  end
%

%  Terminate.

%

 return
end
