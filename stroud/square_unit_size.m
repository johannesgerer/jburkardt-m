function order = square_unit_size ( rule )

%*****************************************************************************80
%
%% SQUARE_UNIT_SIZE sizes a quadrature rule in the unit square.
%
%  Integration region:
%
%      -1 <= X <= 1,
%    and
%      -1 <= Y <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 Ap;ril 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gilbert Strang, George Fix,
%    An Analysis of the Finite Element Method,
%    Cambridge, 1973,
%    ISBN: 096140888X,
%    LC: TA335.S77.
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971,
%    ISBN: 0130438936,
%    LC: QA311.S85.
%
%  Parameters:
%
%    Input, integer RULE, the rule number.
%    1, a 1 point 1st degree rule.
%    2, a 4 point 3rd degree rule.
%    3, a 9 point 5th degree rule.
%    4, a 12 point 7-th degree rule, Stroud number C2:7-1.
%    5, a 13 point 7-th degree rule, Stroud number C2:7-3.
%    6, a 64 point 15-th degree product rule.
%
%    Output, integer ORDER, the order of the rule.
%
  if ( rule == 1 )

    order = 1;

  elseif ( rule == 2 )

    order = 4;

  elseif ( rule == 3 )

    order = 9;

  elseif ( rule == 4 )

    order = 12;

  elseif ( rule == 5 )

    order = 13;

  elseif ( rule == 6 )

    order = 64;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'SQUARE_UNIT_SIZE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of RULE = %d\n', rule );
    error ( 'SQUARE_UNIT_SIZE - Fatal error!' );

  end

  return
end
