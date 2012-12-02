function y = daub4_scale ( n, x )

%*****************************************************************************80
%
%% DAUB4_SCALE recursively evaluates the DAUB4 scaling function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2011
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
  c = [  0.4829629131445341E+00; ...
         0.8365163037378079E+00; ...
         0.2241438680420133E+00; ...
        -0.1294095225512603E+00 ];

  c = sqrt ( 2.0 ) * c;

  if ( 0 < n )
    y = ( c(1) * daub4_scale ( n - 1, 2 * x     ) ...
        + c(2) * daub4_scale ( n - 1, 2 * x - 1 ) ...
        + c(3) * daub4_scale ( n - 1, 2 * x - 2 ) ...
        + c(4) * daub4_scale ( n - 1, 2 * x - 3 ) );
  else
    y = ( 0 <= x & x < 1 );
  end

  return
end
