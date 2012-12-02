function hits = buffon_laplace_simulate ( a, b, l, trial_num )

%*****************************************************************************80
%
%% BUFFON_LAPLACE_SIMULATE simulates a Buffon-Laplace needle experiment.
%
%  Discussion:
%
%    In the Buffon-Laplace needle experiment, we suppose that the plane has been
%    tiled into a grid of rectangles of width A and height B, and that a
%    needle of length L is dropped "at random" onto this grid.  
% 
%    We may assume that one end, the "eye" of the needle falls at the point
%    (X1,Y1), taken uniformly at random in the cell [0,A]x[0,B].
%
%    ANGLE, the angle that the needle makes is taken to be uniformly random.
%    The point of the needle, (X2,Y2), therefore lies at
%
%      (X2,Y2) = ( X1+L*cos(ANGLE), Y1+L*sin(ANGLE) )
%
%    The needle will have crossed at least one grid line if any of the 
%    following are true:
%
%      X2 <= 0, A <= X2, Y2 <= 0, B <= Y2.
%
%    This routine simulates the tossing of the needle, and returns the number
%    of times that the needle crossed at least one grid line.
%
%    If L is larger than sqrt ( A*A + B*B ), then the needle will
%    cross every time, and the computation is uninteresting.  However, if
%    L is smaller than this limit, then the probability of a crossing on
%    a single trial is
%
%      P(L,A,B) = ( 2 * L * ( A + B ) - L * L ) / ( PI * A * B )
%
%    and therefore, a record of the number of hits for a given number of
%    trials can be used as a very roundabout way of estimating PI.  
%    (Particularly roundabout, since we actually will use a good value of
%    PI in order to pick the random angles%)
%
%    Note that this routine will try to generate 5 * TRIAL_NUM random
%    double precision values at one time, using automatic arrays.  
%    When I tried this with TRIAL_NUM = 1,000,000, the program failed,
%    because of internal system limits on such arrays.
%
%    Such a problem could be avoided by using a DO loop running through
%    each trial individually, but this tend to run much more slowly than
%    necessary.
% 
%    Since this routine invokes the MATLAB random number generator,
%    the user should initialize the random number generator, particularly
%    if it is desired to control whether the sequence is to be varied
%    or repeated.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 February 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Sudarshan Raghunathan,
%    Making a Supercomputer Do What You Want: High Level Tools for 
%    Parallel Programming,
%    Computing in Science and Engineering,
%    Volume 8, Number 5, September/October 2006, pages 70-80.
%
%  Parameters:
%
%    Input, real A, B, the horizontal and vertical dimensions
%    of each cell of the grid.  0 <= A, 0 <= B.
%
%    Input, real L, the length of the needle.
%    0 <= L <= min ( A, B ).
%
%    Input, integer TRIAL_NUM, the number of times the needle is
%    to be dropped onto the grid.
%
%    Output, integer BUFFON_LAPLACE_SIMULATE, the number of times the needle crossed
%    at least one line of the grid of cells.
%
%  Local Parameters:
%
%    Local, integer BATCH_SIZE, specifies the number of trials to be done
%    in a single batch.  Setting BATCH_SIZE to 1 will be very slow.
%    Replacing it by TRIAL_NUM would be fine except that your system
%    may have a limit on the size of automatic arrays.  We have set a default 
%    value of 10,000 here which should be large enough to be efficient
%    but small enough not to annoy the system.
%
  batch_size = 10000;

  hits = 0;

  for batch = 1 : batch_size : trial_num

    n = min ( batch_size, trial_num + 1 - batch );
%
%  Randomly choose the location of the eye of the needle in [0,0]x[A,B],
%  and the angle the needle makes.
%
    x1(1:n) = rand ( 1, n );
    y1(1:n) = rand ( 1, n );
    angle(1:n) = rand ( 1, n );

    x1(1:n) = a * x1(1:n);
    y1(1:n) = b * y1(1:n);
    angle(1:n) = 2.0 * pi * angle(1:n);
%
%  Compute the location of the point of the needle.
%
    x2(1:n) = x1(1:n) + l * cos ( angle(1:n) );
    y2(1:n) = y1(1:n) + l * sin ( angle(1:n) );
%
%  Count the end locations that lie outside the cell.
%
    hits = hits ...
      + length ( ...
        find ( ...
             x2(1:n) <= 0.0 | ...
        a <= x2(1:n)        | ...
             y2(1:n) <= 0.0 | ...
        b <= y2(1:n) ) );

  end

  return
end
