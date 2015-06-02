function value = jordan_condition ( n, alpha )

%*****************************************************************************80
%
%% JORDAN_CONDITION returns the L1 condition of the JORDAN matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real ALPHA, the eigenvalue of the Jordan matrix.
%
%    Output, real VALUE, the L1 condition.
%
  a2 = abs ( alpha );

  if ( n == 1 )
    a_norm = a2;
  else
    a_norm = a2 + 1.0;
  end

  if ( a2 == 1 )
    b_norm = n * a2
  else
    b_norm = ( a2 ^ n - 1.0 ) / ( a2 - 1.0 ) / a2 ^ n;
  end

  value = a_norm * b_norm;

  return
end
