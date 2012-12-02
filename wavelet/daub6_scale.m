function y = daub6_scale ( n, x )

%*****************************************************************************80
%
%% DAUB6_SCALE recursively evaluates the DAUB6 scaling function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    31 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the recursion level.
%
%    Input, real X, the point at which the function is to be evaluated.
%
%    Output, real Y, the estimated value of the function.
%
  c = [  0.3326705529500826E+00; ...
         0.8068915093110925E+00; ...
         0.4598775021184915E+00; ...
       - 0.1350110200102545E+00; ...
       - 0.08544127388202666E+00; ...
         0.03522629188570953E+00 ];

  c = c * sqrt ( 2.0 );

  if ( 0 < n )
    y = c(1) * daub6_scale ( n - 1, 2 * x     ) ...
      + c(2) * daub6_scale ( n - 1, 2 * x - 1 ) ...
      + c(3) * daub6_scale ( n - 1, 2 * x - 2 ) ...
      + c(4) * daub6_scale ( n - 1, 2 * x - 3 ) ...
      + c(5) * daub6_scale ( n - 1, 2 * x - 4 ) ...
      + c(6) * daub6_scale ( n - 1, 2 * x - 5 );
  else
    y = ( 0 <= x & x < 1 );
  end

  return
end
