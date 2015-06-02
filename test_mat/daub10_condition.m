function value = daub10_condition ( n )

%*****************************************************************************80
%
%% DAUB10_DETERMINANT returns the L1 condition of the DAUB10 matrix.
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
    0.1601023979741929, ...
    0.6038292697971895, ...
    0.7243085284377726, ...
    0.1384281459013203, ...
   -0.2422948870663823, ...
   -0.0322448695846381, ...
    0.0775714938400459, ...
   -0.0062414902127983, ...
   -0.0125807519990820, ...
    0.0033357252854738 ];

  a_norm = sum ( abs ( c(1:10) ) );
  b_norm = a_norm;
  value = a_norm * b_norm;

  return
end
