function value = daub8_condition ( n )

%*****************************************************************************80
%
%% DAUB8_DETERMINANT returns the L1 condition of the DAUB8 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 January 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real VALUE, the L1 condition.
%
  c = [ ...
    0.2303778133088964, ...
    0.7148465705529154, ...
    0.6308807679298587, ...
   -0.0279837694168599, ...
   -0.1870348117190931, ...
    0.0308413818355607, ...
    0.0328830116668852, ...
   -0.0105974017850690 ];

  a_norm = sum ( abs ( c(1:8) ) );
  b_norm = a_norm;
  value = a_norm * b_norm;

  return
end
