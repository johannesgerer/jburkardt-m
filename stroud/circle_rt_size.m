function [ nr, nt, nc ] = circle_rt_size ( rule )

%*****************************************************************************80
%
%% CIRCLE_RT_SIZE sizes an R, THETA product quadrature rule in the unit circle.
%
%  Discussion:
%
%    For a given value of RULE, here are the number of points used at the
%    center (NC), the number of points along the radial direction (NR) and
%    the number of points along the theta direction (NT).  The total number
%    of points in the rule will be
%
%      Total = NC + NR * NT.
%
%    The user, when choosing RULE, must allocate enough space in the arrays
%    RA, RW, TA and TW for the resulting values of NR and NT.
%
%    RULE  NC  NR  NT  Total
%    ----  --  --  --  -----
%       1   1   0   0      1
%       2   0   1   4      4
%       3   1   1   4      5
%       4   1   1   6      7
%       5   1   2   4      9
%       6   0   3   4     12
%       7   1   2  10     21
%       8   0   4  16     64
%       9   0   5  20    120
%
%    The integral of F(X,Y) over the unit circle is approximated by
%
%      Integral ( X*X + Y*Y <= 1 ) F(X,Y) dx dy
%      = Integral ( 0 <= R <= 1, 0 <= T <= 2PI ) F(R*cos(T),R*sin(T)) r dr dt
%      = approximately
%        ZW * F(0,0)
%        + sum ( 1 <= I <= NR ) Sum ( 1 <= J <= NT )
%        RW(I) * TW(J) * F ( R(I) * cos ( TA(J) ), R(I) * sin ( TA(J) ) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 April 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz, Irene Stegun,
%    Handbook of Mathematical Functions,
%    National Bureau of Standards, 1964,
%    ISBN: 0-486-61272-4,
%    LC: QA47.A34.
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971,
%    ISBN: 0130438936,
%    LC: QA311.S85.
%
%  Parameters:
%
%    Input, integer RULE, the rule desired.
%
%    Output, integer NR, the number of R abscissas.
%
%    Output, integer NT, the number of Theta abscissas.
%
%    Output, integer NC, the number of center abscissas (0 or 1).
%
  if ( rule == 1 )

    nr = 0;
    nt = 0;
    nc = 1;

  elseif ( rule == 2 )

    nr = 1;
    nt = 4;
    nc = 0;

  elseif ( rule == 3 )

    nr = 1;
    nt = 4;
    nc = 1;

  elseif ( rule == 4 )

    nr = 1;
    nt = 6;
    nc = 1;

  elseif ( rule == 5 )

    nr = 2;
    nt = 4;
    nc = 1;

  elseif ( rule == 6 )

    nr = 3;
    nt = 4;
    nc = 0;

  elseif ( rule == 7 )

    nr = 2;
    nt = 10;
    nc = 1;

  elseif ( rule == 8 )

    nr = 4;
    nt = 16;
    nc = 0;

  elseif ( rule == 9 )

    nr = 5;
    nt = 20;
    nc = 0;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'CIRCLE_RT_SIZE - Fatal error!\n' );
    fprintf ( 1, '  There is no rule of index %d\n', rule );
    error ( 'CIRCLE_RT_SIZE - Fatal error!' );

  end

  return
end
