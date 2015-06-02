function a = rutis5 ( )

%*****************************************************************************80
%
%% RUTIS5 returns the RUTIS5 matrix.
%
%  Example:
%
%    10  1  4  0
%    1  10  5 -1
%    4   5 10  7
%    0  -1  7  9
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    John Todd,
%    Basic Numerical Mathematics, Volume 2: Numerical Algebra,
%    Academic Press, 1977.
%
%  Parameters:
%
%    Output, real A(4,4), the matrix.
%

%
%  Note that the matrix entries are listed by row.
%
  a(1:4,1:4) = [ ...
   10.0,  1.0,  4.0,  0.0; ...
    1.0, 10.0,  5.0, -1.0; ...
    4.0,  5.0, 10.0,  7.0; ...
    0.0, -1.0,  7.0,  9.0 ];

  return
end
