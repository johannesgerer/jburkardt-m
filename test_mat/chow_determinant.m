function determ = chow_determinant ( alpha, beta, n )

%*****************************************************************************80
%
%% CHOW_DETERMINANT returns the determinant of the CHOW matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the ALPHA value.  A typical value is 1.0.
%
%    Input, real BETA, the BETA value.  A typical value is 0.0.
%
%    Input, integer N, the order of A.
%
%    Output, real DETERM, the determinant.
%
  determ = 1.0;

  k = n - floor ( n / 2 );

  for i = 1 : k
    angle = i * pi / ( n + 2 );
    determ = determ * ( beta + 4.0 * alpha * ( cos ( angle ) )^2 );
  end

  determ  = determ * beta^( n - k );

  return
end
