function k = nim_sum ( i, j )

%*****************************************************************************80
%
%% NIM_SUM computes the Nim sum of two integers.
%
%  Discussion:
%
%    If K is the Nim sum of I and J, then each bit of K is the exclusive
%    OR of the corresponding bits of I and J.
%
%  Example:
%
%     I     J     K     I base 2    J base 2    K base 2
%   ----  ----  ----  ----------  ----------  ----------
%      0     0     0           0           0           0
%      1     0     1           1           0           1
%      1     1     0           1           1           0
%      2     7     5          10         111         101
%     11    28    23        1011       11100       10111
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 November 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer I, J, the integers to be Nim-summed.
%
%    Output, integer K, the Nim sum of I and J.
%
  nbits = 32;

  ivec = ui4_to_ubvec ( i, nbits );
  jvec = ui4_to_ubvec ( j, nbits );

  kvec = bvec_xor ( nbits, ivec, jvec );

  k = ubvec_to_ui4 ( nbits, kvec );

  return
end
