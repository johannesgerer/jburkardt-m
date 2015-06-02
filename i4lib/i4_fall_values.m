function [ n_data, m, n, fmn ] = i4_fall_values ( n_data )

%*****************************************************************************80
%
%% I4_FALL_VALUES returns values of the integer falling factorial function.
%
%  Discussion:
%
%    The definition of the falling factorial function is
%
%      (m)_n = (m)! / (m-n)!
%            = ( m ) * ( m - 1 ) * ( m - 2 ) ... * ( m - n + 1 )
%            = Gamma ( m + 1 ) / Gamma ( m - n + 1 )
%
%    We assume 0 <= N <= M.
%
%    In Mathematica, the function can be evaluated by:
%
%      FactorialPower[m,n]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 December 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz and Irene Stegun,
%    Handbook of Mathematical Functions,
%    US Department of Commerce, 1964.
%
%    Stephen Wolfram,
%    The Mathematica Book,
%    Fourth Edition,
%    Wolfram Media / Cambridge University Press, 1999.
%
%  Parameters:
%
%    Input/output, integer N_DATA.  The user sets N_DATA to 0 before the
%    first call.  On each call, the routine increments N_DATA by 1, and
%    returns the corresponding data; when there is no more data, the
%    output value of N_DATA will be 0 again.
%
%    Output, integer M, N, the arguments of the function.
%
%    Output, integer FMN, the value of the function.
%
  n_max = 15;

  fmn_vec = [ ...
     1, 5, 20, 60, 120, ...
     120, 0, 1, 10, 4000, ...
      90, 4896, 24, 912576, 0 ];

  m_vec = [ ...
    5, 5, 5, 5, 5, ...
    5, 5, 50, 10, 4000, ...
    10, 18, 4, 98, 1 ];

  n_vec = [ ...
    0, 1, 2, 3, 4, ...
    5, 6, 0, 1, 1, ...
    2, 3, 4, 3, 7 ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    m = 0;
    n = 0;
    fmn = 0;
  else
    m = m_vec(n_data);
    n = n_vec(n_data);
    fmn = fmn_vec(n_data);
  end

  return
end
