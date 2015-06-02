function a = snakes ( )

%*****************************************************************************80
%
%% SNAKES returns the Snakes and Ladders transition matrix.
%
%  Discussion:
%
%    The game of Snakes and Ladders, or Chutes and Ladders, is played on a
%    10x10 board of squares, numbered in boustrophedonic order, with the 
%    lower left corner numbered 1, and the upper left corner 100.  
%
%    Certain pairs of squares are joined by a ladder, and others by a snake.
%
%    A player starts off the board, occupying fictitious square 0.
%    A single die is rolled to determine the player's moves.  Each roll of
%    the die advances the player along the board.  However, if the player
%    lands on a square that is the bottom of a ladder, the player moves
%    immediately to the top of the ladder, which is always a higher-numbered
%    square.  Similarly, landing on the "mouth" of a snake means that the 
%    player immediately drops back to the square that is the tail of the 
%    snake, a lower-numbered square.
%
%    A player's game is over when the square 100 is reached.  While the board
%    game version stipulates that the 100 square must be reached by an exact
%    roll, it is common for players to ignore this stipulation, so that a 
%    player's game is over when the next location is 100, or greater.
%
%    The snakes and ladders matrix contains the transition probabilities,
%    that is, A(I,J) is the probability that a player currently located
%    at square J will end up at square I after a single roll of the dice.
%
%    If we could ignore the snakes and ladders and the final squares, then 
%    the matrix would be all zero, except that entries A(I+1:I+6,J) would 
%    be 1/6.
%
%    This being MATLAB, we cannot have zero indices, so squares 0 through 100
%    are relabeled 1 through 101.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 July 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(101,101), the matrix.
%
  n = 101;

  a = zeros ( n, n );
%
%  Start by ignoring snakes and ladders.
%
  for i = 1 : n
    ihi = min ( i + 6, n );
    a(i+1:ihi,i) = 1;
  end
%
%  Deal with the fact that squares 96 through 101 have extra chances
%  of ending up at 101.  In particular, 101 will amount to a fixed point.
%
  for i = 96 : n
    a(n,i) = a(n,i) + ( i - 95 );
  end
%
%  For each snake, from S to T.
%    All entries in row S are transferred to row T.
%    Logically, column S is now irrelevant, because we can never end up on square S.
%    For linear algebra's sake, set column S to zero, but A(T,S) to 1.
%
  snake_num = 10;

  snake = [ ...
    98, 78;
    95, 75;
    93, 73;
    87, 24;
    64, 60;
    62, 19;
    56, 53;
    49, 11;
    48, 26;
    16,  6 ]';

  snake = snake + 1;

  for k = 1 : snake_num
    s = snake(1,k);
    t = snake(2,k);
    a(t,1:n) = a(t,1:n) + a(s,1:n);
    a(s,1:n) = 0;
    a(1:n,s) = 0;
    a(t,s) = 6;
  end
%
%  For each ladder, from L to M:
%    All entries in row L are transferred to row M.
%    Logically, column L is now irrelevant, because we can never end up on square L.
%    For linear algebra's sake, set column L to zero, but A(M,L) to 1.
%
  ladder_num = 9;

  ladder = [ ...
     1, 38;
     4, 14;
     9, 31;
    21, 42;
    28, 84;
    36, 44;
    51, 67;
    71, 91;
    80, 100 ]';

  ladder = ladder + 1;

  for k = 1 : ladder_num
    l = ladder(1,k);
    m = ladder(2,k);
    a(m,1:n) = a(m,1:n) + a(l,1:n);
    a(l,1:n) = 0;
    a(1:n,l) = 0;
    a(m,l) = 6;
  end
%
%  Normalize.
%
  a(1:n,1:n) = a(1:n,1:n) / 6.0;

  return
end
