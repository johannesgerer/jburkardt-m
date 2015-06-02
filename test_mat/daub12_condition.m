function value = daub12_condition ( n )

%*****************************************************************************80
%
%% DAUB12_DETERMINANT returns the L1 condition of the DAUB12 matrix.
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
    0.1115407433501095, ...
    0.4946238903984533, ...
    0.7511339080210959, ...
    0.3152503517091982, ...
   -0.2262646939654400, ...
   -0.1297668675672625, ...
    0.0975016055873225, ...
    0.0275228655303053, ...
   -0.0315820393174862, ...
    0.0005538422011614, ...
    0.0047772575109455, ...
   -0.0010773010853085 ];

  a_norm = sum ( abs ( c(1:12) ) );
  b_norm = a_norm;
  value = a_norm * b_norm;

  return
end
