function phi = basis_brick8 ( n, p )

%*****************************************************************************80
%
%% BASIS_BRICK8: BRICK8 basis functions at natural coordinates.
%
%  Discussion:
%
%      8------7        t  s
%     /|     /|        | /
%    5------6 |        |/
%    | |    | |        0-------r
%    | 4----|-3
%    |/     |/
%    1------2
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 March 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of evaluation points.
%
%    Input, real P(3,N), natural coordinates of evaluation
%    points.
%
%    Output, real PHI(8,N), the basis function values.
%
  phi(1,1:n) =  ( 1.0 - p(1,1:n) ) .* ( 1.0 - p(2,1:n) ) .* ( 1.0 - p(3,1:n) );
  phi(2,1:n) =  ( 1.0 + p(1,1:n) ) .* ( 1.0 - p(2,1:n) ) .* ( 1.0 - p(3,1:n) );
  phi(3,1:n) =  ( 1.0 + p(1,1:n) ) .* ( 1.0 + p(2,1:n) ) .* ( 1.0 - p(3,1:n) );
  phi(4,1:n) =  ( 1.0 - p(1,1:n) ) .* ( 1.0 + p(2,1:n) ) .* ( 1.0 - p(3,1:n) );
  phi(5,1:n) =  ( 1.0 - p(1,1:n) ) .* ( 1.0 - p(2,1:n) ) .* ( 1.0 + p(3,1:n) );
  phi(6,1:n) =  ( 1.0 + p(1,1:n) ) .* ( 1.0 - p(2,1:n) ) .* ( 1.0 + p(3,1:n) );
  phi(7,1:n) =  ( 1.0 + p(1,1:n) ) .* ( 1.0 + p(2,1:n) ) .* ( 1.0 + p(3,1:n) );
  phi(8,1:n) =  ( 1.0 - p(1,1:n) ) .* ( 1.0 + p(2,1:n) ) .* ( 1.0 + p(3,1:n) );

  phi(1:8,1:n) = phi(1:8,1:n) / 8.0;

  return
end
