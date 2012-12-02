function f = p36_f ( n, x )

%*****************************************************************************80
%
%% P36_F evaluates the objective function for problem 36.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Zbigniew Michalewicz,
%    Genetic Algorithms + Data Structures = Evolution Programs,
%    Third Edition,
%    Springer Verlag, 1996,
%    ISBN: 3-540-60676-9,
%    LC: QA76.618.M53.
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the argument of the objective function.
%
%    Output, real F, the value of the objective function.
%
  [ b, m1, m2, r11, r12, r21, r22, seed ] = p36_p_get ( );

  a1 = r8_aint ( abs ( x(1) - r11 ) ) + r8_aint ( abs ( x(2) - r21 ) );

  a2 = r8_aint ( abs ( x(1) - r12 ) ) + r8_aint ( abs ( x(2) - r22 ) );

  if ( x(1) <= b )
    if ( a1 == 0.0 )
      f = r8_aint ( m1 );
    else
      f = r8_aint ( m1 * sin ( a1 ) / a1 );
    end
  else
    if ( a2 == 0.0 )
      f = r8_aint ( m2 );
    else
      f = r8_aint ( m2 * sin ( a2 ) / a2 );
    end
  end

  return
end
