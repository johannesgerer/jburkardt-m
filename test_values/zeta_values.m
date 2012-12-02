function [ n_data, n, zeta ] = zeta_values ( n_data )

%*****************************************************************************80
%
%% ZETA_VALUES returns some values of the Riemann Zeta function.
%
%  Discussion:
%
%    ZETA(N) = sum ( 1 <= I < Infinity ) 1 / I**N
%
%    In Mathematica, the function can be evaluated by:
%
%      Zeta[n]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2004
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
%    Output, integer N, the argument of the Zeta function.
%
%    Output, real ZETA, the value of the Zeta function.
%
  n_max = 15;

  n_vec = [ ...
     2, ...
     3, ...
     4, ...
     5, ...
     6, ...
     7, ...
     8, ...
     9, ...
    10, ...
    11, ...
    12, ...
    16, ...
    20, ...
    30, ...
    40 ];

  zeta_vec = [ ...
     0.164493406684822643647E+01, ...
     0.120205690315959428540E+01, ...
     0.108232323371113819152E+01, ...
     0.103692775514336992633E+01, ...
     0.101734306198444913971E+01, ...
     0.100834927738192282684E+01, ...
     0.100407735619794433939E+01, ...
     0.100200839292608221442E+01, ...
     0.100099457512781808534E+01, ...
     0.100049418860411946456E+01, ...
     0.100024608655330804830E+01, ...
     0.100001528225940865187E+01, ...
     0.100000095396203387280E+01, ...
     0.100000000093132743242E+01, ...
     0.100000000000090949478E+01 ]; 

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    n = 0;
    zeta = 0.0;
  else
    n = n_vec(n_data);
    zeta = zeta_vec(n_data);
  end

  return
end

