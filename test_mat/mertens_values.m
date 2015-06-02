function [ n_data, n, c ] = mertens_values ( n_data )

%*****************************************************************************80
%
%% MERTENS_VALUES returns some values of the Mertens function.
%
%  Discussion:
%
%    The Mertens function M(N) is the sum from 1 to N of the Moebius
%    function MU.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    M Deleglise, J Rivat,
%    Computing the Summation of the Moebius Function,
%    Experimental Mathematics,
%    Volume 5, 1996, pages 291-295.
%
%    Eric Weisstein,
%    CRC Concise Encyclopedia of Mathematics,
%    CRC Press, 2002,
%    Second edition,
%    ISBN: 1584883472,
%    LC: QA5.W45.
%
%  Parameters:
%
%    Input, integer N_DATA, indicates the index of the previous test data
%    returned, or is 0 if this is the first call.  For repeated calls,
%    set the input value of N_DATA to the output value of N_DATA
%    from the previous call.
%
%    Output, integer N_DATA, the index of the test data.
%
%    Output, integer N, the argument of the Mertens function.
%
%    Output, integer C, the value of the Mertens function.
%
  n_max = 15;
  c_vec = [ ...
      1,   0,  -1,   -1,  -2,  -1,  -2,  -2,   -2,  -1, ...
     -2,  -2,   1,    2, -23 ];
  n_vec = [ ...
      1,   2,   3,   4,   5,   6,   7,   8,   9,  10, ...
     11,  12,  100, 1000, 10000 ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    n = 0;
    c = 0;
  else
    n = n_vec(n_data);
    c = c_vec(n_data);
  end

  return
end
