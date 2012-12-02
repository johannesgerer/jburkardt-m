function order = tetra_unit_size ( rule )

%*****************************************************************************80
%
%% TETRA_UNIT_SIZE sizes quadrature weights and abscissas in the unit tetrahedron.
%
%  Integration region:
%
%      0 <= X,
%    and
%      0 <= Y,
%    and
%      0 <= Z, 
%    and
%      X + Y + Z <= 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 April 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Hermann Engels,
%    Numerical Quadrature and Cubature,
%    Academic Press, 1980,
%    ISBN: 012238850X,
%    LC: QA299.3E5.
%
%    Patrick Keast,
%    Moderate Degree Tetrahedral Quadrature Formulas,
%    Computer Methods in Applied Mechanics and Engineering,
%    Volume 55, Number 3, May 1986, pages 339-348.
%
%    Olgierd Zienkiewicz,
%    The Finite Element Method,
%    Sixth Edition,
%    Butterworth-Heinemann, 2005,
%    ISBN: 0750663200,
%    LC: TA640.2.Z54
%
%  Parameters:
%
%    Input, integer RULE, the index of the rule.
%     1, order 1, precision 0, Newton Cotes formula #0, Zienkiewicz #1.
%     2, order 4, precision 1, Newton Cotes formula #1.
%     3, order 4, precision 2, Zienkiewicz #2.
%     4, order 10, precision 2, Newton Cotes formula #2
%     5, order 5, precision 3, Zienkiewicz #3.
%     6, order 8, precision 3, Newton Cotes formula #3.
%     7, order 35, precision 4, Newton Cotes formula #4.
%     8, order 11, precision 4, a Keast rule.
%
%    Output, integer  ORDER, the order of the rule.
%

%
%  Newton Cotes #0.
%
  if ( rule == 1 )

    order = 1;
%
%  Newton Cotes #1.
%
  elseif ( rule == 2 )

    order = 4;
%
%  Zienkiewicz #2.
%
  elseif ( rule == 3 )

    order = 4;
%
%  Newton Cotes #2.
%
  elseif ( rule == 4 )

    order = 10;
%
%  Zienkiewicz #3.
%
  elseif ( rule == 5 )

    order = 5;
%
%  Newton Cotes #3.
%  (This is actually formally a 20 point rule, but with 12 zero coefficients%)
%
  elseif ( rule == 6 )

    order = 8;
%
%  Newton Cotes #4.
%
  elseif ( rule == 7 )

    order = 35;
%
%  Keast Rule of order 11
%
  elseif ( rule == 8 )

    order = 11;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'TETRA_UNIT_SIZE - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of RULE = %d\n', rule );
    error ( 'TETRA_UNIT_SIZE - Fatal error!' );

  end

  return
end
