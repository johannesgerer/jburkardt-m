function order = circle_xy_size ( rule )

%*****************************************************************************80
%
%% CIRCLE_XY_SIZE sizes an XY quadrature rule inside the unit circle in 2D.
%
%  Integration region:
%
%    X*X + Y*Y <= 1.0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 April 2008
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
%    Frank Lether,
%    A Generalized Product Rule for the Circle,
%    SIAM Journal on Numerical Analysis,
%    Volume 8, Number 2, June 1971, pages 249-253.
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
%      1, 1 point 1-st degree;
%      2, 4 point 3-rd degree, Stroud S2:3-1;
%      3, 4 point 3-rd degree, Lether #1;
%      4, 4 point 3-rd degree, Stroud S2:3-2;
%      5, 5 point 3-rd degree;
%      6, 7 point 5-th degree;
%      7, 9 point 5-th degree;
%      8, 9 point 5-th degree, Lether #2;
%      9, 12 point 7-th degree;
%     10, 16 point 7-th degree, Lether #3;
%     11, 21 point 9-th degree, Stroud S2:9-3;
%     12, 25 point 9-th degree, Lether #4 (after correcting error);
%     13, 64 point 15-th degree Gauss product rule.
%
%    Output, integer ORDER, the order of the desired rule.
%
  if ( rule == 1 )

    order = 1;

  elseif ( rule == 2 )

    order = 4;

  elseif ( rule == 3 )

    order = 4;

  elseif ( rule == 4 )

    order = 4;

  elseif ( rule == 5 )

    order = 5;

  elseif ( rule == 6 )

    order = 7;

  elseif ( rule == 7 )

    order = 9;

  elseif ( rule == 8 )

    order = 9;

  elseif ( rule == 9 )

    order = 12;

  elseif ( rule == 10 )

    order = 16;

  elseif ( rule == 11 )

    order = 21;

  elseif ( rule == 12 )

    order = 25;

  elseif ( rule == 13 )

    order = 64;

  else

    order = -1;
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CIRCLE_XY_SIZE - Fatal error!\n' );
    fprintf ( 1, '  There is no rule of index %d\n', rule );
    error ( 'CIRCLE_XY_SIZE - Fatal error!\n' );

  end

  return
end
