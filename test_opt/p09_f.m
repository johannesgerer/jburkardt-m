function f = p09_f ( n, x )

%*****************************************************************************80
%
%% P09_F evaluates the objective function for problem 9.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of variables.
%
%    Input, real X(N), the argument of the objective function.
%
%    Output, real F, the value of the objective function.
%
  ap = 0.00001;

  t1 = -1.0;
  t2 = 0.0;
  t3 = 0.0;
  d2 = 1.0;
  s2 = 0.0;

  for j = 1 : n
    t1 = t1 + ( n - j + 1 ) * x(j)^2;
    s1 = exp ( x(j) / 10.0 );
    if ( 1 < j )
      s3 = s1 + s2 - d2 * ( exp ( 0.1 ) + 1.0 );
      t2 = t2 + s3 * s3;
      t3 = t3 + ( s1 - 1.0 / exp ( 0.1 ) )^2;
    end
    s2 = s1;
    d2 = d2 * exp ( 0.1 );
  end

  f = ap * ( t2 + t3 ) + t1 * t1 + ( x(1) - 0.2 )^2;

  return
end
