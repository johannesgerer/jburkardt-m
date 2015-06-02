function a = moler4 ( )

%*****************************************************************************80
%
%% MOLER4 returns the MOLER4 matrix.
%
%  Example:
%
%    0  2  0 -1
%    1  0  0  0
%    0  1  0  0
%    0  0  1  0
%
%  Properties:
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%    A is the companion matrix of the polynomial X^4-2X^2+1=0.
%
%    A has eigenvalues -1, -1, +1, +1.
%
%    A can cause problems to a standard QR algorithm, which
%    can fail to converge.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 February 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real A(4,4), the matrix.
%

%
%  Note that matrix entries are listed by row.
%
  a = [ ...
    0.0,  2.0,  0.0, -1.0; ...
    1.0,  0.0,  0.0,  0.0; ...
    0.0,  1.0,  0.0,  0.0; ...
    0.0,  0.0,  1.0,  0.0 ];

  return
end%